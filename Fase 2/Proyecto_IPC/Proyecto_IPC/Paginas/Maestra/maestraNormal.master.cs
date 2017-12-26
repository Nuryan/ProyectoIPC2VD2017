using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2_v.gato.Paginas_Maestras
{
    public partial class maestraNormal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["numSesion"] = null;
            Session["correo"] = null;
            Server.Transfer("~/ Paginas Usuarios / Anonimos / Login.aspx", false);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Paginas Usuarios/Free/gratuitoBuscar.aspx", false);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Paginas Usuarios/Free/gratuitoModificarUsuario.aspx", false);
        }
    }
}