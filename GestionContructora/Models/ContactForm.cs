using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GestionContructora.Models
{
    [Table("Contactos")]
    public class ContactForm
    {
        [Key]
        public int Id { get; set; } 

        [Required]
        public string Nombre { get; set; }

        [Required]
        [EmailAddress]
        public string Correo { get; set; }

        [Required]
        public string Mensaje { get; set; }

        public DateTime Fecha { get; set; }
    }
}