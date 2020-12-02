<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OpenAuthProviders.ascx.cs" Inherits="RealEstateAgency.Account.OpenAuthProviders" %>

<fieldset class="open-auth-providers">
    <legend>Логирајте се со друг сервис</legend>
    
    <asp:ListView runat="server" ID="providerDetails" ItemType="Microsoft.AspNet.Membership.OpenAuth.ProviderDetails"
        SelectMethod="GetProviderNames" ViewStateMode="Disabled">
        <ItemTemplate>
            <button type="submit" name="provider" value="<%#: Item.ProviderName %>"
                title="Логирај се, користејки го твојот <%#: Item.ProviderDisplayName %> акаунт.">
                <%#: Item.ProviderDisplayName %>
            </button>
        </ItemTemplate>
    
        <EmptyDataTemplate>
            <div class="message-info">
                <p>Наскоро !</p>
            </div>
        </EmptyDataTemplate>
    </asp:ListView>
</fieldset>