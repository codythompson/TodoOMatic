<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListItems.ascx.cs" Inherits="TodoOMatic.UserControls.ListItems" %>
<%@ Register TagPrefix="uc" TagName="ListItem" Src="~/UserControls/ListItem.ascx" %>

<div class="list-items colors-info">
    <asp:Repeater ID="listItemsRepeater" runat="server" OnItemDataBound="listItemsRepeater_ItemDataBound">
        <ItemTemplate>
            <uc:ListItem ID="listItem" runat="server" />
        </ItemTemplate>
    </asp:Repeater>
</div>