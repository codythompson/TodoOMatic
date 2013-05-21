using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace TodoOMaticDataAccess
{
    public class DatabaseObject
    {
        private const string _localConnString = "Data Source=MUSEBOXN\\SQLEXPRESS;Initial Catalog=listomatic;Integrated Security=True";
        private const string _localDbName = "listomatic";
        private const string _goDadConnString = "";
        private const string _goDadDbName = "listomaticSQL";

        public SqlConnection connection;

        public string DBName;

        public DatabaseObject(bool isLocal)
        {
            string cs;
            if (isLocal)
            {
                cs = _localConnString;
                DBName = _localDbName;
            }
            else
            {
                cs = _goDadConnString;
                DBName = _goDadDbName;
            }

            connection = null;
            try
            {
                connection = new SqlConnection(cs);
                connection.Open();
            }
            finally
            {
                if (connection != null)
                {
                    connection.Close();
                }
            }
        }

        public DataTable Select(string query, params SqlParameter[] sqlParams)
        {
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddRange(sqlParams);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public int NonQuery(string query, params SqlParameter[] sqlParams)
        {
            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddRange(sqlParams);

                return cmd.ExecuteNonQuery();
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
