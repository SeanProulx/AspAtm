<%@ Page Title="Overview" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Overview.aspx.cs" Inherits="Overview" Theme="Accessible" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset>
         <!-- This table is to display users account information -->
        <legend>Account Overview</legend>
        <table>
            <!-- Table Row, User's Name -->
            <tr>
                <td>Name: </td>
                <td><asp:Label ID="name" runat="server" /></td>
            </tr>
            <!-- Table Row, User's Balance -->
            <tr>
                <td>Account Balance: </td>
                <td><asp:Label ID="balance" runat="server" /></td>
            </tr>
            <!-- Table Row, User's last three transactions -->
            <tr>
                <td>Last three transactions:</td>
            </tr>
                <tr><td><asp:Label ID="transact1" runat="server" /></td></tr>       
                <tr><td><asp:Label ID="transact2" runat="server" /></td></tr>
                <tr><td><asp:Label ID="transact3" runat="server" /></td><tr>
            </tr>
        </table>
        <br />
        <br />
        <asp:Label ID="error" runat="server" ForeColor="Red" />
    </fieldset>
</asp:Content>

