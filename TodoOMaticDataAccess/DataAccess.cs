using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace TodoOMaticDataAccess
{
    public static class DataAccess
    {
        public const int StatusActiveId = 1;

        public static DataTable GetUsersListIds(DatabaseObject dbo, int userId)
        {
            string query = @"use " + dbo.DBName + ";";
            query += @"
                select
                list_id,
                list_status_id
                from user_list
                where user_id = @userId;
            ";

            return dbo.Select(query, new SqlParameter("@userId", userId));
        }
        
        public static DataTable GetUsersLists(DatabaseObject dbo, int userId, int listStatusId)
        {
            string query = @"use " + dbo.DBName + ";";
            query += @"
                select * from view_user_lists vul
                where vul.user_id = @userId
	                and vul.list_status_id = @listStat;
            ";

            return dbo.Select(query, new SqlParameter("@userId", userId),
                new SqlParameter("@listStat", listStatusId));
        }

        public static DataTable GetListItems(DatabaseObject dbo, int listId, int itemStatusId)
        {
            string query = @"use " + dbo.DBName + ";";
            query += @"
                select * from view_list_items vli
                where vli.list_id = @listId
	                and vli.item_status_id = @itemStat;
            ";
            return dbo.Select(query, new SqlParameter("@listId", listId),
                new SqlParameter("@itemStat", itemStatusId));
        }

        public static int ChangeItemName(DatabaseObject dbo, string newName, int itemId)
        {
            newName = HttpUtility.HtmlEncode(newName);

            if (newName.Length > 255)
            {
                throw new Exception("The item name provided is too long.");
            }

            string query = @"use " + dbo.DBName + ";";
            query += @"
                update item
                set item_name = @newName
                where item_id = @itemId;
            ";
            return dbo.NonQuery(query, new SqlParameter("@newName", newName),
                new SqlParameter("@itemId", itemId));
        }

        public static int ChangeItemCompletion(DatabaseObject dbo, int itemId, bool complete)
        {
            string query = @"use " + dbo.DBName + ";";
            if (complete)
            {
                query += @"
                    update item
                    set item_amount_completed = 
	                    (select item_total_to_complete
	                    from item i
	                    where i.item_id = @itemId)
                    where item_id = @itemId;
                ";
            }
            else
            {
                query += @"
                    update item
                    set item_amount_completed = 0
                    where item_id = @itemId;
                ";
            }

            return dbo.NonQuery(query, new SqlParameter("@itemId", itemId));
        }

        public static int ChangeItemQty(DatabaseObject dbo, int itemId, int qty)
        {
            string query = @"use " + dbo.DBName + ";";
            query += @"
                update item
                set item_qty = @itemQty
                where item_id = @itemId;
            ";
            return dbo.NonQuery(query, new SqlParameter("@itemId", itemId),
                new SqlParameter("@itemQty", qty));
        }
    }
}
