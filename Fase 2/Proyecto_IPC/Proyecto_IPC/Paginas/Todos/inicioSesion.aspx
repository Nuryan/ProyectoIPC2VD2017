<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/Maestra/maestraLoginYCreacionExterna.Master" AutoEventWireup="true" CodeBehind="inicioSesion.aspx.cs" Inherits="Proyecto_IPC.Paginas.Todos.inicioSesion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Cuerpo" runat="server">
    <p class="titulo">
        <br />
        Warlocks&#39;
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
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />

            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Iniciar Sesión" Width="150px"/>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Crear Usuario"  Width="150px"/>
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Recordar Contraseña"  Width="150px"/>
            <br />

            <br />

        </center>
    </div>
</asp:Content>
