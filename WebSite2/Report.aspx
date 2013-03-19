<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Report" Theme="Accessible" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset>
    <!-- Report table, display user's information-->
    <legend>Report</legend>
    <legend>Transactions</legend>
        <!-- Initialize GridView -->
        <asp:GridView ID="programGridView" 
                      runat="server" 
                      AutoGenerateColumns="false" 
                      BackColor="Black" 
                      ForeColor="White" 
                      HeaderStyle-BackColor="White" 
                      HeaderStyle-ForeColor="Black"
                      RowStyle-Font-Size="Small"
                      Width="100%">
            <!-- Initialize Columns to just display Transaction type, amount transferred and the date -->
            <Columns>
                <asp:BoundField DataField="TransactionTypeId" HeaderText="Transfer type" />
                <asp:BoundField DataField="AmountTransferred" HeaderText="Amount Transferred" />
                <asp:BoundField DataField="DateOfTransaction" HeaderText="Date Transferred" />
            </Columns>
        </asp:GridView>
    </fieldset>
</asp:Content>

