using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        // creating dsUser object
        dsUser dsUserLogin, dsGetUserID;
        // SecurityLevel will take what security level the user is
        string SecurityLevel;
        // constructing dsUserLogin object
        dsUserLogin = clsDataLayer.VerifyUser(Server.MapPath("TPS_Website_DB.accdb"),
        Login1.UserName, Login1.Password);
        // validates username and password input
        if (dsUserLogin.tblUsers.Count < 1)
        {
            e.Authenticated = false;
            {
                Login1.FailureText = Login1.FailureText +
                " Your incorrect login information was sent to bmagpoc@my.devry.edu";
            }
            return;
        }
        // assigning value to SecurityLevel variable
        SecurityLevel = dsUserLogin.tblUsers[0].SecurityLevel.ToString();

        // getting user ID from tblUsers to store on session variable
        dsGetUserID = clsDataLayer.fetchUserID(Server.MapPath("TPS_Website_DB.accdb"),
        Login1.UserName, Login1.Password);
        int ID = Convert.ToInt32(dsGetUserID.tblUsers[0].UserID);
        Session["userID"] = ID;

        // checking the access level of user
        switch (SecurityLevel)
        {
            case "A":
                // A is administrator access level
                e.Authenticated = true;
                FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
                Session["SecurityLevel"] = "A";
                break;
            case "S":
                // U is Staff access level
                e.Authenticated = true;
                FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
                Session["SecurityLevel"] = "S";
                break;
            case "C":
                // C is Client access level
                e.Authenticated = true;
                FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
                Session["SecurityLevel"] = "C";
                break;

            default:
                e.Authenticated = false;
                break;
        }
    }
}