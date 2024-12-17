using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GestionContructora.Models
{
    public class Categoria
    {
        public int CategoriaID { get; set; }
        public string Nombre { get; set; }
        public ICollection<Empleado> Empleados { get; set; }
    }
}