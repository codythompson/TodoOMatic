<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserLists.ascx.cs" Inherits="TodoOMatic.UserControls.UserLists" %>

<div class="user-lists colors-info">
    <asp:Repeater ID="userListsView" runat="server" OnItemDataBound="userListsView_ItemDataBound">
        <ItemTemplate>
            <div class="user-list row-fluid">
                <asp:HyperLink ID="userListLink" runat="server" CssClass="span6 btn-primary btn">
                    <asp:Label ID="userListName" runat="server" />
                </asp:HyperLink>
                <asp:Label ID="userListType" runat="server" CssClass="span6" />
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>

<asp:Panel ID="userListsNotLoggedIn" runat="server" Visible="false">
    <div class="colors-error colors-error-border">
        You must be logged in to view your lists.
        <asp:HyperLink ID="userListsLoginButton" runat="server" CssClass="btn btn-primary" Text="Login" />
    </div>
</asp:Panel>