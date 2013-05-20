using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace TodoOMaticDataAccess
{
    public class TodoItem
    {
        public int ListId, ItemId;
        public string Name, Descr;
        public int CreatorId;
        public string CreatorFirstName, creatorLastName;
        public TodoItemType Type;
        public string TypeName, TypeDescr;
        public int StatusId;
        public string StatusName, StatusDescr;
        public DateTime EffectiveDate;
        public DateTime DueDate;
        public int Order;
        public int Priority;
        public int AmountCompleted;
        public int TotalToComplete;
        public int Quantity;

        public bool Completed
        {
            get
            {
                return AmountCompleted >= TotalToComplete;
            }
        }

        public TodoItem()
        {
        }

        public TodoItem(DataRowView view_list_items_row)
        {
            //TODO SCRUB THE STRINGS!!!!
            //A user could've input maliscious javascript into the database!
            
            //list and item PK ids
            ListId = Convert.ToInt32(view_list_items_row["list_id"]);
            ItemId = Convert.ToInt32(view_list_items_row["item_id"]);
            
            //item name and description
            Name = view_list_items_row["item_name"].ToString();
            if (DBNull.Value.Equals(view_list_items_row["item_descr"]))
            {
                Descr = "";
            }
            else
            {
                Descr = view_list_items_row["item_descr"].ToString();
            }

            //item creator info
            CreatorId = Convert.ToInt32(view_list_items_row["creator_user_id"]);
            CreatorFirstName = view_list_items_row["user_first_name"].ToString();
            creatorLastName = view_list_items_row["user_last_name"].ToString();
            
            //item type info
            //TODO check that the item_type_value is a valid TodoItemType value first
            Type = (TodoItemType)view_list_items_row["item_type_id"];
            TypeName = view_list_items_row["item_type_name"].ToString();
            if (DBNull.Value.Equals(view_list_items_row["item_type_descr"]))
            {
                TypeDescr = "";
            }
            else
            {
                TypeDescr = view_list_items_row["item_type_descr"].ToString();
            }
            
            //item status info
            StatusId = Convert.ToInt32(view_list_items_row["item_status_id"]);
            StatusName = view_list_items_row["status_name"].ToString();
            if (DBNull.Value.Equals(view_list_items_row["status_descr"]))
            {
                StatusDescr = "";
            }
            else
            {
                StatusDescr = view_list_items_row["status_descr"].ToString();
            }
            
            //effective and due dates
            EffectiveDate = Convert.ToDateTime(view_list_items_row["item_effective_date"]);
            if (DBNull.Value.Equals(view_list_items_row["item_due_date"]))
            {
                DueDate = DateTime.Now;
            }
            else
            {
                DueDate = Convert.ToDateTime(view_list_items_row["item_due_date"]);
            }
            
            // list order number and priority
            Order = Convert.ToInt32(view_list_items_row["item_order"]);
            Priority = Convert.ToInt32(view_list_items_row["item_priority"]);
            
            // completion status
            AmountCompleted = Convert.ToInt32(view_list_items_row["item_amount_completed"]);
            TotalToComplete = Convert.ToInt32(view_list_items_row["item_total_to_complete"]);
            
            // shopping-list qty
            if (DBNull.Value.Equals(view_list_items_row["item_qty"]))
            {
                Quantity = -1;
            }
            else
            {
                Quantity = Convert.ToInt32(view_list_items_row["item_qty"]);
            }
        }
    }

    public enum TodoItemType
    {
        Plain = 1,
        Shopping = 2,
        Boolean = 3,
        Percentage = 4,
        Hours = 5
    }
}
