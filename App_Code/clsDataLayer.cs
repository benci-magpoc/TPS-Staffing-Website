// Initializing namespaces to be used
using System.Data.OleDb;
using System.Net;
using System.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for clsDataLayer
/// </summary>
public class clsDataLayer
{
    public clsDataLayer()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static dsUser VerifyUser(string Database, string UserName, string UserPassword)
    {
        // creating objects
        dsUser DS;
        OleDbConnection sqlConn;
        OleDbDataAdapter sqlDA;
        // connecting database using sqlConn object
        sqlConn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" +
        "Data Source=" + Database);
        // assigning data adapter to sqlDA object
        sqlDA = new OleDbDataAdapter("Select SecurityLevel from tblUsers " +
        "where ContractNumber like '" + UserName + "' " +
        "and UserPassword like '" + UserPassword + "'", sqlConn);
        // assigning new dsUser to DS object
        DS = new dsUser();
        // filling userlogin data to adapter
        sqlDA.Fill(DS.tblUsers);
        // returning dsUser object
        return DS;
    }

    public static dsUser fetchUserID(string Database, string UserName, string UserPassword)
    {
        // creating objects
        dsUser DS;
        OleDbConnection sqlConn;
        OleDbDataAdapter sqlDA;
        // connecting database using sqlConn object
        sqlConn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" +
        "Data Source=" + Database);
        // assigning data adapter to sqlDA object
        sqlDA = new OleDbDataAdapter("Select UserID from tblUsers " +
        "where ContractNumber like '" + UserName + "' " +
        "and UserPassword like '" + UserPassword + "'", sqlConn);
        // assigning new dsUser to DS object
        DS = new dsUser();
        // filling userlogin data to adapter
        sqlDA.Fill(DS.tblUsers);
        // returning dsUser object
        return DS;
    }

    //method to Insert User in the database
    public static bool SaveUser(string Database, string ContractNumber, string UserPassword,
    string SecurityLevel)
    {
        bool userSaved;
        OleDbTransaction myTransaction = null;
        try
        {
            // creating connection to a database through object conn of the OleDbConnection class
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" +
            "Data Source=" + Database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;
            // assigning BeginTransaction method to myTransaction object
            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;
            // assigning SQL commands to strSQL variable in order to be written to the database
            strSQL = "Insert into tblUsers " +
            "(ContractNumber, UserPassword, SecurityLevel) values ('" +
            ContractNumber + "', '" + UserPassword + "', '" + SecurityLevel + "')";
            // setting how the command will be interpreted which is .text
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;
            // executes the strSQL statement to the connected database
            command.ExecuteNonQuery();
            // executing Commit method for myTransaction object
            
            myTransaction.Commit();
            // close command is used to close existing connection and recordsaved is assigned with true value
            
            conn.Close();

            if (SecurityLevel == "A")
            {
                int userID = 0;
                string mySelectQuery = "SELECT MAX(UserID) FROM tblUsers";
                OleDbCommand myCommand = new OleDbCommand(mySelectQuery, conn);
                // assigning new OleDbConnection class to sqlConn object

                conn.Open();
                OleDbDataReader myReader = myCommand.ExecuteReader();

                while (myReader.Read())
                {
                    userID = myReader.GetInt32(0);
                }

                myReader.Close();
                strSQL = "INSERT INTO tblContractManager (UserID) VALUES (" + userID + ")";
                command.CommandType = CommandType.Text;
                command.CommandText = strSQL;
                command.ExecuteNonQuery();
                conn.Close();
            }

            if (SecurityLevel == "S")
            {
                int userID = 0;
                string mySelectQuery = "SELECT MAX(UserID) FROM tblUsers";
                OleDbCommand myCommand = new OleDbCommand(mySelectQuery, conn);
                // assigning new OleDbConnection class to sqlConn object

                conn.Open();
                OleDbDataReader myReader = myCommand.ExecuteReader();

                while (myReader.Read())
                {
                    userID = myReader.GetInt32(0);
                }

                myReader.Close();
                strSQL = "INSERT INTO tblEmployee (UserID) VALUES (" + userID + ")";
                command.CommandType = CommandType.Text;
                command.CommandText = strSQL;
                command.ExecuteNonQuery();
                conn.Close();
            }

            if (SecurityLevel == "C")
            {
                int userID = 0;
                string mySelectQuery = "SELECT MAX(UserID) FROM tblUsers";
                OleDbCommand myCommand = new OleDbCommand(mySelectQuery, conn);
                // assigning new OleDbConnection class to sqlConn object

                conn.Open();
                OleDbDataReader myReader = myCommand.ExecuteReader();

                while (myReader.Read())
                {
                    userID = myReader.GetInt32(0);
                }

                myReader.Close();
                strSQL = "INSERT INTO tblClient (UserID) VALUES (" + userID + ")";
                command.CommandType = CommandType.Text;
                command.CommandText = strSQL;
                command.ExecuteNonQuery();
                conn.Close();
            }
            userSaved = true;
        }
        catch (Exception ex)
        {
            // rolling back the transaction if it receives an input error
            myTransaction.Rollback();
            userSaved = false;
        }
        return userSaved;

    }

    public static int GetUserID(string Database)
    {
        int userID = 0;
        string mySelectQuery = "SELECT MAX(UserID) FROM tblUsers";

        OleDbConnection sqlConn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Database); ;
        OleDbCommand myCommand = new OleDbCommand(mySelectQuery, sqlConn);
        // assigning new OleDbConnection class to sqlConn object

        sqlConn.Open();
        OleDbDataReader myReader = myCommand.ExecuteReader();

        while (myReader.Read())
        {
            userID = myReader.GetInt32(0);
        }

        myReader.Close();
        sqlConn.Close();
        return userID;
    }

    //Save Employee method is used to save Employee to the database
    public static bool SaveEmployee(string Database, string firstName, string lastName,
    string phoneNumber, string experience, string position, double salary, 
    string address, string zipcode, string imageLink, int userID)
    {

        bool userSaved;
        OleDbTransaction myTransaction = null;
        try
        {
            // creating connection to a database through object conn of the OleDbConnection class
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" +
            "Data Source=" + Database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;
            // assigning BeginTransaction method to myTransaction object
            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;
            // assigning SQL commands to strSQL variable in order to be written to the database
            strSQL = "INSERT INTO tblEmployee  (FirstName, LastName, PhoneNumber, Experience, PositionID, Salary, Address, Zipcode, UserID, ContractID, ProfileImage)  VALUES ('" +
            firstName + "', '" + lastName + "', " + phoneNumber + ", '" + experience+ "', '" + position + "', " + salary + ", '" + 
            address + "', " + zipcode + ", " + userID + ", 1010, '" + imageLink + "')";
            // setting how the command will be interpreted which is .text
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;
            // executes the strSQL statement to the connected database
            command.ExecuteNonQuery();
            // executing Commit method for myTransaction object
            myTransaction.Commit();
            // close command is used to close existing connection and recordsaved is assigned with true value
            conn.Close();
            userSaved = true;
        }
        catch (Exception ex)
        {
            // rolling back the transaction if it receives an input error
            myTransaction.Rollback();
            userSaved = false;
        }
        return userSaved;
    }

    public static bool UpdateEmployee(string Database, string firstName, string lastName,
    string phoneNumber, string experience, string position, double salary,
    string address, string zipcode, string imageLink, int employeeID)
    {

        bool userSaved;
        OleDbTransaction myTransaction = null;
        try
        {
            // creating connection to a database through object conn of the OleDbConnection class
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" +
            "Data Source=" + Database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;
            // assigning BeginTransaction method to myTransaction object
            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;
            // assigning SQL commands to strSQL variable in order to be written to the database
            strSQL = "UPDATE tblEmployee SET FirstName = '" + firstName + "', LastName = '" + lastName +
                "', PhoneNumber = " + phoneNumber + ", Experience = '" + experience + "', PositionID = '" + position +
                "', Salary = " + salary + ", Address = '" + address + "', Zipcode = '" + zipcode + "', ProfileImage = '" + imageLink +
                "' WHERE EmployeeID = " + employeeID;
            // setting how the command will be interpreted which is .text
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;
            // executes the strSQL statement to the connected database
            command.ExecuteNonQuery();
            // executing Commit method for myTransaction object
            myTransaction.Commit();
            // close command is used to close existing connection and recordsaved is assigned with true value
            conn.Close();
            userSaved = true;
        }
        catch (Exception ex)
        {
            // rolling back the transaction if it receives an input error
            myTransaction.Rollback();
            userSaved = false;
        }
        return userSaved;
    }

    //DeleteEmployee method is used to delete employee
    public static bool DeleteEmployee(string Database, int employeeID)
    {
        bool userDeleted = false;
        OleDbTransaction myTransaction = null;
        try
        {
            // creating connection to a database through object conn of the OleDbConnection class
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" +
            "Data Source=" + Database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;
            // assigning BeginTransaction method to myTransaction object
            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;
            // assigning SQL commands to strSQL variable in order to be written to the database
            strSQL = "DELETE FROM tblEmployee WHERE EmployeeID = " + employeeID;
            // setting how the command will be interpreted which is .text
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;
            // executes the strSQL statement to the connected database
            command.ExecuteNonQuery();
            // executing Commit method for myTransaction object
            myTransaction.Commit();
            // close command is used to close existing connection and recordsaved is assigned with true value
            conn.Close();
            userDeleted = true;
        }
        catch (Exception ex)
        {
            // rolling back the transaction if it receives an input error
            myTransaction.Rollback();
            userDeleted = false;
        }

        return userDeleted;
    }

    public static dsEmployee GetEmployee(string Database, string strSearch, string searchField)
    {
        // Initializing objects
        dsEmployee DS;
        OleDbConnection sqlConn;
        OleDbDataAdapter sqlDA;
        // assigning new OleDbConnection class to sqlConn object
        sqlConn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Database);
        int x = 0;
        if (strSearch == null || strSearch.Trim() == "")
        {
            sqlDA = new OleDbDataAdapter("select * from tblEmployee", sqlConn);
        }
        else
        {
            if (searchField == "ZipCode" || searchField == "Salary" || searchField == "UserID")
            {
                x = 10;
                sqlDA = new OleDbDataAdapter("select * from tblEmployee where " + searchField + " = " + strSearch, sqlConn);
            }
            else
            {
                x = 99;
                sqlDA = new OleDbDataAdapter("select * from tblEmployee where " + searchField + " = '" + strSearch + "'", sqlConn);
            }
        }

        // assigning new dsUserActivity class to DS object
        DS = new dsEmployee();
        // fills sqlDA 
        sqlDA.Fill(DS.tblEmployee);
        return DS;
    }//end GetEmployee

    //dsClient GetClient is a method that gets all the client data from the database and save it to the dataset
    public static dsClient GetClient(string Database, string strSearch)
    {
        // Initializing objects
        dsClient DS;
        OleDbConnection sqlConn;
        OleDbDataAdapter sqlDA;
        // assigning new OleDbConnection class to sqlConn object
        sqlConn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Database);
        
                sqlDA = new OleDbDataAdapter("select * from tblClient where  UserID  = " + strSearch, sqlConn);
        // assigning new dsUserActivity class to DS object
        DS = new dsClient();
        // fills sqlDA 
        sqlDA.Fill(DS.tblClient);
        return DS;
    }//end GetClient

    //update client is used to update table client
    public static bool UpdateClient(string Database, string clientName, string companyName,
    string emailAddress, int clientID)
    {

        bool userSaved;
        OleDbTransaction myTransaction = null;
        try
        {
            // creating connection to a database through object conn of the OleDbConnection class
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" +
            "Data Source=" + Database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;
            // assigning BeginTransaction method to myTransaction object
            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;
            // assigning SQL commands to strSQL variable in order to be written to the database
            strSQL = "UPDATE tblClient SET ClientName = '" + clientName + "', CompanyName = '" + companyName +
                "', EmailAddress = '" + emailAddress + "' WHERE ClientID = " + clientID;
            // setting how the command will be interpreted which is .text
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;
            // executes the strSQL statement to the connected database
            command.ExecuteNonQuery();
            // executing Commit method for myTransaction object
            myTransaction.Commit();
            // close command is used to close existing connection and recordsaved is assigned with true value
            conn.Close();
            userSaved = true;
        }
        catch (Exception ex)
        {
            // rolling back the transaction if it receives an input error
            myTransaction.Rollback();
            userSaved = false;
        }
        return userSaved;
    }

    public static dsContractManager GetManager(string Database, string strSearch)
    {
        // Initializing objects
        dsContractManager DS;
        OleDbConnection sqlConn;
        OleDbDataAdapter sqlDA;
        // assigning new OleDbConnection class to sqlConn object
        sqlConn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Database);

        sqlDA = new OleDbDataAdapter("select * from tblContractManager where  UserID  = " + strSearch, sqlConn);
        // assigning new dsUserActivity class to DS object
        DS = new dsContractManager();
        // fills sqlDA 
        sqlDA.Fill(DS.tblContractManager);
        return DS;
    }//end GetManager

    public static bool UpdateManager(string Database, string managerName, string emailAddress, int managerID)
    {

        bool userSaved;
        OleDbTransaction myTransaction = null;
        try
        {
            // creating connection to a database through object conn of the OleDbConnection class
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" +
            "Data Source=" + Database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;
            // assigning BeginTransaction method to myTransaction object
            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;
            // assigning SQL commands to strSQL variable in order to be written to the database
            strSQL = "UPDATE tblContractManager SET ManagerName = '" + managerName + "', EmailAddress= '" + emailAddress + "' WHERE ContractManagerID = " + managerID;
            // setting how the command will be interpreted which is .text
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;
            // executes the strSQL statement to the connected database
            command.ExecuteNonQuery();
            // executing Commit method for myTransaction object
            myTransaction.Commit();
            // close command is used to close existing connection and recordsaved is assigned with true value
            conn.Close();
            userSaved = true;
        }
        catch (Exception ex)
        {
            // rolling back the transaction if it receives an input error
            myTransaction.Rollback();
            userSaved = false;
        }
        return userSaved;
    }


    //RequestStaff is a method that saves staff request into the database
    public static bool RequestStaff(string Database, int employeeID,
    int userID, string status, string requestDate, string employeeName, string requestorName)
    {
        bool userSaved;
        OleDbTransaction myTransaction = null;
        try
        {
            // creating connection to a database through object conn of the OleDbConnection class
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" +
            "Data Source=" + Database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;
            // assigning BeginTransaction method to myTransaction object
            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;
            // assigning SQL commands to strSQL variable in order to be written to the database
            strSQL = "Insert into tblStaffRequest" +
            "(EmployeeID, UserID, Status, RequestDate, EmployeeName, RequestorName) values (" +
            employeeID + ", " + userID + ", '" + status + "', '" + requestDate + "', '" + employeeName + "', '" + requestorName + "')";
            // setting how the command will be interpreted which is .text
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;
            // executes the strSQL statement to the connected database
            command.ExecuteNonQuery();
            // executing Commit method for myTransaction object
            myTransaction.Commit();
            // close command is used to close existing connection and recordsaved is assigned with true value
            conn.Close();
            userSaved = true;
        }
        catch (Exception ex)
        {
            // rolling back the transaction if it receives an input error
            myTransaction.Rollback();
            userSaved = false;
        }
        return userSaved;

    }

    public static string GetName(string Database, string accessLevel, string userID)
    {
        string name = "";
        string mySelectQuery;

        OleDbConnection sqlConn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Database); ;

        //checking which type of user
        if (accessLevel == "C")
        {
            mySelectQuery = "SELECT ClientName FROM tblClient WHERE UserID = " + userID;
        }
        else
        {
            mySelectQuery = "SELECT ManagerName FROM tblContractManager WHERE UserID = " + userID;
        }

        OleDbCommand myCommand = new OleDbCommand(mySelectQuery, sqlConn);
        // assigning new OleDbConnection class to sqlConn object

        sqlConn.Open();
        OleDbDataReader myReader = myCommand.ExecuteReader();
        //assign result to name variable
        while (myReader.Read())
        {
            name = myReader.GetString(0);
        }
        //closing connections
        myReader.Close();
        sqlConn.Close();
        return name;
    }

    public static string GetEmail(string Database, string accessLevel, string userID)
    {
        string Email = "";
        string mySelectQuery;

        OleDbConnection sqlConn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Database); ;

        //checking which type of user
        if (accessLevel == "C")
        {
            mySelectQuery = "SELECT EmailAddress FROM tblClient WHERE UserID = " + userID;
        }
        else
        {
            mySelectQuery = "SELECT EmailAddress FROM tblContractManager WHERE UserID = " + userID;
        }

        OleDbCommand myCommand = new OleDbCommand(mySelectQuery, sqlConn);
        // assigning new OleDbConnection class to sqlConn object

        sqlConn.Open();
        OleDbDataReader myReader = myCommand.ExecuteReader();
        //assign result to name variable
        while (myReader.Read())
        {
            Email = myReader.GetString(0);
        }
        //closing connections
        myReader.Close();
        sqlConn.Close();
        return Email;
    }
}