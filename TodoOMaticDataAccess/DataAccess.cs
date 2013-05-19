using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace TodoOMaticDataAccess
{
    public static class DataAccess
    {
        public const int ActiveStatusId = 1;

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
    }
}
