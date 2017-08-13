<%@ Page Language="C#" CodeFile="BankBill.aspx.cs" Inherits="BankBill" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-bottom:10px;text-align:center;margin-top:100px">
            <h2>FabLab IU Bangladesh</h2>
            <h3>(CP 5013, HEQEP, UGC)</h3>
            <h2>Independent University, Bangladesh (IUB)</h2>
            <h4>Plot-16, Block-B, Aftabuddin Road, Bashundhara, Dhaka-1229</h4>
            <p style="font-size:22px;font-weight:800"><u>Bank Payment Voucher</u></p>
        </div>
        <div style="overflow:hidden">
            <div style="float:left;width:50%">                
                <p style="font-size:18px;padding-left:80px">Paid to : <asp:Label ID="paid" runat="server" Text="Gveat Deal"></asp:Label> </p>
                <p style="font-size:18px;padding-left:80px">Bank Account : <asp:Label ID="bank" runat="server" Text="Gveat Deal"></asp:Label> </p>
                <p style="font-size:18px;padding-left:80px">Cheque Number : <asp:Label ID="cheque" runat="server" Text="Gveat Deal"></asp:Label> </p>
            </div>
            <div style="float:left;width:50%">
                <p style="font-size:18px;padding-left:80px">Taka: <u>  <asp:Label ID="taka" runat="server" Text="20250"></asp:Label> </u></p>
                <p style="font-size:18px;padding-left:80px">Voucher No: <u>  <asp:Label ID="voucher" runat="server" Text="database"></asp:Label> </u></p>
                <p style="font-size:18px;padding-left:80px">Date: <u>  <asp:Label ID="date" runat="server" Text="This is date"></asp:Label> </u></p>
            </div>
        </div>

        <table style="border: 3px solid black;border-collapse: collapse;width:90%;margin-left:5%;margin-right:5%;text-align:center;font-size:18px">
	        <tbody>
		        <tr>
			        <td rowspan="3" style="border:3px solid black;border-collapse: collapse;padding:2px;width:30%">Project Activity / Account / Economic Code</td>
			        <td rowspan="3" style="border:3px solid black;border-collapse: collapse;padding:2px;width:30%">Description Of Paymenty</td>
			        <td colspan="4" style="border: 1px solid #595959;border-collapse: collapse;padding:2px">Detail of Payment Taka</td>
		        </tr>
		        <tr>
			        <td rowspan="2" style="border:3px solid black;border-collapse: collapse;padding:2px">Cash</td>
			        <td colspan="2" style="border:3px solid black;border-collapse: collapse;padding:2px">Deduction at Source</td>
			        <td rowspan="2" style="border:3px solid black;border-collapse: collapse;padding:2px">Total</td>
		        </tr>
		        <tr>
			        <td style="border:3px solid black;border-collapse: collapse;padding:2px;width:8%">Income Tax</td>
			        <td style="border:3px solid black;border-collapse: collapse;padding:2px;width:8%">VAT</td>
		        </tr>
		        <tr>
			        <td style="border:3px solid black;border-collapse: collapse;padding:5px;height:300px">
                        <asp:Label ID="project" runat="server" Text=""></asp:Label><br />
                        <asp:Label ID="eco" runat="server" Text=""></asp:Label></td>
			        <td style="border:3px solid black;border-collapse: collapse;padding:5px;height:300px">
                        <asp:Label ID="description" runat="server" Text=""></asp:Label></td>
			        <td style="border:3px solid black;border-collapse: collapse;padding:5px;height:300px">
                        <asp:Label ID="initial" runat="server" Text=""></asp:Label></td>
			        <td style="border:3px solid black;border-collapse: collapse;padding:5px;height:300px">
                        <asp:Label ID="tax" runat="server" Text=""></asp:Label></td>
			        <td style="border:3px solid black;border-collapse: collapse;padding:5px;height:300px">
                        <asp:Label ID="vat" runat="server" Text=""></asp:Label></td>
			        <td style="border:3px solid black;border-collapse: collapse;padding:5px;height:300px">
                        <asp:Label ID="total" runat="server" Text=""></asp:Label></td>
		        </tr>
		        <tr>
			        <td colspan="2" style="border:3px solid black;border-collapse: collapse;height:25px;">Total Taka</td>
			        <td style="border:3px solid black;border-collapse: collapse;height:25px;"><asp:Label ID="initialF" runat="server" Text=""></asp:Label></td>
			        <td style="border:3px solid black;border-collapse: collapse;height:25px;"><asp:Label ID="taxF" runat="server" Text=""></asp:Label></td>
			        <td style="border:3px solid black;border-collapse: collapse;height:25px;"><asp:Label ID="vatF" runat="server" Text=""></asp:Label></td>
			        <td style="border:3px solid black;border-collapse: collapse;height:25px;"><asp:Label ID="totalF" runat="server" Text=""></asp:Label></td>
		        </tr>
	        </tbody>
        </table><br />
        <div>                
             <p style="font-size:18px;padding-left:80px">In Word Taka : <asp:Label ID="word" runat="server" Text=""></asp:Label> </p><br />
        </div>

        <div style="overflow:hidden;margin-left:5%;margin-right:5%;text-align:center">
            <div style="float:left;width:30%">                
                <p style="font-size:18px;padding-left:80px">Prepared By</p><br /><br /><br /><br />
                <p style="font-size:18px;padding-left:80px">__________</p>
                <p style="font-size:18px;padding-left:80px">Accountant</p>
            </div>
            <div style="float:left;width:30%">
                <p style="font-size:18px;padding-left:80px">Checked By</p> <br /><br /><br /><br />  
                <p style="font-size:18px;padding-left:80px">__________</p>
                <p style="font-size:18px;padding-left:80px">Deputy SPM</p>             
            </div>
            <div style="float:left;width:30%">
                <p style="font-size:18px;padding-left:80px">Approved By</p> <br /><br /><br /><br /> 
                <p style="font-size:18px;padding-left:80px">___________________</p>
                <p style="font-size:18px;padding-left:80px">Sub-Project Manager</p>
            </div>
        </div>

        <div style="overflow:hidden;margin-left:5%;margin-right:5%;text-align:center;margin-top:50px">
            <div style="float:left;width:50%">                
                <p style="font-size:18px;padding-left:80px">Received By</p><br />
                <p style="font-size:18px;padding-left:80px">Signature ____________________________</p><br />
                <p style="font-size:18px;padding-left:80px">Name _________________________________</p><br />
            </div>           
        </div>
    </form>
</body>
</html>