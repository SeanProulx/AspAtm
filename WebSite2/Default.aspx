<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Theme="Accessible" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset>
    <!-- Login information table. This table is used to display login information the user must
         supply to login into their account -->
      <legend>Login</legend>
        <table>
            <!-- Table Row, User's Email -->
            <tr>
                <td>Email: </td>
                <td>
                    <asp:TextBox ID="emailAddress" runat="server" />
                </td>
            </tr>
            <!-- Table Row, User's Password -->
            <tr>
                <td>Password: </td>
                <td>
                    <asp:TextBox ID="password" runat="server" TextMode="Password" MaxLength="10" />
                </td>
            </tr>
            <!-- Table Row, Login Buton -->
            <tr>
                <td> <asp:Button ID="button" runat="server" OnClick="login" Text="  Login  " /> </td>
            </tr>
            <!-- Table Row, Hyperlink to register.aspx page -->
            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                    Text="Click here to register"
                    NavigateUrl="~/NewUser.aspx" />
                </td>
            </tr>
            <!-- Table Row, Error label for verification -->
            <tr>
                <td><p><asp:Label ID="Error" runat="server" ForeColor="Red" /></p></td>
            </tr>
        </table>
    </fieldset>
</asp:Content>