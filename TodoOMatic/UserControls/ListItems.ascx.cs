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
    public partial class ListItems : System.Web.UI.UserControl
    {
        public const string ListIdQSKey = "listid";

        private TodoUser _user;
        private int _listId;

        protected void Page_Load(object sender, EventArgs e)
        {
            //TODO Verify that the user actually owns the list!!!!!
            _user = Utils.CheckAuthed(Page, false);

            Utils.AddCSSLink(Page, "/styles/UserControls/ListItems.css");
            Utils.AddJSScript(Page, "/scripts/UserControls/ListItems.js");

            if (!IsPostBack)
            {
                if (_user != null)
                {
                    _listId = -1;
                    bool listIdExists = !string.IsNullOrEmpty(Request.QueryString[ListIdQSKey]);
                    if (listIdExists)
                    {
                        listIdExists = int.TryParse(Request.QueryString[ListIdQSKey], out _listId);
                    }

                    if (listIdExists)
                    {
                        bool isAuthedForList = Utils.IsAuthedForList(Request, _user.UserId, _listId);
                        if (isAuthedForList)
                        {
                            Populate();
                        }
                        else
                        {
                            PopulateNotAuthedForList();
                        }
                    }
                    else
                    {
                        PopulateNoListId();
                    }
                    
                }
            }
        }

        private void Populate()
        {
            DatabaseObject dbo = Utils.GetDBO(Request);
            DataTable items = DataAccess.GetListItems(dbo, _listId, DataAccess.StatusActiveId);
            listItemsRepeater.DataSource = items;
            listItemsRepeater.DataBind();
        }

        private void PopulateNotAuthed()
        {
        }

        private void PopulateNoListId()
        {
        }

        private void PopulateNotAuthedForList()
        {
        }

        protected void listItemsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView itemInfo = e.Item.DataItem as DataRowView;
            (e.Item.FindControl("listItem") as ListItem).Populate(itemInfo);
        }
    }
}