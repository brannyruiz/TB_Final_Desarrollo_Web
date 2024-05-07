using System;
using System.Collections.Generic;
using System.Text;

namespace DBEntity
{
    public class EntityUser : EntityBase
    {
        public int IdUsuario { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Login { get; set; }
        public string Clave { get; set; }
        public string DNI { get; set; }
        public string Correo { get; set; }
        public bool Habilitado { get; set; }
        public string token {  get; set; }  

    }
}
