using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Genesis.SystemFrameworks
{
     public class Insurance
    {

        public string Id { get; set; }
        public string RazonSocial { get; set; }
        public string RFC { get; set; }
        public string Calle { get; set; }
        public string NoExt { get; set; }
        public string NoInt { get; set; }
        public string Colonia { get; set; }
        public string CP { get; set; }
        public string DelMun { get; set; }
        public string Ciudad { get; set; }
        public string Telefono { get; set; }
        public string Telefono2 { get; set; }
        public string Telefono3 { get; set; }
        public string Mail { get; set; }
        public string Nombre { get; set; }
        public string Paterno { get; set; }
        public string Materno { get; set; }
        public bool Status { get; set; }


        public Insurance() {
            Id = String.Empty;
            RazonSocial = string.Empty;
            RFC = string.Empty;
            Calle = string.Empty;
            NoExt = string.Empty;
            NoInt = string.Empty;
            Colonia = string.Empty;
            CP = string.Empty;
            DelMun = string.Empty;
            Ciudad = string.Empty;
            Telefono = string.Empty;
            Telefono2 = string.Empty;
            Telefono3 = string.Empty;
            Mail = string.Empty;
            Nombre = string.Empty;
            Paterno = string.Empty;
            Materno = string.Empty;
            Status = false;
        
        }
    }
}
