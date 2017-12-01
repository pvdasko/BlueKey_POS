using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(POS_Application.Startup))]
namespace POS_Application
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
