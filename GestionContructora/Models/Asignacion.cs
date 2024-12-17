using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GestionContructora.Models
{
    public class Asignacion
    {
        public int AsignacionID { get; set; }
        public int EmpleadoID { get; set; }
        public Empleado Empleado { get; set; }
        public int ProyectoID { get; set; }
        public Proyecto Proyecto { get; set; }
        public DateTime FechaAsignacion { get; set; } = DateTime.Today;
    }
}