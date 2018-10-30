using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmViewProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SecurityLevel"] == null)
        {
            Response.Redirect("~/frmLogin.aspx");
        }
        if (Session["SecurityLevel"] == "C")
        {
            DataList1.Visible = false;
        }


    }
    
    protected void Edit(object source, DataListCommandEventArgs e)
    {
        DataList1.EditItemIndex = e.Item.ItemIndex;
        DataList1.DataBind();
        //FillDataList();
    }

    protected void update(object source, DataListCommandEventArgs e)
    {
        FileUpload file = (FileUpload)DataList1.Items[e.Item.ItemIndex].FindControl("fileProfileImageLink");
        int employeeID;
        double salary;
        string filename = Path.GetFileName(file.FileName);
        string imglink;
        string firstName, lastName, phoneNumber, experience, position, address, zipcode;

        if (file.HasFile)
        {
            file.PostedFile.SaveAs(Server.MapPath(".") + "//ProfileImages//" + filename);
            imglink = "ProfileImages" + "\\" + Path.GetFileName(file.FileName);
        }
        else
        {
            imglink = ((Image)DataList1.Items[e.Item.ItemIndex].FindControl("Image2")).ImageUrl;
        }

        employeeID = Convert.ToInt32(((Label)DataList1.Items[e.Item.ItemIndex].FindControl("EmployeeIDLabel")).Text);
        firstName = ((TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("txtFirstName")).Text;
        lastName = ((TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("txtLastName")).Text;
        phoneNumber = ((TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("txtPhoneNumber")).Text;
        experience = ((DropDownList)DataList1.Items[e.Item.ItemIndex].FindControl("ddlExperience")).Text;
        position = ((TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("txtPosition")).Text;
        salary = double.Parse(((TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("txtSalary")).Text);
        address = ((TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("txtAddress")).Text;
        zipcode = ((TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("txtZipcode")).Text;

        if (clsDataLayer.UpdateEmployee(Server.MapPath("TPS_Website_DB.accdb"), firstName, lastName, phoneNumber,
            experience, position, salary, address, zipcode, imglink, employeeID))
        {
            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert(' Update SUCCESS' );", true);
        }
        DataList1.EditItemIndex = -1;
        DataList1.DataBind();
    }

    protected void cancel(object source, DataListCommandEventArgs e)
    {
        DataList1.EditItemIndex = -1;
        DataList1.DataBind();
    }

    protected void updateManager(object source, DataListCommandEventArgs e)
    {

    }

    //edit for editting client profile
    protected void edit(object source, DataListCommandEventArgs e)
    {
        ClientDataList.EditItemIndex = e.Item.ItemIndex;
        ClientDataList.DataBind();
    }
    //Update method for updating client profile
    protected void Update(object source, DataListCommandEventArgs e)
    {
        int clientID;
        string clientName, companyName, emailAddress;

        clientID = Convert.ToInt32(((Label)ClientDataList.Items[e.Item.ItemIndex].FindControl("ClientIDLabel")).Text);
        clientName = ((TextBox)ClientDataList.Items[e.Item.ItemIndex].FindControl("txtClientName")).Text;
        companyName = ((TextBox)ClientDataList.Items[e.Item.ItemIndex].FindControl("txtCompanyName")).Text;
        emailAddress = ((TextBox)ClientDataList.Items[e.Item.ItemIndex].FindControl("txtEmailAddress")).Text;

        if (clsDataLayer.UpdateClient(Server.MapPath("TPS_Website_DB.accdb"), clientName, companyName, emailAddress, clientID))
        {
            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert(' Update SUCCESS' );", true);
        }

        ClientDataList.EditItemIndex = -1;
        ClientDataList.DataBind();
    }
    //Cancel method for cancelling edit client profile
    protected void Cancel(object source, DataListCommandEventArgs e)
    {
        ClientDataList.EditItemIndex = -1;
        ClientDataList.DataBind();
    }

    protected void FillDataList()
    {
        dsEmployee myDataSet = new dsEmployee();
        //Fill the dataset with what is returned from the method.
        myDataSet = clsDataLayer.GetEmployee(Server.MapPath("TPS_Website_DB.accdb"), Request.QueryString["ID"], "UserID");
        //Set the DataGrid to the DataSource based on the table
        DataList1.DataSource = myDataSet.Tables["tblEmployee"];
        //Bind the DataGrid
        DataList1.DataBind();
    }

    protected void FillClientDataList()
    {
        dsClient myDataSet = new dsClient();
        //Fill the dataset with what is returned from the method.
        myDataSet = clsDataLayer.GetClient(Server.MapPath("TPS_Website_DB.accdb"), Request.QueryString["ID"]);
        //Set the DataGrid to the DataSource based on the table
        ClientDataList.DataSource = myDataSet.Tables["tblClient"];
        //Bind the DataGrid
        ClientDataList.DataBind();
    }


    protected void ediT(object source, DataListCommandEventArgs e)
    {
        ManagerDataList.EditItemIndex = e.Item.ItemIndex;
        ManagerDataList.DataBind();
    }

    protected void canceL(object source, DataListCommandEventArgs e)
    {
        ManagerDataList.EditItemIndex = -1;
        ManagerDataList.DataBind();
    }

    protected void updatE(object source, DataListCommandEventArgs e)
    {
        int managerID;
        string managerName, managerEmailAddress;

        managerID = Convert.ToInt32(((Label)ManagerDataList.Items[e.Item.ItemIndex].FindControl("ContractManagerIDLabel")).Text);
        managerName = ((TextBox)ManagerDataList.Items[e.Item.ItemIndex].FindControl("txtManagerName")).Text;
        managerEmailAddress = ((TextBox)ManagerDataList.Items[e.Item.ItemIndex].FindControl("txtManagerEmailAddress")).Text;

        if (clsDataLayer.UpdateManager(Server.MapPath("TPS_Website_DB.accdb"), managerName, managerEmailAddress, managerID))
        {
            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert(' Update SUCCESS' );", true);
        }

        ManagerDataList.EditItemIndex = -1;
        ManagerDataList.DataBind();
    }
}
