using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WithdrawMoney : System.Web.UI.Page
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
            decimal balance = 0;
            Transaction toInsert = new Transaction
            {
                AmountTransferred = decimal.Parse(withdrawamount.Text),
                PersonId = currentUser.PersonId,
                DateOfTransaction = System.DateTime.Now.ToLocalTime(),
                TransactionTypeId = 2
            };
            try
            {
                var allTransactions = (from t in db.Transactions
                                       where t.PersonId == currentUser.PersonId
                                       select t);

                foreach (Transaction t in allTransactions)
                {
                    if (t.TransactionTypeId == 1) balance += t.AmountTransferred;
                    else if (t.TransactionTypeId == 2) balance -= t.AmountTransferred;
                }

                if (balance < toInsert.AmountTransferred)
                    this.Ok.Text = "Cannot withdraw from account";

                else
                {
                    db.Transactions.InsertOnSubmit(toInsert);
                    db.SubmitChanges();
                    this.Ok.Text = "Amount succesfully withdrawed";
                }
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