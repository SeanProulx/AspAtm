<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="WithdrawMoney.aspx.cs" Inherits="WithdrawMoney" Theme="Accessible" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset>
        <legend>Withdraw Money</legend>
        <!-- Withdraw money table, get user amount to withdraw-->
        <table>
            <!-- Get amount to withdraw -->
            <tr>
                <td>Amount to Withdraw:</td>

                <!-- Validate amount using regex, unsigned values -->
                <td> <asp:TextBox ID="withdrawamount" runat="server" ToolTip="Withdrawal Amount"/> </td>
                     <asp:RegularExpressionValidator runat="server" 
                                                     ID="numOnly" 
                                                     ControlToValidate="withdrawamount" 
                                                     ErrorMessage="Positive number only." 
                                                     ForeColor="Red" 
                                                     ValidationExpression="^\d+$" />
                     <!-- Amount is a required field -->
                     <asp:RequiredFieldValidator runat="server" 
                                                 ID="required"
                                                 ControlToValidate="withdrawamount" />
            </tr>
            <!-- Withdraw button to submit form -->
            <tr>
                <td>
                    <asp:Button ID="Withdraw" runat="server" Text="Withdraw" OnClick="submit" />
                </td>
            </tr>
            <!-- OK label -->
            <tr>
                <td>
                    <asp:Label ID="Ok" runat="server"/>
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Content>

