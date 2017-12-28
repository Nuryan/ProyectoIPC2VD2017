using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC.Paginas.Todos
{
    public partial class contactos : System.Web.UI.Page
    {
        WSProyecto.Servicios conector = new WSProyecto.Servicios();
        protected void Page_Load(object sender, EventArgs e)
        {
            llenarContactos();
        }

        private void llenarContactos()
        {
            //comienza creacion de tabla
            String[] contactos = conector.getContactos((String)Session["usuario"]);
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
                        celda.Text = "Contactos";
                    }
                    else
                    {
                        celda.Text = contactos[filaActual-1].ToString();
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

        protected void Button14_Click(object sender, EventArgs e)
        {

        }

        protected void Button13_Click(object sender, EventArgs e)
        {

        }
    }
}