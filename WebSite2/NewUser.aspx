<%@ Page Title="Register" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="NewUser.aspx.cs" Inherits="NewUser" Theme="Accessible" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset>
    <!-- Table, this is to get user information for registering a new account-->
        <legend>Registration Form</legend>
        <table>
            <!-- Table Row, User's First name -->
            <tr>
                <td>*First Name: </td>
                <td>
                    <asp:TextBox ID="fname" runat="server"/>
                    <asp:RequiredFieldValidator id="fnameValidator" runat="server" 
                        ControlToValidate="fname" ErrorMessage="Required Field" ForeColor="Red"/>
                </td>
            </tr>
            <!-- Table Row, User's Last Name -->
            <tr>
                <td>*Last Name: </td>
                <td>
                     <asp:TextBox ID="lname" runat="server"/>
                     <asp:RequiredFieldValidator id="lnameValidator" runat="server" 
                         ControlToValidate="lname" ErrorMessage="Required Field" ForeColor="Red"/>
                </td>
            </tr>
            <!-- Table Row, User's Email -->
            <tr>
                <td>*Email Address: </td>
                <td>
                    <asp:TextBox ID="emailAddress" runat="server"/>
                    <asp:RequiredFieldValidator ID="emailaddressValidator" runat="server"
                                                ControlToValidate="emailAddress" ErrorMessage="Required Field"
                                                ForeColor="Red" />
                </td>
                <td>
                    <asp:RegularExpressionValidator runat="server" 
                                    ID="emailValidator" 
                                    ControlToValidate="emailAddress" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ErrorMessage="Enter valid email address" 
                                    ForeColor="Red"/>
                </td>
            </tr>
            <!-- Table Row, User's Password -->
            <tr>
                <td>*Password: </td>
                <td>
                    <asp:TextBox TextMode="Password" ID="pwd" runat="server" MaxLength="10" />
                    <asp:RequiredFieldValidator ID="passwordValidator" runat="server" 
                        ControlToValidate="pwd" ErrorMessage="Required Field" ForeColor="Red"/>
                </td>
            </tr>
            <!-- Table Row, User's SIN -->
            <tr>
                <td>*Social Insurance Number: </td>
                <td>
            
                       <asp:TextBox ID="SIN" runat="server" MaxLength="11" />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="emailAddress" ErrorMessage="Required Field"
                                ForeColor="Red" />

                </td>
                <!-- Validate SIN using regex -->
                <td>
                    <asp:RegularExpressionValidator
                                    id="RegularExpressionValidator1"
                                    runat="server"
                                    ErrorMessage="Enter valid SIN"
                                    ControlToValidate="SIN"
                                    ValidationExpression="[0-9]{11}" 
                                    ForeColor="Red"/>
                </td>
            </tr>
            <!-- Table Row, Submit form button -->
            <tr>
                <td>
                    <asp:Button ID="button" runat="server" OnClick="submit" Text="  Submit  "/>
                </td>
            </tr>
            <!-- Table Row, Error label -->
            <tr>
                <td>
                    <asp:Label ForeColor="Red" runat="server" ID="error" />
                </td>
            </tr>

            <tr>
                <td><h5>* indicates required fields</h5></td>
            </tr>

        </table>
   </fieldset>
</asp:Content>

