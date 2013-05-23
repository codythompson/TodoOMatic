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
        private const string ItemIdVSKey = "ItemId";
        private const string ItemCompleteVSKey = "ItemComplete";
        private const string ItemTypeVSKey = "ItemType";

        private const string ItemQtyPrefix = "Qty: ";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void Populate(DataRowView itemInfo)
        {
            TodoItem item = new TodoItem(itemInfo);

            ViewState[ItemIdVSKey] = item.ItemId;
            ViewState[ItemCompleteVSKey] = item.Completed;
            ViewState[ItemTypeVSKey] = item.Type;

            listItemName.Text = item.Name;

            switch (item.Type)
            {
                case TodoItemType.Plain:
                    break;
                case TodoItemType.Shopping:
                    listItemInCartPnl.Visible = true;
                    listItemQtyPnl.Visible = true;
                    listItemEditQtyPnl.Visible = true;
                    if (item.Completed)
                    {
                        listItemInCartCheckboxImg.Visible = false;
                        listItemInCartCheckboxImgChecked.Visible = true;
                    }
                    int qty = item.Quantity;
                    if (qty < 0)
                    {
                        qty = 1;
                    }
                    listItemQty.Text = ItemQtyPrefix + qty;
                    break;
                case TodoItemType.Boolean:
                    listItemCompleted.Visible = true;
                    listItemCompletedCheckbox.Visible = true;
                    if (item.Completed)
                    {
                        listItemCompletedCheckboxImg.Visible = false;
                        listItemCompletedCheckboxImgChecked.Visible = true;
                    }
                    break;
            }
        }

        protected void listItemEditNameButton_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(listItemEditName.Text))
            {
                listItemEditNameErrors.Visible = true;
                listItemEditNameErrorRequired.Visible = true;
                return;
            }
            else
            {
                listItemEditNameErrors.Visible = false;
                listItemEditNameErrorRequired.Visible = false;
            }
            string newName = HttpUtility.HtmlEncode(listItemEditName.Text);

            int itemId = (int)ViewState[ItemIdVSKey];

            listItemName.Text = newName;

            //TODO make sure it actually made it into the database
            DatabaseObject dbo = Utils.GetDBO(Request);
            DataAccess.ChangeItemName(dbo, newName, itemId);
        }

        protected void listItemCompleted_Click(object sender, EventArgs e)
        {
            int itemId = (int)ViewState[ItemIdVSKey];
            bool isComplete = !(bool)ViewState[ItemCompleteVSKey];
            ViewState[ItemCompleteVSKey] = isComplete;
            TodoItemType type = (TodoItemType)ViewState[ItemTypeVSKey];

            DatabaseObject dbo = Utils.GetDBO(Request);
            // TODO make sure it actually made it into the database
            int rowsAffected = DataAccess.ChangeItemCompletion(dbo, itemId, isComplete);

            switch (type)
            {
                case TodoItemType.Shopping:
                    listItemInCartCheckboxImg.Visible = !isComplete;
                    listItemInCartCheckboxImgChecked.Visible = isComplete;
                    break;
                case TodoItemType.Boolean:
                    listItemCompletedCheckboxImg.Visible = !isComplete;
                    listItemCompletedCheckboxImgChecked.Visible = isComplete;
                    break;
            }
        }

        protected void listItemEditQtyButton_Click(object sender, EventArgs e)
        {
            int itemId = (int)ViewState[ItemIdVSKey];

            int newQty;
            bool isInt = int.TryParse(listItemEditQty.Text, out newQty);
            // TODO use the max SQL value for int, not the c# int32 max
            if (!isInt || newQty < 0 || newQty > Int32.MaxValue)
            {
                //TODO: display an error message in case the validators
                //failed, which they did 
                return;
            }

            DatabaseObject dbo = Utils.GetDBO(Request);
            // TODO make sure it actually made it into the database
            int rowsAffected = DataAccess.ChangeItemQty(dbo, itemId, newQty);

            listItemQty.Text = ItemQtyPrefix + newQty;
        }

        protected void listItemDelete_Click(object sender, EventArgs e)
        {

        }
    }
}