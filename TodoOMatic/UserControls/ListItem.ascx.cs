using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TodoOMaticDataAccess;

namespace TodoOMatic.UserControls
{
    public partial class ListItem : System.Web.UI.UserControl
    {
        //private TodoUser _user;

        public TodoItem Item;

        protected void Page_Load(object sender, EventArgs e)
        {
            //_user = Utils.CheckAuthed(Page, false);
            //if (!IsPostBack)
            //{
            //    Utils.AddCSSLink(Page, "/styles/UserControls/UserLists.css");

            //    if (_user != null)
            //    {
            //        Populate();
            //    }
            //}

            //if (_user == null)
            //{
            //    PopulateNotAuthed();
            //}
        }

        public void Populate(DataRowView itemInfo)
        {
            Item = new TodoItem(itemInfo);

            listItemName.Text = Item.Name;

            switch (Item.Type)
            {
                case TodoItemType.Plain:
                    break;
                case TodoItemType.Shopping:
                    listItemInCart.Visible = true;
                    listItemQtyPnl.Visible = true;
                    listItemInCart.Text += Item.Completed.ToString();
                    int qty = Item.Quantity;
                    if (qty <= 0)
                    {
                        qty = 1;
                    }
                    listItemQty.Text += qty.ToString();
                    break;
            }
        }

        protected void listItemPurchased_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}