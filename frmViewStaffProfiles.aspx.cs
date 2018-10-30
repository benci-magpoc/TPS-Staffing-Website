using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class frmViewStaffProfiles : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        dsEmployee myDataSet = new dsEmployee();
        string strSearch = Request["txtSearch"];
        //Fill the dataset with what is returned from the method.
        myDataSet = clsDataLayer.GetEmployee(Server.MapPath("TPS_Website_DB.accdb"), strSearch, null);
        //Set the DataGrid to the DataSource based on the table
        DataList1.DataSource = myDataSet.Tables["tblPersonnel"];
        //Bind the DataGrid
        DataList1.DataBind();

    }
}