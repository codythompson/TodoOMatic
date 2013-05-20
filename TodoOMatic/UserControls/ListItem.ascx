<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListItem.ascx.cs" Inherits="TodoOMatic.UserControls.ListItem" %>

<div class="list-item row-fluid btn-toolbar">
    <div class="btn-group span4">
        <asp:Label ID="listItemName" runat="server" CssClass="btn btn-primary span12" />
    </div>
    <div class="btn-group span4">
        <!-- Shopping List -->
        <asp:LinkButton ID="listItemInCart" runat="server" Visible="false" CssClass="btn btn-info span8"
            Text="In Cart?: " />
        <asp:Panel ID="listItemQtyPnl" runat="server" Visible="false" CssClass="btn btn-info span4">
            <asp:Label ID="listItemQty" runat="server" Text="Qty: " />
        </asp:Panel>
    </div>
    <div class="span2 btn-group">
        <span class="btn btn-danger dropdown-toggle span12" data-toggle="dropdown">
            Remove
            <span class="caret"></span>
        </span>
        <ul class="dropdown-menu">
            <li>
                <asp:LinkButton ID="listItemHide" runat="server" Text="Hide item for now" />
            </li>
            <li>
                <asp:LinkButton ID="listItemDelete" runat="server" Text="Delete item forever" />
            </li>
        </ul>
        
    </div>
    <span class="span2 btn btn-success">Share</span>
</div>