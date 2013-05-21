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
        private const string ItemVSKey = "ItemId";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void Populate(DataRowView itemInfo)
        {
            TodoItem item = new TodoItem(itemInfo);

            ViewState[ItemVSKey] = item.ItemId;

            listItemName.Text = item.Name;

            switch (item.Type)
            {
                case TodoItemType.Plain:
                    break;
                case TodoItemType.Shopping:
                    listItemInCart.Visible = true;
                    listItemInCartCheckbox.Visible = true;
                    listItemQtyPnl.Visible = true;
                    if (item.Completed)
                    {
                        listItemInCartCheckboxImg.Src = "~/styles/images/checkbox-checked.png";
                        listItemInCartCheckboxImg.Alt = "In Cart";
                    }
                    int qty = item.Quantity;
                    if (qty <= 0)
                    {
                        qty = 1;
                    }
                    listItemQty.Text += qty.ToString();
                    break;
                case TodoItemType.Boolean:
                    listItemCompleted.Visible = true;
                    listItemCompletedCheckbox.Visible = true;
                    if (item.Completed)
                    {
                        listItemCompletedCheckboxImg.Src = "~/styles/images/checkbox-checked.png";
                        listItemCompletedCheckboxImg.Alt = "Completed";
                    }
                    break;
            }
        }

        protected void listItemEditNameButton_Click(object sender, EventArgs e)
        {
            //TODO validation!
            string newName = HttpUtility.HtmlEncode(listItemEditName.Text);

            int itemId = (int)ViewState[ItemVSKey];

            listItemName.Text = newName;

            DatabaseObject dbo = Utils.GetDBO(Request);
            DataAccess.ChangeItemName(dbo, newName, itemId);
        }

        protected void listItemCompleted_Click(object sender, EventArgs e)
        {

        }

        protected void listItemDelete_Click(object sender, EventArgs e)
        {

        }
    }
}