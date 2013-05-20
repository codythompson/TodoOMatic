<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Standard.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="TodoOMatic.List" %>
<%@ Register TagPrefix="uc" TagName="ListItems" Src="~/UserControls/ListItems.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>FIX THIS TITLE</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StandardMasterContent" runat="server">
    <div class="row-fluid">
        <div class="span8 offset2">
            <uc:ListItems ID="listItems" runat="server" />
        </div>
    </div>
</asp:Content>
