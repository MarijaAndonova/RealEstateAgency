<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="RealEstateAgency.Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1>Контакт.</h1>
        <h2>Побарајте не!</h2>
    </hgroup>

    <section class="contact">
        <header>
            <h3>Телефон:</h3>
        </header>
        <p>
            <span class="label">Официјален:</span>
            <span>425.555.0100</span>
        </p>
        <p>
            <span class="label">По работно време:</span>
            <span>425.555.0199</span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Е-mail:</h3>
        </header>
        <p>
            <span class="label">Подршка:</span>
            <span><a href="mailto:Support@example.com">Support@example.com</a></span>
        </p>
        <p>
            <span class="label">Маркетинг:</span>
            <span><a href="mailto:Marketing@example.com">Marketing@example.com</a></span>
        </p>
        <p>
            <span class="label">Друго:</span>
            <span><a href="mailto:General@example.com">General@example.com</a></span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Адреса:</h3>
        </header>
        <p>
            Партизански одреди<br />
            Скопје, РМ
        </p>
    </section>
</asp:Content>