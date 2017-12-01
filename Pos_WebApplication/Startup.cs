using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Pos_WebApplication.Startup))]
namespace Pos_WebApplication
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
