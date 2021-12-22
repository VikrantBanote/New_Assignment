<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewAsset.aspx.cs" Inherits="New_Assignment.newasset" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Asset</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 text-center">
               <h4 style="background-color:aqua">SOCIETY BILLING SOFTWARE</h4>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-success">
        <div class="container">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto mb-2 mb-lg-0">
                    <li class="nav-item" style="background-color:cadetblue">
                        <a class="nav-link text-white" aria-current="page" href="Home.aspx">Home</a>
                    </li>
                    <li class="nav-item" style="background-color:cadetblue">
                        <a class="nav-link text-white" href="Vendors.aspx">Vendors</a>
                    </li>
                    <li class="nav-item" style="background-color:cadetblue">
                        <a class="nav-link text-white" href="AssetList.aspx">Asset List</a>
                    </li>
                    <li class="nav-item" style="background-color:cadetblue">
                        <a class="nav-link text-white" href="NewAsset.aspx">New Asset</a>
                    </li>
                    <li class="nav-item" style="background-color:cadetblue">
                        <a class="nav-link text-white" href="Reports.aspx">Report</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <form id="form1" runat="server" style="min-height:650px; text-align:center;">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <h1><b>New Assets</b></h1>
        <asp:Label ID="Label1" runat="server" Text="Asset ID"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="newassetid" runat="server" AutoComplete="off" ReadOnly="true"></asp:TextBox>
        <br />
        <br />

        <asp:Label ID="Label2" runat="server" Text="Asset Name"></asp:Label>
        &nbsp;<asp:TextBox ID="newassetname" runat="server"  AutoComplete="off"></asp:TextBox>
        <br />
        <br />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:Label ID="Label3" runat="server" Text="Vendor Name" AutoComplete="off"></asp:Label>
        &nbsp;<asp:DropDownList ID="DropDownList1" DataValueField="VendorName" runat="server">
            <asp:ListItem>Please Select The Vendor Name</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="Purchase Date"></asp:Label>
        &nbsp;<asp:TextBox ID="newassetpurchase" runat="server"  AutoComplete="off"></asp:TextBox>
       <ajaxToolkit:CalendarExtender ID="newassetpurchase_CalendarExtender" runat="server" BehaviorID="newassetpurchase_CalendarExtender" TargetControlID="newassetpurchase" />
       <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Cost" ></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="newassetcost" runat="server" AutoComplete="off"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        <br />
        <asp:Label ID="Label6" runat="server"></asp:Label>
    </form>
        </fieldset>
    <form  class="text-center">
    <footer class="align-content-center" style="background-color:aqua" id="footer" >copyright: 2021 Hello Private Limited. All rights reserved.</footer>
 </form>
</body>
</html>
