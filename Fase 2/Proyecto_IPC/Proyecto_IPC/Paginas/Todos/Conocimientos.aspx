<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/Maestra/maestraInterfaz.Master" AutoEventWireup="true" CodeBehind="Conocimientos.aspx.cs" Inherits="Proyecto_IPC.Paginas.Todos.Conocimientos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="div2" runat="server">
    <div class="titulo">
        Conocimientos
    </div><br /><br />
    <div class="titulo">Karma: <asp:Label ID="Label1" runat="server" Text=""></asp:Label></div>
    <br />
    <br />
    <center>
        Agregar Conocimiento:<br />
        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
        &nbsp;Forma de Aprendizaje: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        &nbsp;
        Comentario: <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        &nbsp;Dominio(%):
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        &nbsp;
        <asp:Button ID="Button1" runat="server" Text="Agregar" OnClick="Button1_Click"></asp:Button>
        <br />
        <br />
        Eliminar Conocimiento:<br />
        <asp:DropDownList ID="DropDownList2" runat="server">
        </asp:DropDownList>
&nbsp;<asp:Button ID="Button13" runat="server" OnClick="Button13_Click" Text="Eliminar" />
        <br />
        <br />
        Conocimientos Acutales:<br />
        <br />
        <asp:Table ID="Table1" runat="server">
        </asp:Table>
    </center>
</asp:Content>
