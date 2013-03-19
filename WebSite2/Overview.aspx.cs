using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Overview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["currentUser"] == null) Response.Redirect("~/Default.aspx");
        this.error.Text = "";

        if (!IsPostBack && Session["currentUser"] != null)
        {
            ATMDataContext db = new ATMDataContext();
            People currentUser = (People)Session["currentUser"];

            decimal balance = 0;
            int i = 0;
            string dporwith = "";

            this.name.Text = currentUser.FirstName;

            var allTransactions = (from t in db.Transactions 
                                   where t.PersonId == currentUser.PersonId 
                                   select t);

            foreach (Transaction t in allTransactions)
            {
                if (t.TransactionTypeId == 1) balance += t.AmountTransferred;
                else if (t.TransactionTypeId == 2) balance -= t.AmountTransferred;
            }

            this.balance.Text = "$" + balance.ToString();


            var last_three_transacs = (from t in db.Transactions
                                       where t.PersonId == currentUser.PersonId
                                       select t).Take(3);

            foreach (Transaction t in last_three_transacs)
            {
                if (t.TransactionTypeId == 1) dporwith = "Deposit";
                else if (t.TransactionTypeId == 2) dporwith = "Withdrawal";
                if (i == 0)
                    this.transact1.Text =
                        "Amount: $ " + t.AmountTransferred.ToString() +
                        " | Date: " + t.DateOfTransaction +
                        " | Type: " + dporwith +
                        "<br/>";
                if (i == 1)
                    this.transact2.Text =
                        "Amount: $ " + t.AmountTransferred.ToString() +
                        " | Date: " + t.DateOfTransaction +
                        " | Type: " + dporwith +
                        "<br/>";
                if (i == 2)
                    this.transact3.Text =
                        "Amount: $ " + t.AmountTransferred.ToString() +
                        " | Date: " + t.DateOfTransaction +
                        " | Type: " + dporwith +
                        "<br/>";
                ++i;
            }
        }
        else
        {
            this.error.Text = "Must be logged into a valid account.";
            this.name.Text = "";
            this.balance.Text = "";
            this.transact1.Text = "";
            this.transact2.Text = "";
            this.transact3.Text = "";
        }
    }
}