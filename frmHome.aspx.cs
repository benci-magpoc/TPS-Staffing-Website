using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SecurityLevel"] == null)
        {
            Response.Redirect("~/frmLogin.aspx");
        }

        switch (Session["SecurityLevel"].ToString())
        {
            case "A":
                lblWelcome.Text = "Welcome, Contract Manager!";
                break;
            case "S":
                lblWelcome.Text = "Welcome, Staff!";
                StaffOnlyButtons();
                break;
            case "C":
                lblWelcome.Text = "Welcome, Client!";
                ClientOnlyButtons();
                break;
            default:
                break;
        }
    }


    protected void imgbtnStaffProfile_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/frmViewProfile.aspx?ID=" + Session["UserID"].ToString());
    }

    protected void lnkbtnStaffProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/frmViewProfile.aspx?ID=" + Session["UserID"].ToString());
    }

    protected void imgbtnRequestStatus_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/frmViewRequestStatus.aspx?ID=" + Session["UserID"].ToString());
    }
    
    protected void lnkbtnRequestStatus_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/frmViewRequestStatus.aspx?ID=" + Session["UserID"].ToString());
    }

    protected void StaffOnlyButtons()
    {
        lnkbtnStaffRequest.Visible = false;
        imgbtnStaffRequest.Visible = false;
        //
        lnkbtnManageUsers.Visible = false;
        imgbtnManageUsers.Visible = false;
        //
        lnkbtnManageStaffing.Visible = false;
        imgbtnManageStaffing.Visible = false;
        //
        lnkbtnRequestStatus.Visible = false;
        imgbtnRequestStatus.Visible = false;
    }

    protected void ClientOnlyButtons()
    {
        //
        lnkbtnManageStaffing.Visible = false;
        imgbtnManageStaffing.Visible = false;
        //
        lnkbtnManageUsers.Visible = false;
        imgbtnManageUsers.Visible = false;

    }
}