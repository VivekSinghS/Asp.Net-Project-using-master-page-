using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMasterProject
{
    public partial class StudentForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source =LAPTOP-LV098BPO\\SQLEXPRESS;initial catalog=MasterProject;integrated security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            ViewData();
        }

        public void Clear() 
        {
            txtSName.Text = "";
            ddlCourse.SelectedValue = "0";
            DdlStCity.SelectedValue = "0";
            txtDob.Text = "";
            btnSubmit2.Text = "Submit";
        
        }
          public void ViewData()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("StudentSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            grdView.DataSource = dt;
            grdView.DataBind();
            con.Close();
        }

        protected void btnSubmit2_Click(object sender, EventArgs e)
        {
            if (btnSubmit2.Text == "Submit")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("StudentInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;
               
                cmd.Parameters.AddWithValue("@Name",txtSName.Text);
                cmd.Parameters.AddWithValue("@Course",ddlCourse.Text);
                cmd.Parameters.AddWithValue("@City",DdlStCity.Text);
                cmd.Parameters.AddWithValue("@DOB",txtDob.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                ViewData();
                Clear();

            }
            else if (btnSubmit2.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("StudentUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", ViewState["VD"]);
                cmd.Parameters.AddWithValue("@Name", txtSName.Text);
                cmd.Parameters.AddWithValue("@Course", ddlCourse.Text);
                cmd.Parameters.AddWithValue("@City", DdlStCity.Text);
                cmd.Parameters.AddWithValue("@DOB", txtDob.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                ViewData();
                Clear();
            }
            
        }

        protected void grdView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "DltData")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("StudentDelete", con);
                cmd.CommandType= CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
            }
             else if (e.CommandName == "EditData")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("StudentEdit", con);
                cmd.CommandType=CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id",e.CommandArgument); 
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                txtSName.Text = dt.Rows[0]["Name"].ToString();
                ddlCourse.Text= dt.Rows[0]["Course"].ToString();
                DdlStCity.Text = dt.Rows[0]["City"].ToString();
                txtDob.Text = dt.Rows[0]["DOB"].ToString();
                btnSubmit2.Text = "Update";
                ViewState["VD"] = e.CommandArgument;
                con.Close();

            }
        }

       
    }
}