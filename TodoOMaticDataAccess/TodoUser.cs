using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web.UI;

namespace TodoOMaticDataAccess
{
    public class TodoUser
    {
        public int UserId;
        public string FirstName, LastName;

        public TodoUser(int userId, string firstName, string lastName)
        {
            UserId = userId;
            FirstName = firstName;
            LastName = lastName;
        }
    }
}
