using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmAddUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddUser_Click(object sender, EventArgs e)
    {
        bool allOK = true;

        if(Request["txtContractNumber"].ToString().Trim() == "")
        {
            txtContractNumber.BackColor = System.Drawing.Color.Yellow;
            allOK = false;
            lblErrorContractNumber.Text = "Please Enter Contract Number";
            lblErrorContractNumber.ForeColor = System.Drawing.Color.Red;
        }

        else
        {
            txtContractNumber.BackColor = System.Drawing.Color.White;
        }

        if (Request["txtUserPassword"].ToString().Trim() == "")
        {
            txtContractNumber.BackColor = System.Drawing.Color.Yellow;
            allOK = false;
            lblErrorUserPassword.Text = "Please Enter User Password";
            lblErrorUserPassword.ForeColor = System.Drawing.Color.Red;
        }

        else
        {
            txtUserPassword.BackColor = System.Drawing.Color.White;
        }
        if (IsPostBack)
        {
            if (clsDataLayer.SaveUser(Server.MapPath("TPS_Website_DB.accdb"),
                txtContractNumber.Text, txtUserPassword.Text, ddlSecurityLevel.SelectedValue.ToString()))
            {
                lblError.Text = "The user was successfully added!";
                lblError.ForeColor = System.Drawing.Color.Green;
                txtContractNumber.Text = "";
                txtUserPassword.Text = "";
            }
            else
            {
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = "The user was not saved";
            }
        }
    }//End btnAddUser_Click

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/frmManageUsers.aspx");
    }
}