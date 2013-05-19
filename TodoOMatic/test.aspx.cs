using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TodoOMaticDataAccess;

namespace TodoOMatic
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.CheckAuthed(this, true);

            if (!IsPostBack)
            {
                DatabaseObject dbo = Utils.GetDBO(Request);
                listDropDown.DataSource = DataAccess.GetUsersLists(dbo, 1, 1);
                listDropDown.DataTextField = "list_name";
                listDropDown.DataValueField = "list_id";
                listDropDown.DataBind();
            }
        }

        protected void listDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            //listInfoLabel.Text = listDropDown.SelectedValue + " - " + listDropDown.SelectedItem.Text;
        }
    }
}