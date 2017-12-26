<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas Maestras/maestraLoginYCreacionExterna.Master" AutoEventWireup="true" CodeBehind="crearUsuarioDesdeLogin.aspx.cs" Inherits="Proyecto_IPC2_v.gato.Paginas_Usuarios.Anonimos.crearUsuarioDesdeLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Cuerpo" runat="server">
    <style type="text/css">
        .alin {
            text-align: right;
        }
    </style>
    <p class="titulo">
        Crear Usuario
    </p>
    <div style="width: 100%">
        <center>
        <table>
            <tr>
                <td class="alin">
                    Primer Nombre:<br />
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="alin">
                   
            Segundo Nombre:<br />
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="alin">
            Primer Apellido:<br />
                   
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="alin">
                   
            Segundo Apellido:<br />
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="alin"> 
            Correo Electronico:<br />
                </td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="alin">
                   
            Profesión:<br />
                </td>
                <td>
                     <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="nombre">
                     </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:proyecto1IPC2ConnectionString %>" SelectCommand="SELECT [nombre] FROM [Profesion]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="alin">
                   
            Fecha de Nacimiento<br />
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server">
            </asp:DropDownList>
            / <asp:DropDownList ID="DropDownList2" runat="server">
            </asp:DropDownList>
            &nbsp;/
            
            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList> 
                </td>
            </tr>
            <tr>
                <td class="alin">
                   
            Contraseña:<br />
                </td>
                <td>
                    <asp:TextBox ID="TextBox7" TextMode="Password" runat="server"></asp:TextBox>
                </td>
            </tr><tr>
                <td class="alin">
                   
            Repita la Contraseña:<br />
                </td>
                <td>
                    <asp:TextBox ID="TextBox8" TextMode="Password" runat="server"></asp:TextBox>
                </td>
            </tr><tr>
                <td class="alin">
                   
            Pregunta Secreta:<br />
                </td>
                <td>
                     <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource1" DataTextField="pregunta" DataValueField="pregunta">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:proyecto1IPC2ConnectionString %>" SelectCommand="SELECT [pregunta] FROM [PreguntasContraseña]"></asp:SqlDataSource>
           
                </td>
            </tr><tr>
                <td class="alin">
                   
            Respuesta Secreta: <br />
                </td>
                <td>
                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Crear Usuario" OnClick="Button1_Click1"></asp:Button>
            <br />
<asp:Button ID="Button2" runat="server" Text="Ir  a inicio de sesion" OnClick="Button2_Click"></asp:Button>
            </center>


    </div>
</asp:Content>
