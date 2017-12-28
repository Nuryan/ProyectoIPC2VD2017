<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/Maestra/maestraInterfaz.Master" AutoEventWireup="true" CodeBehind="contactos.aspx.cs" Inherits="Proyecto_IPC.Paginas.Todos.contactos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="div2" runat="server">
    <div class="titulo">Mis Contactos</div>
    <br />
    <center>
        Agregar Contacto:
        <br />
        Apodo: 
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button13" runat="server" Text="Agregar" />
        <br />
        <br />
        Eliminar Contacto<br />
        <br />
        Apodo:
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button14" runat="server" Text="Eliminar" OnClick="Button14_Click" />
        <br />
        <br />
        Lista de contactos Actuales<br />
        <br />
        
        <asp:Table ID="Table1" runat="server">
        </asp:Table>
        
    </center>
</asp:Content>
