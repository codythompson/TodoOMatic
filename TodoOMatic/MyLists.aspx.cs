using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TodoOMaticDataAccess;

namespace TodoOMatic
{
    public partial class MyLists : System.Web.UI.Page
    {
        private TodoUser _user;

        protected void Page_Load(object sender, EventArgs e)
        {
            _user = Utils.CheckAuthed(this, true);

            if (!IsPostBack)
            {
                //should be handled by CheckAuthed, but check again just in case.
                if (_user != null)
                {
                    Populate();
                }
            }

            //should be handled by CheckAuthed, but check again just in case.
            if (_user == null)
            {
                PopulateNotAuthed();
            }
        }

        private void Populate()
        {
        }

        private void PopulateNotAuthed()
        {
            myListsUserLists.Visible = false;
        }
    }
}