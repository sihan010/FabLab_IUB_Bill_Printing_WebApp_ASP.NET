<%@ Page Title="Option Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Option.aspx.cs" Inherits="Option" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin-top:20px">
        <div class="row">
            <div class="col-md-2 well">
                <asp:Label ID="id" runat="server" Text=""></asp:Label><br />
                <asp:Button ID="logout" runat="server" Text="Log Out" OnClick="logout_Click" CssClass="btn btn-md btn-danger"/>
            </div>
            <div class="col-md-offset-2 col-md-4 well">
                <asp:Label ID="Label3" runat="server" Text="Create New Bill"></asp:Label><hr />
                <asp:Label ID="op" runat="server" Text="Select a Type:"></asp:Label><br /><br />
                <asp:DropDownList ID="option" runat="server" Height="28px">
                    <asp:ListItem Value="1">Bank Payment Voucher</asp:ListItem>
                    <asp:ListItem Value="2">Imprest Payment Voucher</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="go" runat="server" Text="GO" OnClick="go_Click" CssClass="btn btn-md btn-primary"/>
            </div>

            <div class="col-md-offset-4 col-md-4 well">
                <asp:Label ID="Label4" runat="server" Text="Download Old Bill"></asp:Label><hr />
                <asp:Label ID="Label1" runat="server" Text="Select a Type:"></asp:Label><br /><br />
                <asp:DropDownList ID="option1" runat="server" Height="28px">
                    <asp:ListItem Value="1">Bank Payment Voucher</asp:ListItem>
                    <asp:ListItem Value="2">Imprest Payment Voucher</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="gen" runat="server" Text="Generate" OnClick="gen_Click" CssClass="btn btn-md btn-primary"/><br /><br />
                <asp:Label ID="Label2" runat="server" Text="Select a Voucher ID:"></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" Height="28px" DataTextField="voucher" DataValueField="voucher"></asp:DropDownList>
                <asp:Button ID="go1" runat="server" Text="GO" OnClick="go1_Click" CssClass="btn btn-md btn-primary"/>
            </div>
         </div>
    </div>    
</asp:Content>
