using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC.Paginas.Todos
{
    public partial class inicioSesion : System.Web.UI.Page
    {
        WSProyecto.Servicios conector = new WSProyecto.Servicios();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Length >0 && TextBox2.Text.Length>0 && TextBox3.Text.Length>0)
            {
                if (conector.iniciarSesion(TextBox1.Text, TextBox2.Text, TextBox3.Text) == true)
                {
                    Random rnd = new Random();
                    int numSesion = rnd.Next();
                    conector.insertNumSession(TextBox1.Text, numSesion);
                    Session["numSesion"] = numSesion;
                    Session["tipoUsuario"] = conector.getTipoUsuario(TextBox1.Text);
                    Session["usuario"] = TextBox1.Text;

                    Server.Transfer("portal.aspx", true);
                }
                else
                {
                    Label1.Text = "Alguno de los campos es incorrecto";
                }
            }
            
        }

    }
}