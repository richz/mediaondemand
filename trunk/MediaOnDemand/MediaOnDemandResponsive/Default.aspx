<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="MediaOnDemand.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        
        <%--      <form class="form-signin" role="form">--%>
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="email" class="form-control" placeholder="Email address" required="" autofocus=""/>
        <input type="password" class="form-control" placeholder="Password" required=""/>
        <label class="checkbox">
          <input type="checkbox" value="remember-me"/> Remember me
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      <%--</form>--%>

    </div>
</asp:Content>
