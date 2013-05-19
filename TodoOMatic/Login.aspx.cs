using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//remove later
using TodoOMaticDataAccess;

namespace TodoOMatic
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TestPopulate();
            }
        }

        public void TestPopulate()
        {
            string query = @"
                select top 100
                u.user_id,
                (u.user_first_name + ' ' + u.user_last_name) AS user_full_name
                from [user] u;
            ";

            DatabaseObject dbo = Utils.GetDBO(Request);
            DataTable users = dbo.Select(query);
            testUsersDropdown.DataSource = users;
            testUsersDropdown.DataTextField = "user_full_name";
            testUsersDropdown.DataValueField = "user_id";
            testUsersDropdown.DataBind();
        }

        protected void testUserSubmit_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(testUsersDropdown.SelectedValue);
            string[] userName = testUsersDropdown.SelectedItem.Text.Split(' ');
            if (userName.Length != 2)
            {
                loginErroMessagePnl.Visible = true;
                loginErrorMessageLbl.Text = "An error ocurred while logging you in";
            }
            else
            {
                Utils.Auth(this, userId, userName[0], userName[1]);
            }
        }
    }
}