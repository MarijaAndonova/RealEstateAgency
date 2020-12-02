<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RealEstateAgency.Account.Login" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1>Логирај се.</h1>
    </hgroup>
    <section id="loginForm">
        <h2>Користи локално корисничко име за регистрација.</h2>
        <asp:Login  ID="login1" runat="server" ViewStateMode="Disabled" RenderOuterTable="false">
            <LayoutTemplate>
                <p class="validation-summary-errors">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>

                
                            <asp:Label ID="tip_korisnik" runat="server" AssociatedControlID="tip_korisnik_db">Избери тип на корисник</asp:Label>
                            <asp:DropDownList ID="tip_korisnik_db" runat="server" AutoPostBack="true" >
                                <asp:ListItem Enabled="true" Selected="True" Text="Избери тип на корисник"></asp:ListItem>
                                <asp:ListItem Value="klient">Клиент</asp:ListItem>
                                <asp:ListItem Value="sopstvenik">Сопственик</asp:ListItem>
                                <asp:ListItem Value="vraboten">Вработен</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="tip_korisnik_db" CssClass="field-validation-error" ErrorMessage="Задолжително поле." />

                <fieldset>
                    <legend>Форма за регистрација</legend>
                    <ol>
                        <li>
                            <asp:Label runat="server" AssociatedControlID="UserName">Корисничко име</asp:Label>
                            <asp:TextBox runat="server" ID="UserName" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="Задолжително поле." />
                        </li>
                        <li>
                            <asp:Label runat="server" AssociatedControlID="Password">Лозинка</asp:Label>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="Задолжително поле." />
                        </li>
                        <li>
                            <asp:CheckBox runat="server" ID="RememberMe" />
                            <asp:Label runat="server" AssociatedControlID="RememberMe" CssClass="checkbox">Запамти ме?</asp:Label>
                        </li>
                    </ol>
                    <asp:Button ID="LoginButton" runat="server" Text="Логирај се" OnClick="Unnamed6_Click" />
                </fieldset>
            </LayoutTemplate>
        </asp:Login>

        <asp:Label ID="LabelResult" ForeColor="Red" runat="server" Text=""></asp:Label>
        <p>
            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Регистрирај се</asp:HyperLink>
            доколку немаш корисничко име.
        </p>
    </section>

    <section id="socialLoginForm">
        <h2>Искористи друг сервис за логирање.</h2>
        <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
    </section>
</asp:Content>
