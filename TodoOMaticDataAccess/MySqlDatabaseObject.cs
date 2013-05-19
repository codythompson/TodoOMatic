using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace TodoOMaticDataAccess
{
    /// <summary>
    /// Summary description for DatabaseObject
    /// </summary>
    public class MySqlDatabaseObject
    {
        //private const string _host = "localhost";
        //private const string _userid = "dev_user";
        //private const string _pword = "sql_33@Buser";
        //private const string _dbname = "sandbox";

        private const string _host = "listomatic.db.11106559.hostedresource.com";
        private const string _userid = "listomatic";
        private const string _pword = "t216h4o8m@blah";
        private const string _dbname = "listomatic";

        public string cs;

        public MySqlConnection connection;

        public MySqlDatabaseObject()
        {
            cs = @"server={0};userid={1};password={2};database={3}";
            cs = string.Format(cs, _host, _userid, _pword, _dbname);
            //cs = @"server=localhost;userid=dev_user;password=sql_33@Buser;database=sandbox";

            connection = null;
            try
            {
                connection = new MySqlConnection(cs);
                connection.Open();
            }
            //catch (MySqlException e)
            //{
            //    throw new Exception(cs);
            //}
            finally
            {
                if (connection != null)
                {
                    connection.Close();
                }
            }
        }

        public DataTable Select(string query, params MySqlParameter[] sqlParams)
        {
            MySqlCommand cmd = new MySqlCommand(query, connection);
            foreach (MySqlParameter p in sqlParams)
            {
                cmd.Parameters.Add(p);
            }
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);

            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;

        }

        public DataRow SelectSingleRow(string query, params MySqlParameter[] sqlParams)
        {
            return Select(query, sqlParams).Rows[0];
        }
    }
}