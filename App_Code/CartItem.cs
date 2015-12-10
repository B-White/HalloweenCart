using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class CartItem
{
    public Product Product { get; set; }
    public int Quantity { get; set; }

    public CartItem()
    {
    }

    public CartItem(Product product, int quantity)
    {
        this.Product = product;
        this.Quantity = quantity;
    }

    public void AddQuantity(int quantity)
    {
        this.Quantity += quantity;
    }
    
    public string Display()
    {
        string displayString = string.Format("{0} ({1} at {2} each)",Product.Name, Quantity.ToString(),
        Product.UnitPrice.ToString("c"));

        return displayString;
    }
}