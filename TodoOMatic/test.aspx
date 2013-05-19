<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="TodoOMatic.test" %>
<%@ Register TagPrefix="uc" TagName="UserLists" Src="~/UserControls/UserLists.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>test page</title>
    <link rel="stylesheet" href="/styles/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="/styles/bootstrap-responsive.css" type="text/css" />
    <link rel="stylesheet" href="/styles/MasterPages/standardMaster.css" type="text/css" />
    <link rel="stylesheet" href="/styles/colors.css" type="text/css" />
    <script src="/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc:UserLists ID="testPageUserLists" runat="server" />
    </div>
    </form>
</body>
</html>
