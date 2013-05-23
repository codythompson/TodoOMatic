<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListItem.ascx.cs" Inherits="TodoOMatic.UserControls.ListItem" %>

<div class="list-item-parent">
    <div class="list-item row-fluid btn-toolbar">
        <div class="btn-group span4" onclick="showEditName(this);">
            <asp:Label ID="listItemName" runat="server" CssClass="btn btn-primary span12" />
        </div>
        <div class="btn-group span4">
            <!-- Shopping List -->
            <asp:Panel ID="listItemInCartPnl" runat="server" Visible="false" CssClass="btn-group span7 row-fluid">
                <asp:LinkButton ID="listItemInCart" runat="server" CssClass="btn btn-info span6 left"
                    OnClick="listItemCompleted_Click">
                    In Cart?
                </asp:LinkButton>
                <asp:LinkButton ID="listItemInCartCheckbox" runat="server" CssClass="btn btn-info span6 right"
                    OnClick="listItemCompleted_Click" >
                    <asp:Image ID="listItemInCartCheckboxImg" runat="server" ImageUrl="~/styles/images/checkbox.png" AlternateText="Not in cart" />
                    <asp:Image ID="listItemInCartCheckboxImgChecked" runat="server" Visible="false"
                        ImageUrl="~/styles/images/checkbox-checked.png" AlternateText="In cart" />
                </asp:LinkButton>
            </asp:Panel>
            <asp:Panel ID="listItemQtyPnl" runat="server" Visible="false" CssClass="span5 row-fluid">
                <asp:Label ID="listItemQty" runat="server" CssClass="btn btn-info span12"
                    onclick="showEditQty(this);" />
            </asp:Panel>

            <!-- TODO Boolean style -->
            <asp:LinkButton ID="listItemCompleted" runat="server" Visible="false"
                CssClass="btn btn-info span6 offset1 left" OnClick="listItemCompleted_Click">
                Completed?
            </asp:LinkButton>
            <asp:LinkButton ID="listItemCompletedCheckbox" runat="server" Visible="false"
                CssClass="btn btn-info span4 right" OnClick="listItemCompleted_Click">
                <asp:Image ID="listItemCompletedCheckboxImg" runat="server"
                    ImageUrl="~/styles/images/checkbox.png" AlternateText="Not Completed" />
                <asp:Image ID="listItemCompletedCheckboxImgChecked" runat="server" Visible="false"
                    ImageUrl="~/styles/images/checkbox-checked.png" AlternateText="Completed" />
            </asp:LinkButton>
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
                    <asp:LinkButton ID="listItemDelete" runat="server" Text="Delete item forever"
                        OnClick="listItemDelete_Click" />
                </li>
            </ul>
        
        </div>
        <div class="span2 btn-group">
            <span class="btn btn-success dropdown-toggle span12" data-toggle="dropdown">
                Add to List
                <span class="caret"></span>
            </span>
            <ul class="dropdown-menu">
                <li>
                    <a>This feature is not yet available.</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="list-item-edit list-item-edit-name row-fluid input-append">
        <asp:TextBox ID="listItemEditName" runat="server" TextMode="SingleLine" MaxLength="255" 
            placeholder="Enter the new item name (255 character max)" CssClass="span6" 
            ToolTip="Enter the new item name (255 character max)" />
        <asp:Button ID="listItemEditNameButton" runat="server" OnClick="listItemEditNameButton_Click"
            Text="Save" CssClass="btn btn-primary span2" />
        <asp:Panel ID="listItemEditNameErrors" runat="server" Visible="false"
            CssClass="list-item-edit-error">
            <asp:Panel ID="listItemEditNameErrorRequired" runat="server" Visible="false">
                Please enter a new name for this item.
            </asp:Panel>
        </asp:Panel>
    </div>
    <asp:Panel ID="listItemEditQtyPnl" runat="server" Visible="false"
        CssClass="list-item-edit list-item-edit-qty row-fluid input-append">
        <asp:TextBox ID="listItemEditQty" runat="server" TextMode="SingleLine"
            placeholder="Qty" CssClass="span1" ToolTip="Enter the new quantity" />
        <asp:Button ID="listItemEditQtyButton" runat="server" OnClick="listItemEditQtyButton_Click"
            Text="Save" CssClass="btn btn-primary span2" />
    </asp:Panel>
</div>