using API.Security;
using DBContext;
using DBEntity;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using NSwag.Annotations;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Threading.Tasks;

namespace API.Controllers
{

    /// <summary>
    /// 
    /// </summary>
    [Produces("application/json")]
    [Route("api/productos")]
    public class ProductosController : Controller
    {

        /// <summary>
        /// 
        /// </summary>
        protected readonly IProductos _productos;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="productos"></param>
        public ProductosController(IProductos productos)
        {
            _productos = productos;
        }


        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpGet]
        [Route("listarProductosDestacados")]
        public ActionResult GetProductosDestacados()
        {
            var rest = _productos.GetProductosDestacados();
            return Json(rest);
        }



        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpGet]
        [Route("listarProductosMarcas")]
        public ActionResult GetProductosMarcas(int idMarca)
        {
            var rest = _productos.GetProductos_x_Marca(idMarca);
          
            return Json(rest);
        }



        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpGet]
        [Route("listarProductosOfertas")]
        public ActionResult GetProductosOfertas()
        {
            var rest = _productos.GetProductos_x_Oferta();
            return Json(rest);
        }


    }
}
