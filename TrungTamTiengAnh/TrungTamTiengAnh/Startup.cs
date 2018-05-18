using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TrungTamTiengAnh.Startup))]
namespace TrungTamTiengAnh
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
