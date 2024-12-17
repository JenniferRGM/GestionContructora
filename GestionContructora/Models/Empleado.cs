using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GestionContructora.Models
{
    public class Empleado
    {
        public int EmpleadoID { get; set; }
        public string Carnet { get; set; }
        public string Nombre { get; set; }
        public string Apellido1 { get; set; }
        public string Apellido2 { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public int DireccionID { get; set; }
        public Direccion Direccion { get; set; }
        public string Telefono { get; set; }
        public string Correo { get; set; }
        public decimal Salario { get; set; }
        public int CategoriaID { get; set; }
        public Categoria Categoria { get; set; }
    }
}