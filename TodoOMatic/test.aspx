<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="TodoOMatic.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="listDropDown" runat="server" OnSelectedIndexChanged="listDropDown_SelectedIndexChanged" />
        <asp:Label ID="listInfoLabel" runat="server" />
    </div>
    </form>
</body>
</html>
