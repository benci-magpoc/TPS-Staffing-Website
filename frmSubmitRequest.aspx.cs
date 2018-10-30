using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmSubmitRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SecurityLevel"] == null)
        {
            Response.Redirect("~/frmLogin.aspx");
        }
    }

    protected void btnSubmitRequest_Click(object sender, EventArgs e)
    {
        int employeeID = Convert.ToInt32(Request.QueryString["ID"]);
        int userID = Convert.ToInt32(Session["userID"]);
        DateTime thisDay = DateTime.Today;
        string requestDate = thisDay.ToString("d");
        string firstName, lastName, phoneNumber, position, requestorName, requestorEmail;

        firstName = ((Label)DataList1.Items[0].FindControl("FirstNameLabel")).Text;
        lastName = ((Label)DataList1.Items[0].FindControl("LastNameLabel")).Text;
        phoneNumber = ((Label)DataList1.Items[0].FindControl("PhoneNumberLabel")).Text;
        position = ((Label)DataList1.Items[0].FindControl("PositionIDLabel")).Text;
        requestorName = clsDataLayer.GetName(Server.MapPath("TPS_Website_DB.accdb"), Session["SecurityLevel"].ToString(), userID.ToString());
        requestorEmail = clsDataLayer.GetEmail(Server.MapPath("TPS_Website_DB.accdb"), Session["SecurityLevel"].ToString(), userID.ToString());

        string body = " New Staff Request for: " + firstName + " " + lastName + " " +
            "<br><br>Position: " + position + "<br><br>Contact Number: " + phoneNumber + "<br><br>Requested by: " + requestorName;
        string requesterBody = " Your new staff request for: " + firstName + " " + lastName + " " +
        "<br><br>Position: " + position + "<br><br>Contact Number: " + phoneNumber + "<br><br>Date of Request: " + requestDate +
        "<br><br>It has been submitted, please wait 24 hours for approval.";

        if (clsDataLayer.RequestStaff(Server.MapPath("TPS_Website_DB.accdb"), employeeID, userID, "Pending", requestDate, firstName + " " + lastName, requestorName) &&
                clsBusinessLayer.SendEmail("tpswebsiteteamf@gmail.com", "tpswebsiteteamf@gmail.com", "", "", "New Staff Request Submitted", body) &&
                clsBusinessLayer.SendEmail("tpswebsiteteamf@gmail.com", requestorEmail, "", "", "Confirmation for New Staff Request", requesterBody))
        {
            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert(' You have created a request for " + firstName + " " +
                " " + lastName + " " + position + " " + phoneNumber + "');", true);
            
            /*            
            if (clsBusinessLayer.SendEmail("tpswebsiteteamf@gmail.com", "tpswebsiteteamf@gmail.com", "", "", "New Staff Request Submitted", body) ||
                clsBusinessLayer.SendEmail("tpswebsiteteamf@gmail.com", requestorEmail, "", "", "Confirmation for New Staff Request", requesterBody))
            {
                
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert(' Failed to send Email ');", true);
            }
            //Response.Redirect("~/frmRequestStaff.aspx"); */
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert(' Failed to create a request ');", true);
        }

        
    }
}