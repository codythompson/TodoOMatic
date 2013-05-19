using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TodoOMaticDataAccess;

namespace TodoOMatic.UserControls
{
    public partial class UserLists : System.Web.UI.UserControl
    {
        private TodoUser _user;

        protected void Page_Load(object sender, EventArgs e)
        {
            _user = Utils.CheckAuthed(Page, false);
            if (!IsPostBack)
            {
                Utils.AddCSSLink(Page, "/styles/UserControls/UserLists.css");

                if (_user != null)
                {
                    Populate();
                }
            }

            if (_user == null)
            {
                PopulateError();
            }
        }

        public void Populate()
        {
            //maybe down the road change this to be set from a dropdown or something
            int statusId = DataAccess.ActiveStatusId;
            DatabaseObject dbo = Utils.GetDBO(Request);
            DataTable dt = DataAccess.GetUsersLists(dbo, _user.UserId, statusId);
            userListsView.DataSource = dt;
            userListsView.DataBind();
        }

        public void PopulateError()
        {
            userListsView.Visible = false;
            userListsNotLoggedIn.Visible = true;
            userListsLoginButton.NavigateUrl = Utils.GetAuthRedirectUrl(Page);
        }

        protected void userListsView_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView dr = e.Item.DataItem as DataRowView;
            (e.Item.FindControl("userListName") as Label).Text = dr["list_name"].ToString();
            (e.Item.FindControl("userListType") as Label).Text = dr["item_type_name"].ToString();
        }
    }
}