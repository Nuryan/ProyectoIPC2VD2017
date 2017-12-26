<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/Maestra/maestraLoginYCreacionExterna.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Proyecto_IPC2_v.gato.Paginas_Usuarios.Anonimos.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="Cuerpo">
    <p class="titulo">
        <br />
        ReviewSoft
    </p>
    <br />
    <div style ="width:100%">
        <div class="centradoIzquierda">

            Apodo:<br />
            Contraseña:<br />
            Cod.Seguridad</div>
        <div class ="centradoDerecha">

            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBox2" TextMode="Password" runat="server"></asp:TextBox>

            <br />
            <asp:TextBox ID="TextBox3" TextMode="Password" runat="server"></asp:TextBox>

        </div>
        <center>

            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Iniciar Sesión" Width="150px"/>
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Crear Usuario" Width="150px"/>

            <br />
            <asp:Button ID="Button3" runat="server" OnClick="Button2_Click" Text="Recordar Contraseña" Width="150px"/>

        </center>
    </div>
</asp:Content>


