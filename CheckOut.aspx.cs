using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckOut : System.Web.UI.Page
{
    private Customer customer;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            customer = (Customer)Session["Customer"];
            this.LoadCustomerData();
        }
    }
    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            this.GetCustomerData();
            Response.Redirect("~/CheckOut2.aspx");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("Cart");
        Session.Remove("Customer");
        Response.Redirect("~/Order.aspx");
    }
    private void LoadCustomerData()
    {
        if (customer != null)
        {
            txtFirstName.Text = customer.FirstName;
            txtLastName.Text = customer.LastName;
            txtEmail1.Text = customer.EmailAddress;
            txtPhone.Text = customer.Phone;
            txtAddress.Text = customer.Address;
            txtCity.Text = customer.City;
            ddlState.SelectedValue = customer.State;
            txtZip.Text = customer.Zip;
            cblAboutList.Items[0].Selected = customer.NewProductsInfo;
            cblAboutList.Items[1].Selected = customer.SpecialPromosInfo;
            cblAboutList.Items[2].Selected = customer.NewRevisionsInfo;
            cblAboutList.Items[3].Selected = customer.LocalEventsInfo;
            //rblContactVia.SelectedValue = customer.ContactVia;
            lstContactVia.Items[0].Selected = customer.ContactViaTwitter;
            lstContactVia.Items[1].Selected = customer.ContactViaFacebook;
            lstContactVia.Items[2].Selected = customer.ContactViaText;
            lstContactVia.Items[3].Selected = customer.ContactViaEmail;
            txtBirth.Text = customer.BirthDate;
            
        }
    }
    private void GetCustomerData()
    {
        if (customer == null)
            customer = new Customer();
        customer.FirstName = txtFirstName.Text;
        customer.LastName = txtLastName.Text;
        customer.EmailAddress = txtEmail1.Text;
        customer.Phone = txtPhone.Text;
        customer.Address = txtAddress.Text;
        customer.City = txtCity.Text;
        customer.State = ddlState.SelectedValue;
        customer.Zip = txtZip.Text;
        customer.NewProductsInfo = cblAboutList.Items[0].Selected;
        customer.SpecialPromosInfo = cblAboutList.Items[1].Selected; 
        customer.NewRevisionsInfo = cblAboutList.Items[2].Selected; 
        customer.LocalEventsInfo = cblAboutList.Items[3].Selected;
        //if (rblContactVia.SelectedValue == "Twitter") { customer.ContactViaTwitter = true; }
        //if (rblContactVia.SelectedValue == "Facebook") { customer.ContactViaFacebook = true; }
        //if (rblContactVia.SelectedValue == "Text") { customer.ContactViaText = true; }
        //if (rblContactVia.SelectedValue == "Email") { customer.ContactViaEmail = true; }
        customer.ContactViaTwitter = lstContactVia.Items[0].Selected;
        customer.ContactViaFacebook = lstContactVia.Items[1].Selected;
        customer.ContactViaText = lstContactVia.Items[2].Selected;
        customer.ContactViaEmail = lstContactVia.Items[3].Selected;
        customer.BirthDate = txtBirth.Text;
        Session["Customer"] = customer;
    }
}