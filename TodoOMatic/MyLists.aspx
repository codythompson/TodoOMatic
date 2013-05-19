<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Standard.Master" AutoEventWireup="true" CodeBehind="MyLists.aspx.cs" Inherits="TodoOMatic.MyLists" %>
<%@ Register TagPrefix="uc" TagName="UserLists" Src="~/UserControls/UserLists.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Your Lists</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StandardMasterContent" runat="server">
    <div class="row-fluid">
        <div class="span4 offset4">
            <uc:UserLists ID="myListsUserLists" runat="server" />
        </div>
    </div>
</asp:Content>
