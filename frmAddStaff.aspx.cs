using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class frmAddStaff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSaveEmployee_Click(object sender, EventArgs e)
    {
        string filename = Path.GetFileName(fileProfileImageLink.FileName);
        fileProfileImageLink.PostedFile.SaveAs(Server.MapPath(".") + "//ProfileImages//" + filename);
        string imglink = "ProfileImages" + "\\" + Path.GetFileName(fileProfileImageLink.FileName);

            if (clsDataLayer.SaveEmployee(Server.MapPath("TPS_Website_DB.accdb"),
                txtFirstName.Text, txtLastName.Text, txtPhoneNumber.Text, txtHireDate.Text,
                txtPosition.Text, Convert.ToDouble(txtDepartment), txtAddress.Text, txtZipCode.Text,
                imglink, clsDataLayer.GetUserID(Server.MapPath("TPS_Website_DB.accdb"))))
            {
                lblError.Text = txtFirstName.Text + " " + imglink + " " + clsDataLayer.GetUserID(Server.MapPath("TPS_Website_DB.accdb").ToString());
                lblError.ForeColor = System.Drawing.Color.Green;
                //txtContractNumber.Text = "";
                //txtUserPassword.Text = "";
            }
            else
            {
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = txtFirstName.Text + " " + imglink + " " + clsDataLayer.GetUserID(Server.MapPath("TPS_Website_DB.accdb").ToString());
        }
        
    }
}