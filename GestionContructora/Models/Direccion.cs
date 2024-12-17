using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GestionContructora.Models
{
    public class Direccion
    {
        public int DireccionID { get; set; }
        public string Provincia { get; set; }
        public string Canton { get; set; }
        public string Distrito { get; set; }
        public string OtrasSenas { get; set; }
    }
}