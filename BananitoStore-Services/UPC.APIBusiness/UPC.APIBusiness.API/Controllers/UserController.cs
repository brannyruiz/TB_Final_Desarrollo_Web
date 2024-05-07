using DBContext;
using DBEntity;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using NSwag.Annotations;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Threading.Tasks;
using API.Security;

namespace UPC.Business.API.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [Produces("application/json")]
    [Route("api/User")]
    [ApiController]
    public class UserController : Controller
    {

        /// <summary>
        /// Constructor
        /// </summary>
        protected readonly IUserRepository _UserRepository;


        /// <summary>
        /// 
        /// </summary>
        /// <param name="UserRepository"></param>
        public UserController(IUserRepository UserRepository)
        {
            _UserRepository = UserRepository;

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="login"></param>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpPost]
        [Route("login")]
        public async Task<ActionResult> Login(EntityUserLogin login)
        {
            
            var rest = _UserRepository.Login(login);


            if(rest.Data != null)
            {
                var loginResponse = rest.Data as EntityUser;
                var UserId = loginResponse.IdUsuario;
                var UserDoc = loginResponse.DNI;

                var token = JsonConvert.DeserializeObject<AccessToken>(
                    await new Authentication().GenerateToken(UserDoc, UserId.ToString())
                    ).access_token;

                loginResponse.token = token;
                rest.Data = loginResponse;
            }

            return Json(rest);


        }




        //[Produces("application/json")]
        //[AllowAnonymous]
        //[HttpPost]
        //[Route("login")]
        //public ActionResult Login(EntityUserLogin login) 
        //{        
        //    var rest = _UserRepository.Login(login);
        //    return Json(rest);
        //}





    }
}