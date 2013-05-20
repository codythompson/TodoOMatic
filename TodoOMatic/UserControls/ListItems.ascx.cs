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
            _user = Utils.CheckAuthed(Page, false);
            if (!IsPostBack)
            {
                Utils.AddCSSLink(Page, "/styles/UserControls/ListItems.css");

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
                        Populate();
                    }
                    else
                    {
                        PopulateNoListId();
                    }
                    
                }
            }

            if (_user == null)
            {
                PopulateNotAuthed();
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

        protected void listItemsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView itemInfo = e.Item.DataItem as DataRowView;
            (e.Item.FindControl("listItem") as ListItem).Populate(itemInfo);
        }
    }
}