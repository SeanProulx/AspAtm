using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["currentUser"] == null) Response.Redirect("~/Default.aspx");

        if (!IsPostBack)
        {
            ATMDataContext db = new ATMDataContext();
            People currentUser = (People)Session["currentUser"];

            programGridView.DataSource = (from p in db.Transactions where p.PersonId == currentUser.PersonId select p);
            programGridView.DataBind();
        }
    }
}