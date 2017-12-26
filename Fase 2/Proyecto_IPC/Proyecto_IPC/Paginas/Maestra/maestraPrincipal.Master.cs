
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2_v.gato.Paginas_Maestras
{
    public partial class maestraPrincipal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            //Response.Cache.SetAllowResponseInBrowserHistory(false);
            //Response.Cache.SetNoStore();
            //if (Session["correo"]== null || Session["numSesion"]== null)
            //{
            //    Server.Transfer("~/Paginas Usuarios/Anonimos/Login.aspx", false);
            //}
            //else if (Session["correo"] == null && Session["numSesion"] == null)
            //{
            //    Server.Transfer("~/Paginas Usuarios/Anonimos/Login.aspx", false);
            //}
            //else if (FuncionesUsuario.comprobarSesion((string)(Session["correo"]), (int)(Session["numSesion"])) != 1)
            //{
            //    Server.Transfer("~/Paginas Usuarios/Anonimos/Login.aspx", false);
            //}
        }
    }
}