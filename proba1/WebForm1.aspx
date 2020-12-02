<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="RealEstateAgency.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <ol>
            <li>
                            <asp:Label ID="ulica_l" runat="server" AssociatedControlID="ulica_tb">Улица</asp:Label>
                            <asp:TextBox runat="server" ID="ulica_tb" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ulica_tb" CssClass="field-validation-error" ErrorMessage="Задолжително поле." />
                        </li>

                     <!--Izbor na grad-->

                        <li>
                            <asp:Label ID="grad_l" runat="server" AssociatedControlID="grad_tb">Град</asp:Label>
                            <asp:DropDownList ID="grad_tb" runat="server" AutoPostBack="true">
                                <asp:ListItem Enabled="true" Selected="True" Text="Изберете град"></asp:ListItem>
                                <asp:ListItem >Берово</asp:ListItem>
                                <asp:ListItem>Битола</asp:ListItem>
                                <asp:ListItem>Богданци</asp:ListItem>
                                <asp:ListItem>Валандово</asp:ListItem>
                                <asp:ListItem>Велес</asp:ListItem>
                                <asp:ListItem>Виница</asp:ListItem>
                                <asp:ListItem>Гевгелија</asp:ListItem>
                                <asp:ListItem>Гостивар</asp:ListItem>
                                <asp:ListItem>Дебар</asp:ListItem>
                                <asp:ListItem>Делчево</asp:ListItem>
                                <asp:ListItem>Демир Капија</asp:ListItem>
                                <asp:ListItem>Демир Хисар</asp:ListItem>
                                <asp:ListItem>Стар Дојран</asp:ListItem>
                                <asp:ListItem>Кавадарци</asp:ListItem>
                                <asp:ListItem>Кичево</asp:ListItem>
                                <asp:ListItem>Кочани</asp:ListItem>
                                <asp:ListItem>Кратово</asp:ListItem>
                                <asp:ListItem>Крива Паланка</asp:ListItem>
                                <asp:ListItem>Крушево</asp:ListItem>
                                <asp:ListItem>Куманово</asp:ListItem>
                                <asp:ListItem>Македонски Брод</asp:ListItem>
                                <asp:ListItem>Македонска Каменица</asp:ListItem>
                                <asp:ListItem>Неготино</asp:ListItem>
                                <asp:ListItem>Охрид</asp:ListItem>
                                <asp:ListItem>Пехчево</asp:ListItem>
                                <asp:ListItem>Прилеп</asp:ListItem>
                                <asp:ListItem>Пробиштип</asp:ListItem>
                                <asp:ListItem>Радовиш</asp:ListItem>
                                <asp:ListItem>Ресен</asp:ListItem>
                                <asp:ListItem>Скопје</asp:ListItem>
                                <asp:ListItem>Струга</asp:ListItem>
                                <asp:ListItem>Струмица</asp:ListItem>
                                <asp:ListItem>Свети Николе</asp:ListItem>
                                <asp:ListItem>Тетово</asp:ListItem>
                                <asp:ListItem>Штип</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="grad_tb" CssClass="field-validation-error" ErrorMessage="Задолжително поле." />
                        </li>

                        <li>
                            <asp:Label ID="sobi_l" runat="server" AssociatedControlID="sobi_tb">Број на соби</asp:Label>
                            <asp:TextBox runat="server" ID="sobi_tb" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="sobi_tb" CssClass="field-validation-error" ErrorMessage="Задолжително поле." />
                        </li>

                        <li>
                            <asp:Label ID="urlMapa_l" runat="server" AssociatedControlID="urlMapa_tb">Линк до мапа</asp:Label>
                            <asp:TextBox runat="server" ID="urlMapa_tb" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="urlMapa_tb" CssClass="field-validation-error" ErrorMessage="Задолжително поле." />
                        </li>

                        <li>
                            <asp:Label ID="kvadratura_l" runat="server" AssociatedControlID="kvadratura_tb">Квадратура</asp:Label>
                            <asp:TextBox runat="server" ID="kvadratura_tb" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="kvadratura_tb" CssClass="field-validation-error" ErrorMessage="Задолжително поле." />
                        </li>

                        <li>
                            <asp:Label ID="sopstvenik_l" runat="server" AssociatedControlID="sopstvenici_db">Сопственик</asp:Label>
                            <asp:DropDownList ID="sopstvenici_db" runat="server"></asp:DropDownList>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="sopstvenici_db" CssClass="field-validation-error" ErrorMessage="Задолжително поле." />
                        --%>
                        </li>
                            
                        <li>
                            <asp:FileUpload ID="FileUploadSlika" runat="server" />
                            <asp:Label ID="LabelUploadStatus" ForeColor="#00ff00" runat="server"></asp:Label><br />
                       </li>
        </ol>

        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" Height="26px" OnClick="Button1_Click" />

    </div>
    </form>
</body>
</html>
