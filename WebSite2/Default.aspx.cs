using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/**
 * Handle the default page (user login)  
 */
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e){
        Error.Text = "";
    }
    protected void login(object sender, EventArgs e){
        try{
            if (IsPostBack){
                //Create datacontext object
                ATMDataContext db = new ATMDataContext();
                //Retrieve people based on user input, make sure it is valid
                People ai = (from _ai in db.Peoples
                             where _ai.EmailAddress == emailAddress.Text
                             && _ai.Password == password.Text
                             select _ai).FirstOrDefault();
                //ai returns null if not valid entry
                if (ai != null){
                    //if successful, insert the date the user logged in to database.
                    ai.LastLoginDateTime = System.DateTime.Now.ToLocalTime();
                    db.SubmitChanges();
                    Session["currentUser"] = ai;
                    Response.Redirect("~/Overview.aspx");
                }
                //else login was invalid
                else Error.Text = "Invalid Login";
            }
        }
        //database error
        catch (Exception ex) { Error.Text = "Invalid Login"; }
    }
}