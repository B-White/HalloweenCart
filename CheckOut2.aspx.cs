using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckOut2 : System.Web.UI.Page
{
    private Customer customer;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        customer = (Customer)Session["Customer"];

        string message =
            "Contact information\n" +
            "    Email: " + customer.EmailAddress + "\n" +
            "    First name: " + customer.FirstName + "\n" +
            "    Last name: " + customer.LastName + "\n" +
            "    Phone number: " + customer.Phone + "\n" +
            "    Birthdate: " + customer.BirthDate + "\n" +
            "Billing address\n" +
            "    Address: " + customer.Address + "\n" +
            "    City: " + customer.City + "\n" +
            "    State: " + customer.State + "\n" +
            "    Zip code: " + customer.Zip + "\n" +
            "Let me know about\n" + 
            "    New products: " + customer.NewProductsInfo + "\n" +
            "    Special offers: " + customer.SpecialPromosInfo + "\n" +
            "    New editions: " + customer.NewRevisionsInfo + "\n" +
            "    Local events: " + customer.LocalEventsInfo + "\n" +
            "Contact me via\n" + 
            "    Twitter: " + customer.ContactViaTwitter + "\n" +
            "    Facebook: " + customer.ContactViaFacebook + "\n" +
            "    Text message: " + customer.ContactViaText + "\n" +
            "    Email: " + customer.ContactViaEmail + "\n";      

        txtData.Text = message;
    }
}