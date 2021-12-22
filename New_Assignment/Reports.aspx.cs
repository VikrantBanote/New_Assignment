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
    public partial class Reports : System.Web.UI.Page
    {
        int m=0;
        string str = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        void ReportGridDataShow()
        {
            using (SqlConnection con = new SqlConnection(str))
            {
                con.Open();
                SqlCommand sqlcom = new SqlCommand("select * from Asset", con);
                SqlDataReader dr = sqlcom.ExecuteReader();
                if (dr.HasRows == true)
                {
                    ReportGridView.DataSource = dr;
                    ReportGridView.DataBind();
                }
            }
        }

        void totalCost()
        {
            using (SqlConnection con = new SqlConnection(str))
            {
                con.Open();
                SqlCommand com = new SqlCommand("Select Sum(Cost) as total from Asset", con);
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    TotalCost.Text = dr["total"].ToString();
                }

            }
        }
        void ReportSearch()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(str))
                {
                    
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "select AssetId,AssetName,VendorName,PurchaseDate,Cost from Asset where AssetName like '%' + @AssetName + '%'";
                    // SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select AssetId,AssetName,VendorName,Cost from Asset where AssetName like'%' '"+TextBoxVendorSearch.Text+ "%'", con);
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@AssetName", ReportSearchText.Text.Trim());
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
                    DataSet dataSet = new DataSet();
                    sqlDataAdapter.Fill(dataSet);

                    ReportGridView.DataSource = dataSet;
                    // GridViewAssetList.AutoGenerateColumns = true;

                    ReportGridView.DataBind();
                }
            }
            catch (Exception e1)
            {
                Response.Write(e1);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ReportGridDataShow();

            }

            totalCost();
        }

        protected void ReportGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Total.Visible = false;
            TotalCost.Visible = false;
            this.ReportSearch();
        }
    }
}