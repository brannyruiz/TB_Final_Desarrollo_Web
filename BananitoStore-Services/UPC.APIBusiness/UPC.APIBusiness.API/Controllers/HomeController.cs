using Microsoft.AspNetCore.Mvc;

namespace UPC.APIBusiness.API.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
