<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Standard.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TodoOMatic.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Please Log In</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StandardMasterContent" runat="server">
    <!-- For testing ONLY -->
    <asp:DropDownList ID="testUsersDropdown" runat="server" />
    <asp:Button ID="testUserSubmit" runat="server" OnClick="testUserSubmit_Click" CssClass="btn" />
    <!-- -->
    <asp:Panel ID="loginErroMessagePnl" runat="server" Visible="false" CssClass="error">
        <asp:Label ID="loginErrorMessageLbl" runat="server" CssClass="text-error" />
    </asp:Panel>
</asp:Content>
