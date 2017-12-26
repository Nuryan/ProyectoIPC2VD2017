using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2_v.gato.Paginas_Maestras
{
    public partial class maestraAdministrador : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Paginas Usuarios/Admin/Usuarios/adminUsuariosMenu.aspx", true);
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            
            Session["correo"] = "sdfadsf";
            Session["numSesion"] = "0000000";
            Server.Transfer("~/Paginas Usuarios/Anonimos/Login.aspx", false);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Paginas Usuarios/Admin/Licencias/adminLicenciaMenu.aspx", true);
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Paginas Usuarios/Admin/Empresas/adminMenuEmpresas.aspx", true);
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Paginas Usuarios/Admin/Plataformas/adminMenuPlataformas.aspx", true);
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Paginas Usuarios/Admin/Profesiones/adminMenuProfesiones.aspx", true);
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Paginas Usuarios/Admin/Categorias/adminMenuCategoria.aspx", true);
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Paginas Usuarios/Admin/Software/adminSoftwareMenu.aspx", true);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Paginas Usuarios/Admin/Metricas/adminMenuMetrica.aspx", true);
        }
    }
}