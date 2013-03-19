using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/**
 * This class handles the CloseAccount page
 */
public partial class CloseAccount : System.Web.UI.Page
{
    /**
     * Page load event, if session is null redirect to default login page.
     */
    protected void Page_Load(object sender, EventArgs e){
        if (Session["currentUser"] == null) Response.Redirect("~/Default.aspx");
        Error.Text = "";
    }

    /**
     * close button event, verify account information entered is correct
     */
    protected void close(object sender, EventArgs e){
        try{
            if (IsPostBack){
                //Create new data context
                ATMDataContext db = new ATMDataContext();
                //Pull current session
                People currentuser = (People)Session["currentUser"];
                //Verify information entered by the user
                People ai = (from _ai in db.Peoples
                             where _ai.EmailAddress == emailaddress.Text
                             && _ai.Password == password.Text
                             select _ai).FirstOrDefault();
                //ai returns null if user is incorrect
                if (ai != null){
                    //Eliminate people and transactions associated with closed account
                    var deletePeople = (from p in db.Peoples 
                                        where p.EmailAddress == ai.EmailAddress 
                                        select p);
                    var deleteTransactions = (from p in db.Transactions
                                              where p.PersonId == ai.PersonId
                                              select p);
                    //submit queries
                    db.Peoples.DeleteAllOnSubmit(deletePeople);
                    db.Transactions.DeleteAllOnSubmit(deleteTransactions);
                    db.SubmitChanges();
                    //Let user know it was deleted
                    Error.Text = "Account successfully deleted";
                    //Redirect to login page if the current user was deleted
                    if (currentuser.PersonId == ai.PersonId){
                        Session["currentUser"] = null;
                        Response.Redirect("~/Default.aspx");
                    }
                //if ai returned null, an error occured
                }
                else Error.Text = "Invalid account";
            }
        }
        //Database error
        catch (Exception ex) { Error.Text = "Could not process"; }
    }
}