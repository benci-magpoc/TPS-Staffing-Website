using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmRequestStaff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        if (Session["SecurityLevel"] == null)
        {
            Response.Redirect("~/frmLogin.aspx");
        }
        if(!IsPostBack)
        {
            dsEmployee myDataSet = new dsEmployee();
            myDataSet = clsDataLayer.GetEmployee(Server.MapPath("TPS_Website_DB.accdb"), null, null);
            //Set the DataGrid to the DataSource based on the table
            GridView2.DataSource = myDataSet.Tables["tblEmployee"];
            //Bind the DataGrid
            GridView2.DataBind();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        dsEmployee myDataSet = new dsEmployee();
        string strSearch = Request["txtSearch"];
        string searchField = ddlSearch.SelectedValue.ToString();
        //Fill the dataset with what is returned from the method.
        myDataSet = clsDataLayer.GetEmployee(Server.MapPath("TPS_Website_DB.accdb"), strSearch, searchField);
        //Set the DataGrid to the DataSource based on the table
        GridView2.DataSource = myDataSet.Tables["tblEmployee"];
        //Bind the DataGrid
        GridView2.DataBind();
    }

    protected void GridView1_ItemCommand(object source, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "viewProfile")
        {
            Response.Redirect("~/frmSubmitRequest.aspx?ID=" + e.CommandArgument.ToString());
        }
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //Response.Redirect("~/frmViewProfile.aspx?ID=" + e.CommandArgument.ToString());
    }
}