//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GestionContructora.Controllers
{
    using System;
    using System.Collections.Generic;
    
    public partial class Asignaciones
    {
        public int AsignacionID { get; set; }
        public int EmpleadoID { get; set; }
        public int ProyectoID { get; set; }
        public Nullable<System.DateTime> FechaAsignacion { get; set; }
    
        public virtual Empleados Empleados { get; set; }
        public virtual Proyectos Proyectos { get; set; }
    }
}
