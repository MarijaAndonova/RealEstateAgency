<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login_user.aspx.cs" Inherits="RealEstateAgency.Login_user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">


    
                    <h2>Форма за регистрација</h2><br />
                    
                            <asp:Label ID="LabelUsername" runat="server" >Корисничко име</asp:Label><br />
                            <asp:TextBox runat="server" ID="UserName" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="Задолжително поле." />
                        <br />
                            <asp:Label ID="LabelPassword" runat="server">Лозинка</asp:Label><br />
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="Задолжително поле." />
                        <br />
                    <asp:Button ID="ButtonLogin" runat="server" Text="Логирај се" OnClick="ButtonLogin_Click" />
                <br />

    <asp:Label ID="LabelResult" runat="server" Text="Label"></asp:Label>

</asp:Content>
