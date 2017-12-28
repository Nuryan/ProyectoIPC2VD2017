using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC.Paginas.Todos
{
    public partial class Conocimientos : System.Web.UI.Page
    {
        WSProyecto.Servicios conector = new WSProyecto.Servicios();
        protected void Page_Load(object sender, EventArgs e)
        {
            setKarma();
            llenarConocimientosUsuario();
            if (Page.IsPostBack)
            {
                return;
            }
            int auxiliarFor;
            String[] conocimientos = conector.getConocimientos();
            for (auxiliarFor = 0; auxiliarFor< conocimientos.Length; auxiliarFor++)
            {
                DropDownList1.Items.Add(conocimientos[auxiliarFor]);
            }
        }

        private void setKarma()
        {
            Label1.Text = conector.getKarmaTotal((String)Session["usuario"])+"";
        }

        private void llenarConocimientosUsuario()
        {
            DropDownList2.Items.Clear();
            int auxiliarFor;
            String[] conocimientosUsuario = conector.getConocimientosDeUsuario((String)Session["usuario"]);
            for (auxiliarFor=0; auxiliarFor<conocimientosUsuario.Length; auxiliarFor++)
            {
                DropDownList2.Items.Add(conocimientosUsuario[auxiliarFor]);
            }
        }

        protected void Button13_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}