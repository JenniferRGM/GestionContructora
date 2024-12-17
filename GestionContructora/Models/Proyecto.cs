using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GestionContructora.Models
{
    public class Proyecto
    {
        public int ProyectoID { get; set; }
        public string CodigoProyecto { get; set; }
        public string Nombre { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime? FechaFinalizacion { get; set; }
    }
}