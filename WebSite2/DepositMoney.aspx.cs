using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DepositMoney : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["currentUser"] == null) Response.Redirect("~/Default.aspx");
        this.Ok.Text = "";
    }

    protected void submit(object sender, EventArgs e)
    {
        if (IsPostBack && Session["currentUser"] != null)
        {
            ATMDataContext db = new ATMDataContext();
            People currentUser = (People)Session["currentUser"];
            Transaction toInsert = new Transaction
            {
                AmountTransferred = decimal.Parse(dpsitamount.Text),
                PersonId = currentUser.PersonId,
                DateOfTransaction = System.DateTime.Now.ToLocalTime(),
                TransactionTypeId = 1
            };
            try
            {
                db.Transactions.InsertOnSubmit(toInsert);
                db.SubmitChanges();
                this.Ok.Text = "Amount succesfully deposited";
            }
            catch (Exception ex) { }
            
        }//endif
        else
        {
            this.Ok.Text = "Must be logged into an account";
            Response.Redirect("~/Default.aspx");
        }
    }
}