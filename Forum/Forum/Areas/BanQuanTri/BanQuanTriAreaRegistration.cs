using System.Web.Mvc;

namespace Forum.Areas.BanQuanTri
{
    public class BanQuanTriAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "BanQuanTri";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "BanQuanTri_default",
                "BanQuanTri/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}