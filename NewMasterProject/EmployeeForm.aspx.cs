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
    public partial class EmployeeForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source =LAPTOP-LV098BPO\\SQLEXPRESS;initial catalog=MasterProject;integrated security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayData();
            
        }

          public void DisplayData()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Employee", con);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            grd.DataSource = dt;
            grd.DataBind();
            con.Close();

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (btnSubmit.Text == "Submit")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Employee(Name,City,Gender,MobilNo)Values('" + txtName.Text + "','" + ddlCity.Text + "','" + rblGender.Text + "','" + txtMobilNo.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                DisplayData();
                Clean();
            }
            else if (btnSubmit.Text == "Update") {

                con.Open();
                SqlCommand cmd = new SqlCommand("Update  Employee Set Name = '" + txtName.Text + "', City= '" +ddlCity.Text+ "',Gender ='" + rblGender.Text + "',MobilNo = '" + txtMobilNo.Text + "' where Id='" +ViewState["my"] +"'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                DisplayData();
                Clean();
            }

             
        }
         
           public void Clean()
        {
            txtName.Text = "";
            ddlCity.SelectedValue = "0";
            rblGender.ClearSelection();
            txtMobilNo.Text = "";
            btnSubmit.Text = "Submit";
        }


        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "A") {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from Employee where Id = '"+e.CommandArgument+"'",con);
                cmd.ExecuteNonQuery();
                DataBind();
                con.Close();
            }
            else if (e.CommandName == "EditData")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Employee where  Id = '"+e.CommandArgument+"'",con); 
                SqlDataAdapter adp= new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt); 
                txtName.Text = dt.Rows[0]["Name"].ToString();
                ddlCity.Text = dt.Rows[0]["City"].ToString();
                rblGender.Text = dt.Rows[0]["Gender"].ToString();
                txtMobilNo.Text = dt.Rows[0]["MobilNo"].ToString();
                btnSubmit.Text = "Update";
                ViewState["my"] = e.CommandArgument;
                con.Close();
            }
        }
    }
}