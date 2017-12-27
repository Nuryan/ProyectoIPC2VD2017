using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC.Paginas.Maestra
{
    public partial class maestraInterfaz : System.Web.UI.MasterPage
    {
        WSProyecto.Servicios conector = new WSProyecto.Servicios();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null || Session["numSesion"] == null || Session["tipoUsuario"] == null)
            {
                Response.Redirect("~/Paginas/Todos/inicioSesion.aspx");
            }
            else if ((int)Session["numSesion"] != conector.getNumSession((string)Session["usuario"]))
            {
                Server.Transfer("~/Paginas Usuarios/Anonimos/Login.aspx", false);
            }

            if ((int)Session["tipoUsuario"]!=1)
            {
                Button7.Visible = false;
                Button8.Visible = false;
                Button9.Visible = false;
                Button10.Visible = false;
                Button11.Visible = false;
            }

            //Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            //Response.Cache.SetAllowResponseInBrowserHistory(false);
            //Response.Cache.SetNoStore();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Paginas/Todos/contactos.aspx", true);
        }
    }
}