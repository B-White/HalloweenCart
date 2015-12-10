<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="CheckOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chapter 6: Shopping Cart</title>
    <link href="Styles/Main.css" rel="stylesheet" />
    <link href="Styles/CheckOut.css" rel="stylesheet" />
</head>
<body>
<header>
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/banner.jpg" />
</header>
<section>
    <h1>CheckOut Page 1</h1>
    <form id="form1" runat="server" defaultfocus="txtEmail1" defaultbutton="btnCheckOut">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <h2>Contact information</h2>
        <label>Email address: </label>
        <asp:TextBox ID="txtEmail1" runat="server" CssClass="entry" TextMode="Email"></asp:TextBox> 
            <asp:RequiredFieldValidator ID="rfvEmail1" runat="server" 
                ErrorMessage="Email is required" CssClass="validator" 
                Display="Dynamic" ControlToValidate="txtEmail1">
            </asp:RequiredFieldValidator>          
        <br />
        <label>Email Re-entry: </label>
        <asp:TextBox ID="txtEmail2" runat="server" CssClass="entry" ></asp:TextBox> 
            <asp:RequiredFieldValidator ID="rfvEmail2" runat="server" 
                ErrorMessage="Email is required" CssClass="validator" 
                Display="Dynamic" ControlToValidate="txtEmail2">
            </asp:RequiredFieldValidator>          
        <br />
        <label>First Name: </label>
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="entry"></asp:TextBox>  
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                ErrorMessage="First name is required" CssClass="validator" 
                Display="Dynamic" ControlToValidate="txtFirstName">
            </asp:RequiredFieldValidator>
            <br />          
        <label>Last Name: </label>
        <asp:TextBox ID="txtLastName" runat="server" CssClass="entry"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                ErrorMessage="Last name is required" CssClass="validator" 
                Display="Dynamic" ControlToValidate="txtLastName">
            </asp:RequiredFieldValidator>
            <br />
        <label>Phone Number:</label>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="entry" TextMode="Phone">999-999-9999</asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" 
            ErrorMessage="Phone number is required." CssClass="validator"
            Display="Dynamic" ControlToValidate="txtPhone" InitialValue="999-999-9999"></asp:RequiredFieldValidator>
        <br />
        <br />
        <label>Date of Birth:</label>
        <asp:TextBox ID="txtBirth" runat="server" CssClass="entry">mm/dd/yyyy</asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtBirth" Display="Dynamic" ErrorMessage="Format should be: mm/dd/yyyy" ForeColor="Red" ValidationExpression="[01]?\d\/[0-3]\d\/\d{4}"></asp:RegularExpressionValidator>
        <h2>Billing address</h2>
        <label>Address: </label>
        <asp:TextBox ID="txtAddress" runat="server" CssClass="entry"></asp:TextBox>       
            <asp:RequiredFieldValidator ID="rfvStreetAddress" runat="server" 
                ErrorMessage="Street Address is required" CssClass="validator" 
                Display="Dynamic" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>   
            <br />
        <label>City: </label><asp:TextBox ID="txtCity" runat="server" CssClass="entry"></asp:TextBox>  
            <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                ErrorMessage="City is required" CssClass="validator" 
                Display="Dynamic" ControlToValidate="txtCity"></asp:RequiredFieldValidator>        
            <br />
        <label>State: </label>
        <asp:DropDownList ID="ddlState" runat="server" CssClass="entry" 
            AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
            DataTextField="StateName" DataValueField="StateCode">
            <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
        </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvState" runat="server" 
                ErrorMessage="State is required" CssClass="validator" 
                Display="Dynamic" ControlToValidate="ddlState">
            </asp:RequiredFieldValidator><br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [StateCode], [StateName] FROM [States] ORDER BY [StateCode]">
        </asp:SqlDataSource>
        <label>Zip code: </label>
        <asp:TextBox ID="txtZip" runat="server" CssClass="entry" MaxLength="5">
        </asp:TextBox>    
            <asp:RequiredFieldValidator ID="rfvZip" runat="server" 
                ErrorMessage="Zip is required" CssClass="validator" 
                Display="Dynamic" ControlToValidate="txtZip">
            </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Use this format: 99999 or 99999-9999" ControlToValidate="txtZip" Display="Dynamic" ForeColor="Red" ValidationExpression="\d{5}(-\d{4})?"></asp:RegularExpressionValidator>
        <br />
        <h2>Optional data</h2>
        <div id="optionalData">
            Please let me know about:
            <asp:CheckBoxList ID="cblAboutList"  runat="server" RepeatColumns="2">
                <asp:ListItem Value="New" Selected="True">New products</asp:ListItem>
                <asp:ListItem Value="Special">Special offers</asp:ListItem>
                <asp:ListItem Value="Revisions">New editions</asp:ListItem>
                <asp:ListItem Value="Local">Local events</asp:ListItem>
            </asp:CheckBoxList>
            Please contact me via:<br />
            <asp:ListBox ID="lstContactVia" runat="server" SelectionMode="Multiple">
                <asp:ListItem>Twitter</asp:ListItem>
                <asp:ListItem>Facebook</asp:ListItem>
                <asp:ListItem Value="Text">Text Message</asp:ListItem>
                <asp:ListItem>Email</asp:ListItem>
            </asp:ListBox><br /><br />
            <%--<asp:radiobuttonlist id="rblContactVia" runat="server" repeatdirection="horizontal">
                <asp:listitem selected="true">Twitter</asp:listitem>
                <asp:listitem>Facebook</asp:listitem>
                <asp:listitem value="text">Text message</asp:listitem>
                <asp:listitem>Email</asp:listitem>
            </asp:radiobuttonlist> --%>
        </div>
            
 
        <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" CssClass="button" 
            OnClick="btnCheckOut_Click"  />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" 
            CausesValidation="False" OnClick="btnCancel_Click" CssClass="button" />
        <asp:LinkButton ID="lbtnContinueShopping" runat="server"
            PostBackUrl="~/Order.aspx" CausesValidation="False">Continue Shopping</asp:LinkButton>
    
    </form>
</section>
</body>
</html>
