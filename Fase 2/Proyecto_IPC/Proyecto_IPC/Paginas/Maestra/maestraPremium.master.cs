using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2_v.gato.Paginas_Maestras
{
    public partial class maestraPremium : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
            Server.Transfer("~/Paginas Usuarios/Anonimos/Login.aspx", false);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("premiumBuscar.aspx");
            //Server.Transfer("premiumBuscar.aspx", true);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("premiumModificarUsuario.aspx");
        }
    }
}