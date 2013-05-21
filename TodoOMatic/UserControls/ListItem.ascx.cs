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
                    if (item.Completed)
                    {
                        listItemInCartCheckboxImg.Visible = false;
                        listItemInCartCheckboxImgChecked.Visible = true;
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
                        listItemCompletedCheckboxImg.Visible = false;
                        listItemCompletedCheckboxImgChecked.Visible = true;
                    }
                    break;
            }
        }

        protected void listItemEditNameButton_Click(object sender, EventArgs e)
        {
            //TODO validation!
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

        protected void listItemDelete_Click(object sender, EventArgs e)
        {

        }
    }
}