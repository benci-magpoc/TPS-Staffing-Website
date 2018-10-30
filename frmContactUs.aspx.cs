using System;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string body = " New Inquiry by: " + txtName.Text  + 
            "<br><br>From Company: " + txtCompanyName.Text + "<br><br>Contact Number: " + txtPhoneNumber.Text;
        string inquireBody = "You inquiry has been sent to the contract manager. <br><br>New Inquiry by: " + txtName.Text +
            "<br><br>From Company: " + txtCompanyName.Text + "<br><br>Contact Number: " + txtPhoneNumber.Text;
        if (clsBusinessLayer.SendEmail(txtEmail.Text, "tpswebsiteteamf@gmail.com", "", "", "New Inquiry", body) &&
                clsBusinessLayer.SendEmail("tpswebsiteteamf@gmail.com", txtEmail.Text, "", "", "Confirmation of New Inquiry", inquireBody))
        {
            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert(' Email Sent ');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert(' Failed to send Email ');", true);
        }

        //Response.Redirect("~/frmHome.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        txtCompanyName.Text = "";
        txtEmail.Text = "";
        txtName.Text = "";
        txtPhoneNumber.Text = "";
    }
}