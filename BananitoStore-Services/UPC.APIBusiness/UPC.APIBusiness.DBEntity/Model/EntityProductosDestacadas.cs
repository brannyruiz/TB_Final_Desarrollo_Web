using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBEntity
{
    public class EntityProductosDestacadas
    {
        public int id_marca { get; set; }
        public int id_articulo { get; set; }
        public string marca { get; set; }
        public string descripcion { get; set;}
        public decimal precio { get; set; } 
        public decimal precio_descuento { get; set; }   
        public string imagen { get; set; }  
        public decimal descuento { get; set; }
        public bool nuevo { get; set; }
        public int talla { get; set; } 
        public int cantidad { get; set; }



    }
}
