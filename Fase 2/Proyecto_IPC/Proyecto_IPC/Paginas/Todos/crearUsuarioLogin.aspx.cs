using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC.Paginas.Todos
{
    public partial class crearUsuarioLogin : System.Web.UI.Page
    {
        WSProyecto.Servicios conector = new WSProyecto.Servicios();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (pass.Text.Equals(passRepetido.Text))
            {
                if (nombres.Text.Length > 0 &&
                    apellidos.Text.Length > 0 &&
                    apodo.Text.Length > 0 &&
                    pass.Text.Length > 0 &&
                    passRepetido.Text.Length > 0 &&
                    llave.Text.Length > 0)
                {
                    if (conector.crearUsuario(nombres.Text, apellidos.Text, pass.Text, apodo.Text, llave.Text) == 1)
                    {
                        Label1.Text = "Usuario creado!";
                    }
                    else
                    {
                        Label1.Text = "No se ha podido crear el usuario";
                    }
                }
            }
            else
            {
                Label1.Text = "Las contraseñas no coinciden";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Server.Transfer("inicioSesion.aspx", false);
        }
    }
}