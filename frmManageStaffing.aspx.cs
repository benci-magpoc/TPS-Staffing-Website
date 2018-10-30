using System;
using System.Web.UI.WebControls;
using System.IO;

public partial class frmManageStaffing : System.Web.UI.Page
{
    private object fileProfileImageLink;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //FillDataList();
        }
        //FillDataList();
        
    }

    protected void delete(object source, DataListCommandEventArgs e)
    {
        int employeeID = Convert.ToInt32(((Label)DataList1.Items[e.Item.ItemIndex].FindControl("EmployeeIDLabel")).Text);
        
        if (clsDataLayer.DeleteEmployee(Server.MapPath("TPS_Website_DB.accdb"), employeeID))
        {
            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert(' You have deleted a record ');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert(' delete unsuccessful ');", true);
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
                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert(' Update SUCCESS');", true);
            }
        DataList1.EditItemIndex = -1;
        DataList1.DataBind();
    }

    protected void cancel(object source, DataListCommandEventArgs e)
    {
        DataList1.EditItemIndex = -1;
        DataList1.DataBind();
    }

    protected void FillDataList()
    {
            dsEmployee myDataSet = new dsEmployee();
            int strSearch = int.Parse(DropDownList1.SelectedValue.ToString());
            //Fill the dataset with what is returned from the method.
            myDataSet = clsDataLayer.GetEmployee(Server.MapPath("TPS_Website_DB.accdb"), strSearch.ToString(), "EmployeeID");
            //Set the DataGrid to the DataSource based on the table
            DataList1.DataSource = myDataSet.Tables["tblEmployee"];
            //Bind the DataGrid
            DataList1.DataBind();
    }


}