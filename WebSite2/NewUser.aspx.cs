using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        error.Text = "";
    }

    protected void submit(object sender, EventArgs e)
    {
        ATMDataContext db = new ATMDataContext();
        People toInsert = new People
        {
            FirstName = fname.Text,
            LastName = lname.Text,
            EmailAddress = emailAddress.Text,
            SocialInsuranceNumber = SIN.Text,
            Password = pwd.Text,
            DateAccountCreated = System.DateTime.Now.ToLocalTime(),
            LastLoginDateTime = System.DateTime.Now.ToLocalTime()
        };
        try
        {
            db.Peoples.InsertOnSubmit(toInsert);
            db.SubmitChanges();
            Session["currentUser"] = toInsert;
            Response.Redirect("~/Overview.aspx");
        }
        catch (Exception ex) { error.Text = "An error has occured"; }
    }
}