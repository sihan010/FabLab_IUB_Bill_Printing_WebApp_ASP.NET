using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FabLabBillPrint.Startup))]
namespace FabLabBillPrint
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
