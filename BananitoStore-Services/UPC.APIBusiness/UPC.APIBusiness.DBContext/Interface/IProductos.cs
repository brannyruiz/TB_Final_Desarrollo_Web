using DBEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBContext
{
    public interface IProductos
    {
        EntityBaseResponse GetProductosDestacados();

        EntityBaseResponse GetProductos_x_Marca(int idMarca);

        EntityBaseResponse GetProductos_x_Oferta();

        EntityBaseResponse GetDetalleProducto(int idProducto);


    }
}
