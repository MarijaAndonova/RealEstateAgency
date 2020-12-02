<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RealEstateAgency._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Домашна страна:</h1>
                <h2>Што нуди нашата компанија?</h2>
            </hgroup>
            
            <table style="width:100%">
              <tr>
                <td><img alt="logo" class="auto-style1" src="Images/home.png" /></td>
                <td>Нашата мисија е да бидеме најуспешната агенција за недвижности во
             Р. Македонија. Обединувајќи го позитивниот пристап, професионалната услуга и лојалност, 
            како и сите нови технологии и работни алатки, го создаваме нашиот приоритет - 
            постојано подобрување и усовршување на производите и УСЛУГИТЕ кои ги нудиме.</td>		
               </tr>
            </table>
&nbsp;</div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>Услуги кои ги даваме:</h3>
    <ol class="round">
        <li class="one">
            <h5>Преглед на имоти</h5>
           Нашата компанија се грижи за нашите клиенти, им дава можност на клиентите да
             на брз и едноставен начин го пронајде својот дом.
        </li>
        <li class="two">
            <h5>Изнајмување или купување на имоти</h5>
            Посредуваме при изнајмување и купување на имот. По избраниот имот, ви
             овозможуваме склучување на договор со сопственикот.
        </li>
        <li class="three">
            <h5>Сакате и вие да бидете сопственик, да продавате или изнајмувате?</h5>
            Доколку барате компанија која ќе го промовира (продава или издава) вашиот имот, 
            тогаш компанијата Топом - Дом е вискиски избор за вас.
        </li>
    </ol>
</asp:Content>
