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
        public static DataTable GetUsersLists(DatabaseObject dbo, int userId, int listStatusId)
        {
            string query = @"use " + dbo.DBName + ";";
            query += @"
                select l.* from user_list ul
                left join list l
                    on ul.list_id = l.list_id
                where ul.list_status_id = @listStat
                    and ul.user_id = @userId;
            ";

            return dbo.Select(query, new SqlParameter("@userId", userId),
                new SqlParameter("@listStat", listStatusId));
        }
    }
}
