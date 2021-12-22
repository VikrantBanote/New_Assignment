using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace New_Assignment
{
    public partial class assetlist : System.Web.UI.Page
    {
        string str = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        //StringBuilder table = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                GridDataShow();
                
            }
        }
        void AssetSearch()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(str))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "select AssetId,AssetName,VendorName,Cost from Asset where AssetName like '%' + @AssetName + '%'";
                    // SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select AssetId,AssetName,VendorName,Cost from Asset where AssetName like'%' '"+TextBoxVendorSearch.Text+ "%'", con);
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@AssetName", searchtext.Text.Trim());
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
                    DataSet dataSet = new DataSet();
                    sqlDataAdapter.Fill(dataSet);

                    AssetGridView.DataSource = dataSet;
                    // GridViewAssetList.AutoGenerateColumns = true;

                    AssetGridView.DataBind();
                }
            }
            catch (Exception e1)
            {
                Response.Write(e1);
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            this.AssetSearch();

        }
        void GridDataShow()
        {
            using (SqlConnection con = new SqlConnection(str))
            {
                con.Open();
                SqlCommand sqlcom = new SqlCommand("select * from Asset", con);
                SqlDataReader dr = sqlcom.ExecuteReader();
                if(dr.HasRows == true)
                {
                    AssetGridView.DataSource = dr;
                    AssetGridView.DataBind();
                }
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(AssetGridView.Rows[0].Cells[0].Text);
            using (SqlConnection connect = new SqlConnection(str))
            {
                connect.Open();
                SqlCommand sqlcom = new SqlCommand("delete from Asset where AssetID='"+ id + "'", connect);
                int t = sqlcom.ExecuteNonQuery();
                if(t > 0)
                {
                    Response.Write("<script>alert('Data has Deleted')</script>");
                    AssetGridView.EditIndex = -1;
                    GridDataShow();
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void AssetGridView_PageIndexChanged(object sender, EventArgs e)
        {
        }
         
        
    }
}