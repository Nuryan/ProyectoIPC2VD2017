<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/Maestra/maestraLoginYCreacionExterna.Master" AutoEventWireup="true" CodeBehind="crearUsuarioDesdeLogin.aspx.cs" Inherits="Proyecto_IPC2_v.gato.Paginas_Usuarios.Anonimos.crearUsuarioDesdeLogin" %>

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
                    Nombres:*<br />
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="alin">
                   
            Apellidos:*<br />
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="alin">
                   
                    Apodo: *<br />
                </td>
                <td>
                     &nbsp;</td>
            </tr>
            <tr>
                <td class="alin">
                   
            Contraseña:<br />
                </td>
                <td>
                    &nbsp;</td>
            </tr><tr>
                <td class="alin">
                   
            Repita la Contraseña:<br />
                </td>
                <td>
                    &nbsp;</td>
            </tr><tr>
                <td class="alin">
                   
            Pregunta Secreta:<br />
                </td>
                <td>
                     &nbsp;</td>
            </tr><tr>
                <td class="alin">
                   
            Respuesta Secreta: <br />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Crear Usuario" OnClick="Button1_Click1"></asp:Button>
            <br />
<asp:Button ID="Button2" runat="server" Text="Ir  a inicio de sesion" OnClick="Button2_Click"></asp:Button>
            </center>


    </div>
</asp:Content>
