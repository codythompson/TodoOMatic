using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TodoOMaticDataAccess
{
    public static class Utils
    {
        public const string TodoUserKey = "TodoUser";
        public const string AuthRedirectPath = "~/Login.aspx";
        public const string AuthDestQSKey = "dest";

        public static void AddCSSLink(Page page, string url)
        {
            Literal cssLink = new Literal();
            cssLink.Text = "<link rel=\"stylesheet\" href=\"" + url + "\" type=\"text/css\" />";
            page.Header.Controls.Add(cssLink);
        }

        public static void AddJSScript(Page page, string url)
        {
            Literal script = new Literal();
            script.Text = "<script src=\"" + url + "\" type=\"text/javascript\"></script>";
            page.Header.Controls.Add(script);
        }

        public static bool IsLocal(HttpRequest request)
        {
            return request.Url.Host == "localhost";
        }

        public static DatabaseObject GetDBO(HttpRequest request)
        {
            bool isLocal = IsLocal(request);
            return new DatabaseObject(isLocal);
        }

        public static string GetAuthRedirectUrl(Page page)
        {
            return AuthRedirectPath + "?" + AuthDestQSKey + "=" + page.Server.UrlEncode(page.Request.RawUrl);
        }

        public static void Auth(Page page, int userId, string userFName, string userLName)
        {
            TodoUser user = new TodoUser(userId, userFName, userLName);
            page.Session[TodoUserKey] = user;
            if (!string.IsNullOrEmpty(page.Request.QueryString[AuthDestQSKey]))
            {
                string redir = "~" + page.Server.UrlDecode(page.Request.QueryString[AuthDestQSKey]);
                page.Response.Redirect(redir);
            }
        }

        public static TodoUser CheckAuthed(Page page, bool redirectIfNotAuthed)
        {
            TodoUser user = page.Session[TodoUserKey] as TodoUser;
            if (user == null && redirectIfNotAuthed)
            {
                string redir = GetAuthRedirectUrl(page);
                page.Response.Redirect(redir);
            }
            return user;
        }

        public static bool IsAuthedForList(HttpRequest request, int userId, int listId)
        {
            DatabaseObject dbo = GetDBO(request);
            DataTable authedLists = DataAccess.GetUsersListIds(dbo, userId);

            return authedLists.AsEnumerable().Where(r => (int)r["list_id"] == listId).Any();
        }
    }
}
