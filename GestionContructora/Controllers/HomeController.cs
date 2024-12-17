using GestionContructora.Controllers;
using GestionContructora.Models;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;

namespace GestionConstructora.Controllers
{
    public class HomeController : Controller
    {
        private GestionConstructoraEntities db = new GestionConstructoraEntities();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Página de contacto para la empresa de construcción.";
            return View();
        }

        [HttpPost]
        public ActionResult Contact(ContactForm model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    // Guardar en la base de datos
                    var contacto = new ContactForm
                    {
                        Nombre = model.Nombre,
                        Correo = model.Correo,
                        Mensaje = model.Mensaje,
                        Fecha = DateTime.Now
                    };

                    db.ContactForm.Add(contacto); 
                    db.SaveChanges();             

                    // Configurar el correo electrónico
                    MailMessage correo = new MailMessage
                    {
                        From = new MailAddress("tucorreo@gmail.com"),
                        Subject = "Mensaje de Contacto - Gestión de Personal",
                        Body = $"Nombre: {model.Nombre}\n" +
                               $"Correo: {model.Correo}\n" +
                               $"Mensaje:\n{model.Mensaje}",
                        IsBodyHtml = false
                    };
                    correo.To.Add("soporte@constructora.com");

                    SmtpClient smtp = new SmtpClient
                    {
                        Host = "smtp.gmail.com",
                        Port = 587,
                        EnableSsl = true,
                        Credentials = new NetworkCredential("tucorreo@gmail.com", "tucontraseña")
                    };

                    smtp.Send(correo);

                    ViewBag.Message = "Tu mensaje ha sido enviado y guardado correctamente.";
                    ModelState.Clear();
                }
                catch (Exception ex)
                {
                    ViewBag.Error = $"Error al procesar tu solicitud: {ex.Message}";
                }
            }

            return View();
        }

    }
}
