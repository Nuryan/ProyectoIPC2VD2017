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
            llenarTablaDeConocimientos();
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

            if(conocimientosUsuario != null)
            {
                for (auxiliarFor = 0; auxiliarFor < conocimientosUsuario.Length; auxiliarFor++)
                {
                    DropDownList2.Items.Add(conocimientosUsuario[auxiliarFor]);
                }
            }
        }

        private void llenarTablaDeConocimientos()
        {
            //comienza creacion de tabla
            String[] contactos = conector.getConocimientosDeUsuario((String)Session["usuario"]);
            if (contactos == null)
            {
                return;
            }

            int totalFilas = contactos.Length;
            int filaActual;
            int columnaActual;
            int totalColumnas = 1;

            for (filaActual = 0; filaActual <= totalFilas; filaActual++)
            {

                TableRow tabla = new TableRow();
                Table1.Rows.Add(tabla);
                Table1.BorderWidth = 1;
                tabla.BorderWidth = 1;
                for (columnaActual = 0; columnaActual < totalColumnas; columnaActual++)
                {

                    TableCell celda = new TableCell();
                    if (filaActual == 0)
                    {
                        celda.Text = "Conocimientos";
                    }
                    else
                    {
                        celda.Text = contactos[filaActual - 1].ToString();
                    }
                    //tCell.Text = "Row " + filaActual + ", Cell " + columnaActual;
                    tabla.Cells.Add(celda);
                    celda.BorderWidth = 1;
                    celda.Width = 400;
                    celda.Height = 50;
                    celda.HorizontalAlign = HorizontalAlign.Center;
                }
            }
        }

        protected void Button13_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int dominio =0;
            String formaAprendido = "";
            String comentario = "";

            if (TextBox1.Text.Length<1)
            {
                formaAprendido = "Pendiente de Agregar";
            }
            if (TextBox2.Text.Length<1)
            {
                comentario = "Pendiente de agregar";
            }
            if (TextBox3.Text.Length<1)
            {
                dominio = 0;
            }
            else
            {
                dominio = Convert.ToInt32(TextBox3.Text);
            }
            String usuario = (String)Session["usuario"];

            int añadido = conector.agregarConocimiento(DropDownList1.Text, usuario, dominio, formaAprendido, comentario);
            
        }
    }
}