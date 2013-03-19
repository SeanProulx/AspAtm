<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DepositMoney.aspx.cs" Inherits="DepositMoney" Theme="Accessible" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset>
        <!-- Table data used to get deposit information from user -->
        <legend>Deposit Money</legend>
        <table>
            <!-- Table Row, Get ammount to deposit into account -->
            <tr>
                <td>Amount to Deposit:</td>

                <td> <asp:TextBox ID="dpsitamount" runat="server" ToolTip="Deposited Amount"/> </td>
                     <!-- Amount is an unsigned value -->
                     <asp:RegularExpressionValidator runat="server" 
                                                     ID="numOnly" 
                                                     ControlToValidate="dpsitamount" 
                                                     ErrorMessage="Positive number only." 
                                                     ForeColor="Red" 
                                                     ValidationExpression="^\d+$.^\d+${2}" />
                     <!-- Amount is a required field -->
                     <asp:RequiredFieldValidator runat="server" 
                                                 ID="required"
                                                 ControlToValidate="dpsitamount" />
            </tr>
            <!-- Table Row, Button to submit deposit -->
            <tr>
                <td>
                    <asp:Button ID="Deposit" runat="server" Text="Deposit" OnClick="submit" />
                </td>
            </tr>
            <!-- Table Row, OK label-->
            <tr>
                <td>
                    <asp:Label ID="Ok" runat="server"/>
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Content>

