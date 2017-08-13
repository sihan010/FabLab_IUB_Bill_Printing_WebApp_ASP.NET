<%@ Page Title="Bank Payment Voucher" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="BankPayment.aspx.cs" Inherits="BankPayment" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin-top:20px">
        <div class="row">
            <div class="col-md-2 well">
                <asp:Label ID="id" runat="server" Text=""></asp:Label><br />
                <asp:Button ID="logout" runat="server" Text="Log Out" OnClick="logout_Click" CssClass="btn btn-md btn-danger" />
            </div>
            <div class="col-md-offset-2 col-md-4 well">
                <asp:Label ID="op" runat="server" Text="Bank Payment Voucher"></asp:Label><hr />
                  
                <asp:Label ID="Label1" runat="server" Text="Paid to:"></asp:Label><br />
                <asp:TextBox ID="paid" runat="server"></asp:TextBox><br />

                <asp:Label ID="Label2" runat="server" Text="Initial Taka:"></asp:Label><br />
                <asp:TextBox ID="initial" runat="server"></asp:TextBox><br />

                <asp:Label ID="Label9" runat="server" Text="Bank Account:"></asp:Label><br />
                <asp:TextBox ID="bank" runat="server"></asp:TextBox><br />

                <asp:Label ID="Label10" runat="server" Text="Cheque Number:"></asp:Label><br />
                <asp:TextBox ID="cheque" runat="server"></asp:TextBox><br />

                <asp:Label ID="Label3" runat="server" Text="Project Activity:"></asp:Label><br />
                <asp:TextBox ID="activity" runat="server"></asp:TextBox><br />

                <asp:Label ID="Label4" runat="server" Text="Economic Code:"></asp:Label><br />
                <asp:TextBox ID="economic" runat="server"></asp:TextBox><br />

                <asp:Label ID="Label5" runat="server" Text="Description of Payment:"></asp:Label><br />
                <asp:TextBox ID="description" runat="server"></asp:TextBox><br />

                <asp:Label ID="Label6" runat="server" Text="Vat: (in Parcentage)"></asp:Label><br />
                <asp:TextBox ID="vat" runat="server"></asp:TextBox><br />

                <asp:Label ID="Label7" runat="server" Text="Tax: (in Parcentage)"></asp:Label><br />
                <asp:TextBox ID="tax" runat="server"></asp:TextBox><br /><br />

                <asp:Button ID="submit" runat="server" Text="Submit" CssClass="btn btn-md btn-primary" OnClick="submit_Click" />
                <asp:Label ID="Label8" runat="server" Text=""></asp:Label>            
            </div>
         </div>
    </div>    
</asp:Content>