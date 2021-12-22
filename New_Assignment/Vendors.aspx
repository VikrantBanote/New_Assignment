<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vendors.aspx.cs" Inherits="New_Assignment.Vendors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Vendor List</title>
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
    <form id="form1" runat="server" style="min-height:650px ">
        <div>
         <b>********** Vender Details **********<br />
            </b><br />
        </div>
        <asp:GridView ID="VendorGridView" runat="server" class="text-center" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical"  Width="505px" OnRowDataBound="VendorGridView_RowDataBound1">
                        <AlternatingRowStyle BackColor="#CCCCCC" />

            <Columns>
                <asp:BoundField DataField="VendorId" HeaderText="Vendor Id" />
                <asp:BoundField DataField="VendorName" HeaderText="Vendor Name" />
                <asp:BoundField DataField="VendorEmail" HeaderText="Email" />
                <asp:BoundField DataField="VendorContact" HeaderText="Contact" />               
              <%--  <asp:BoundField DataField="CityId"  HeaderText="City Id"  />--%>
                       <asp:TemplateField HeaderText="City">                      
                    <ItemTemplate>  
                        <asp:DropDownList ID="DropDownList1" runat="server">  
                        </asp:DropDownList>  
                    </ItemTemplate>  
                </asp:TemplateField>  
               
            </Columns>
             <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="Gray" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="UPDATE" />
        <br />
    </form>
    <form  class="text-center">
    <footer class="align-content-center" style="background-color:aqua">copyright: 2021 Hello Private Limited. All rights reserved.</footer>
 </form>
		
</body>
</html>
