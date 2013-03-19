<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CloseAccount.aspx.cs" Inherits="CloseAccount" Theme="Accessible" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset>
    <legend>Close Account</legend>
        <!-- Table for closing account information to be entered by the user -->
        <table>
            <!-- Get user email address -->
            <tr>
                <td>Email address: </td>
                <td>
                    <asp:TextBox ID="emailaddress" runat="server" />
                </td>
            </tr>
            <!-- Get user password -->
            <tr>
                <td>Password: </td>
                <td>
                    <asp:TextBox ID="password" runat="server" TextMode="Password" MaxLength="10" />
                </td>
            </tr>
            <!-- Submit form button -->
            <tr>
                <td> <asp:Button ID="button" runat="server" OnClick="close" Text="  Close Account  " /> </td>
            </tr>
            <!-- error label -->
            <tr>
                <td><p><asp:Label ID="Error" runat="server" ForeColor="Red" /></p></td>
            </tr>
        </table>
    </fieldset>
</asp:Content>

