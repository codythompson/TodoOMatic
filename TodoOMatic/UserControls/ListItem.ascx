<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListItem.ascx.cs" Inherits="TodoOMatic.UserControls.ListItem" %>

<div class="list-item-parent">
    <div class="list-item row-fluid btn-toolbar">
        <div class="btn-group span4" onclick="showEditName(this);">
            <asp:Label ID="listItemName" runat="server" CssClass="btn btn-primary span12" />
        </div>
        <div class="btn-group span4">
            <!-- Shopping List -->
            <div class="btn btn-info span7 row-fluid">
                <asp:LinkButton ID="listItemInCart" runat="server" Visible="false" CssClass="span6">
                    In Cart?
                </asp:LinkButton>
                <asp:LinkButton ID="listItemInCartCheckbox" runat="server" Visible="false" CssClass="span6">
                    <img ID="listItemInCartCheckboxImg" runat="server" src="~/styles/images/checkbox.png" alt="Not in cart" />
                </asp:LinkButton>
            </div>
            <asp:Panel ID="listItemQtyPnl" runat="server" Visible="false" CssClass="btn btn-info span5 row-fluid">
                <asp:LinkButton ID="listItemQty" runat="server" Text="Qty: " CssClass="span12" />
            </asp:Panel>

            <!-- TODO Boolean style -->
            <asp:LinkButton ID="listItemCompleted" runat="server" Visible="false"
                CssClass="btn btn-info span6 offset1 list-item-completed-left" OnClick="listItemCompleted_Click">
                Completed?
            </asp:LinkButton>
            <asp:LinkButton ID="listItemCompletedCheckbox" runat="server" Visible="false"
                CssClass="btn btn-info span4 list-item-completed-right" OnClick="listItemCompleted_Click">
                <img id="listItemCompletedCheckboxImg" runat="server" src="~/styles/images/checkbox.png" alt="Not Completed" />
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
            placeholder="Enter the new item name (255 character max)" CssClass="span6" />
        <asp:Button ID="listItemEditNameButton" runat="server" OnClick="listItemEditNameButton_Click"
            Text="Save" CssClass="btn btn-primary span2" />
    </div>
</div>