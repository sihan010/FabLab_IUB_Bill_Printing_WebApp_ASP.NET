<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin-top:20px">
        <div class="row">
            <div class="col-md-offset-4 col-md-4 col-md-offset-4 well">
                <asp:Label ID="U" runat="server" Text="User ID:"></asp:Label><br />
                <asp:TextBox ID="user" runat="server"></asp:TextBox><br />
                <asp:Label ID="P" runat="server" Text="Password:"></asp:Label><br />
                <asp:TextBox ID="pass" runat="server" TextMode="Password"></asp:TextBox><br /><br />
                <asp:Button ID="login" runat="server" Text="Login" OnClick="login_Click" CssClass="btn btn-md btn-success" /><br />
            </div>
         </div>
    </div>
    
</asp:Content>
