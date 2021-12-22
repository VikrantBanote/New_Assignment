using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace New_Assignment
{
    public partial class Vendors : System.Web.UI.Page
    {
        string str = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                VendorGridDataShow();
            }
        }
        void VendorGridDataShow()
        {
            using (SqlConnection con = new SqlConnection(str))
            {
                con.Open();
                SqlCommand sqlcom = new SqlCommand("select VendorId, VendorName, VendorEmail, VendorContact from Vendor", con);
                SqlDataReader dr = sqlcom.ExecuteReader();
                if (dr.HasRows == true)
                {
                    VendorGridView.DataSource = dr;
                    VendorGridView.DataBind();
                }
            }
        }
        protected void VendorGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            

       
        }

        protected void VendorGridView_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(str))
                {
                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        con.Open();
                        DropDownList DropDownList1 = (e.Row.FindControl("DropDownList1") as DropDownList);
                        SqlCommand cmd = new SqlCommand("select CityName from City", con);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        con.Close();
                        DropDownList1.DataSource = ds;
                        DropDownList1.DataValueField = "CityName";
                        DropDownList1.DataBind();
                    }
                }
            }
            catch (Exception e1)
            {
                Response.Write(e1);
            }
        }
    }
}