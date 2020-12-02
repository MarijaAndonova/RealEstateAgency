<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Katalog.aspx.cs" Inherits="RealEstateAgency.Katalog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1>Каталог.</h1>
        <h2>Место за пребарување на имот</h2>
    </hgroup>
    <script type="text/javascript">
        function deleteConfirm(pubid) {
            var result = confirm('Are you sure that you want to delete ' + pubid + ' ?');
            if (result) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>
    <div id="DivFormaZaDodavanjeImoti" runat="server" visible="false">
            <fieldset>
                    <legend>Форма за додавање, бришење и модификација на имот</legend>
                    <ol>

                        <li>
                            <asp:Label ID="tip_objekt" runat="server" AssociatedControlID="tip_objekt_db">Избери тип на објект</asp:Label>
                            <asp:DropDownList ID="tip_objekt_db" runat="server" AutoPostBack="true" OnSelectedIndexChanged="tip_objekt_db_SelectedIndexChanged">
                                <asp:ListItem Enabled="true" Selected="True" Text="Изберете тип на имот"></asp:ListItem>
                                <asp:ListItem Value="kukja">Куќа</asp:ListItem>
                                <asp:ListItem Value="stan">Стан</asp:ListItem>
                                <asp:ListItem Value="kancelarija">Канцеларија</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tip_objekt_db" CssClass="field-validation-error" ErrorMessage="Задолжително поле." />
                        </li>

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
                            <asp:Label ID="LabelUploadMapa" runat="server" Text="Прикачи Мапа"></asp:Label><br />
                            <asp:FileUpload ID="FileUploadMapa" runat="server" />
                            <asp:Label ID="LabelUploadMapaStatus" ForeColor="#00ff00" runat="server"></asp:Label><br />
                        </li>

                        <li>
                            <asp:Label ID="kvadratura_l" runat="server" AssociatedControlID="kvadratura_tb">Квадратура</asp:Label>
                            <asp:TextBox runat="server" ID="kvadratura_tb" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="kvadratura_tb" CssClass="field-validation-error" ErrorMessage="Задолжително поле." />
                        </li>

                        <li>
                            <asp:Label ID="sopstvenik_l" runat="server" AssociatedControlID="sopstvenici_db">Сопственик</asp:Label>
                            <asp:DropDownList ID="sopstvenici_db" runat="server" DataTextField="fulname" DataValueField="id"></asp:DropDownList>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="sopstvenici_db" CssClass="field-validation-error" ErrorMessage="Задолжително поле." />
                        --%>
                        </li>
                            
                        <li>
                            <asp:Label ID="LabelUloadSlika" runat="server" Text="Прикачи слика"></asp:Label><br />
                            <asp:FileUpload ID="FileUploadSlika" runat="server" />
                            <asp:Label ID="LabelUploadStatus" ForeColor="#00ff00" runat="server"></asp:Label><br />
                       </li>
                            
                            <!-- К У Ќ А  -->
                        <li id="kukja" >
                            <asp:Label ID="kvadraturaDvor_l" runat="server" AssociatedControlID="kvadraturaDvor_tb"  Visible="False">Квадратура на двор</asp:Label>
                            <asp:TextBox runat="server" ID="kvadraturaDvor_tb"  Visible="False" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"  ControlToValidate="kvadraturaDvor_tb" CssClass="field-validation-error" ErrorMessage="Задолжително поле." Visible="False" />
                        </li>

                        <!-- K А Н Ц Е Л А Р И Ј А  -->
                        <li id="kancelarija" >
                            <asp:Label ID="internet_l" runat="server" AssociatedControlID="internet_tb" Visible="False">Интернет</asp:Label>
                            <asp:TextBox runat="server" ID="internet_tb" Visible="False" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="internet_tb" CssClass="field-validation-error" ErrorMessage="Задолжително поле." Visible="False" />
                        </li>

                        <!-- С Т А Н -->
                        <li id="stan1" >
                            <asp:Label ID="sprat_l" runat="server" AssociatedControlID="sprat_tb" Visible="False">Спрат</asp:Label>
                            <asp:TextBox runat="server" ID="sprat_tb"  Visible="False" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"  ControlToValidate="sprat_tb" CssClass="field-validation-error" ErrorMessage="Задолжително поле." Visible="False" />
                        </li>

                        <li id="stan2" >
                            <asp:Label ID="parno_l" runat="server" AssociatedControlID="parno_tb" Visible="False">Парно</asp:Label>
                            <asp:TextBox runat="server" ID="parno_tb" Visible="False" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"  ControlToValidate="parno_tb" CssClass="field-validation-error" ErrorMessage="Задолжително поле." Visible="False" />
                        </li>

                        <li id="stan3">
                            <asp:Label ID="parking_l" runat="server" AssociatedControlID="parking_tb" Visible="False">Паркинг</asp:Label>
                            <asp:TextBox runat="server" ID="parking_tb" Visible="False" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="parking_tb" CssClass="field-validation-error" ErrorMessage="Задолжително поле." Visible="False" />
                        </li>
                    </ol>

                    <asp:Button ID="dodadi_b" runat="server"  Text="Додади" OnClick="dodadi_b_Click" />
                    
                <asp:Label ID="LabelResultObjekt" runat="server" Text="" ForeColor="Green"></asp:Label>
                <asp:Label ID="LabelResultVidObjekt" runat="server" Text="" ForeColor="Green"></asp:Label>


                </fieldset>
        </div>

    <div id="gridViewImotiSamoPrikaz" runat="server" visible="false">
        
        <h2>Куќи</h2>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\AgencijaZaNEdviznini.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" 
                ProviderName="System.Data.SqlClient" 
                SelectCommand="SELECT objekt.ulica, objekt.grad, objekt.sobi, objekt.urlMapa, objekt.kvadratura, objekt.linkSliki, kukja.KVADRATURADVOR FROM objekt INNER JOIN kukja ON objekt.idObjekt = kukja.idObjekt">
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ulica" HeaderText="ulica" SortExpression="ulica" />
                    <asp:BoundField DataField="grad" HeaderText="grad" SortExpression="grad" />
                    <asp:BoundField DataField="sobi" HeaderText="sobi" SortExpression="sobi" />
                    <asp:ImageField DataImageUrlField="urlMapa" HeaderText="urlMapa" SortExpression="urlMapa" ControlStyle-Width="100"/>
                    <asp:BoundField DataField="kvadratura" HeaderText="kvadratura" SortExpression="kvadratura" />
                    <asp:ImageField DataImageUrlField="linkSliki" HeaderText="linkSliki" SortExpression="linkSliki" ControlStyle-Width="100"/>
                    <asp:BoundField DataField="KVADRATURADVOR" HeaderText="KVADRATURADVOR" SortExpression="KVADRATURADVOR" />
                </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>

        <br />

        >
        <h2>Стан</h2>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\AgencijaZaNEdviznini.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" 
            ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT objekt.ulica, objekt.grad, objekt.sobi, objekt.urlMapa, objekt.kvadratura, objekt.linkSliki, objekt.idSopstvenik, stan.sprat, stan.parno, stan.parking FROM objekt INNER JOIN stan ON objekt.idObjekt = stan.idObjekt"></asp:SqlDataSource>
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ulica" HeaderText="ulica" SortExpression="ulica" />
                    <asp:BoundField DataField="grad" HeaderText="grad" SortExpression="grad" />
                    <asp:BoundField DataField="sobi" HeaderText="sobi" SortExpression="sobi" />
                    <asp:ImageField DataImageUrlField="urlMapa" HeaderText="urlMapa" SortExpression="urlMapa" ControlStyle-Width="100"/>
                    <asp:BoundField DataField="kvadratura" HeaderText="kvadratura" SortExpression="kvadratura" />
                    <asp:ImageField DataImageUrlField="linkSliki" HeaderText="linkSliki" SortExpression="linkSliki" ControlStyle-Width="100"/>
                    <asp:BoundField DataField="idSopstvenik" HeaderText="idSopstvenik" SortExpression="idSopstvenik" />
                    <asp:BoundField DataField="sprat" HeaderText="sprat" SortExpression="sprat" />
                    <asp:BoundField DataField="parno" HeaderText="parno" SortExpression="parno" />
                    <asp:BoundField DataField="parking" HeaderText="parking" SortExpression="parking" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>

        <br />

        <asp:Label ID="LabelKancelarija" runat="server" Text="Канцеларија"></asp:Label>
        <h2>Канцеларии</h2>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\AgencijaZaNEdviznini.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" 
                SelectCommand="SELECT objekt.ulica, objekt.grad, objekt.sobi, objekt.urlMapa, objekt.kvadratura, objekt.linkSliki, objekt.idSopstvenik, kancelarija.internet, kancelarija.idObjekt FROM objekt INNER JOIN kancelarija ON objekt.idObjekt = kancelarija.idObjekt"></asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ulica" HeaderText="ulica" SortExpression="ulica" />
                    <asp:BoundField DataField="grad" HeaderText="grad" SortExpression="grad" />
                    <asp:BoundField DataField="sobi" HeaderText="sobi" SortExpression="sobi" />
                    <asp:ImageField DataImageUrlField="urlMapa" HeaderText="urlMapa" SortExpression="urlMapa" ControlStyle-Width="100"/>
                    <asp:BoundField DataField="kvadratura" HeaderText="kvadratura" SortExpression="kvadratura" />
                    <asp:ImageField DataImageUrlField="linkSliki" HeaderText="linkSliki" SortExpression="linkSliki" ControlStyle-Width="100"/>
                    <asp:BoundField DataField="internet" HeaderText="internet" SortExpression="internet" />
                    <asp:BoundField DataField="idSopstvenik" HeaderText="idSopstvenik" SortExpression="idSopstvenik" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
    </div>

    <div id="gridViewImotiAdmin" runat="server" visible="false">
        <br />
        <h2>Промени објект</h2>
        <asp:SqlDataSource ID="SqlDataSourceObjekt" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\AgencijaZaNEdviznini.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" DeleteCommand="DELETE FROM [objekt] WHERE [idObjekt] = @idObjekt" InsertCommand="INSERT INTO [objekt] ([ulica], [grad], [sobi], [urlMapa], [kvadratura], [linkSliki], [idSopstvenik]) VALUES (@ulica, @grad, @sobi, @urlMapa, @kvadratura, @linkSliki, @idSopstvenik)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [objekt]" UpdateCommand="UPDATE [objekt] SET [ulica] = @ulica, [grad] = @grad, [sobi] = @sobi, [urlMapa] = @urlMapa, [kvadratura] = @kvadratura, [linkSliki] = @linkSliki, [idSopstvenik] = @idSopstvenik WHERE [idObjekt] = @idObjekt">
            <DeleteParameters>
                <asp:Parameter Name="idObjekt" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ulica" Type="String" />
                <asp:Parameter Name="grad" Type="String" />
                <asp:Parameter Name="sobi" Type="String" />
                <asp:Parameter Name="urlMapa" Type="String" />
                <asp:Parameter Name="kvadratura" Type="Int32" />
                <asp:Parameter Name="linkSliki" Type="String" />
                <asp:Parameter Name="idSopstvenik" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ulica" Type="String" />
                <asp:Parameter Name="grad" Type="String" />
                <asp:Parameter Name="sobi" Type="String" />
                <asp:Parameter Name="urlMapa" Type="String" />
                <asp:Parameter Name="kvadratura" Type="Int32" />
                <asp:Parameter Name="linkSliki" Type="String" />
                <asp:Parameter Name="idSopstvenik" Type="Int32" />
                <asp:Parameter Name="idObjekt" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewObjekt" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idObjekt" DataSourceID="SqlDataSourceObjekt" >
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="idObjekt" HeaderText="idObjekt" InsertVisible="False" ReadOnly="True" SortExpression="idObjekt" />
                <asp:BoundField DataField="ulica" HeaderText="ulica" SortExpression="ulica" />
                <asp:BoundField DataField="grad" HeaderText="grad" SortExpression="grad" />
                <asp:BoundField DataField="sobi" HeaderText="sobi" SortExpression="sobi" />
                <asp:ImageField DataImageUrlField="urlMapa" HeaderText="urlMapa" SortExpression="urlMapa" ControlStyle-Width="100"/>
                <asp:BoundField DataField="kvadratura" HeaderText="kvadratura" SortExpression="kvadratura" />
                <asp:ImageField DataImageUrlField="linkSliki" HeaderText="linkSliki" SortExpression="linkSliki" ControlStyle-Width="100"/>
                <asp:BoundField DataField="idSopstvenik" HeaderText="idSopstvenik" SortExpression="idSopstvenik" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <br />
        <h2>Промени куќа</h2>
        <asp:SqlDataSource ID="SqlDataSourcePromeniKukja" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\AgencijaZaNEdviznini.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" DeleteCommand="DELETE FROM [kukja] WHERE [idKukja] = @idKukja" InsertCommand="INSERT INTO [kukja] ([KVADRATURADVOR], [idObjekt]) VALUES (@KVADRATURADVOR, @idObjekt)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [kukja]" UpdateCommand="UPDATE [kukja] SET [KVADRATURADVOR] = @KVADRATURADVOR, [idObjekt] = @idObjekt WHERE [idKukja] = @idKukja">
            <DeleteParameters>
                <asp:Parameter Name="idKukja" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="KVADRATURADVOR" Type="Int32" />
                <asp:Parameter Name="idObjekt" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="KVADRATURADVOR" Type="Int32" />
                <asp:Parameter Name="idObjekt" Type="Int32" />
                <asp:Parameter Name="idKukja" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewPromeniKukja" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idKukja" DataSourceID="SqlDataSourcePromeniKukja">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="idKukja" HeaderText="idKukja" InsertVisible="False" ReadOnly="True" SortExpression="idKukja" />
                <asp:BoundField DataField="KVADRATURADVOR" HeaderText="KVADRATURADVOR" SortExpression="KVADRATURADVOR" />
                <asp:BoundField DataField="idObjekt" HeaderText="idObjekt" SortExpression="idObjekt" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <br />
        <h2>Промени Стан</h2>
        <asp:SqlDataSource ID="SqlDataSourcePromeniStan" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\AgencijaZaNEdviznini.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" DeleteCommand="DELETE FROM [stan] WHERE [idStan] = @idStan" InsertCommand="INSERT INTO [stan] ([sprat], [parno], [parking], [idObjekt]) VALUES (@sprat, @parno, @parking, @idObjekt)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [stan]" UpdateCommand="UPDATE [stan] SET [sprat] = @sprat, [parno] = @parno, [parking] = @parking, [idObjekt] = @idObjekt WHERE [idStan] = @idStan">
            <DeleteParameters>
                <asp:Parameter Name="idStan" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="sprat" Type="Int32" />
                <asp:Parameter Name="parno" Type="String" />
                <asp:Parameter Name="parking" Type="String" />
                <asp:Parameter Name="idObjekt" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="sprat" Type="Int32" />
                <asp:Parameter Name="parno" Type="String" />
                <asp:Parameter Name="parking" Type="String" />
                <asp:Parameter Name="idObjekt" Type="Int32" />
                <asp:Parameter Name="idStan" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewPromeniStan" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idStan" DataSourceID="SqlDataSourcePromeniStan">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="idStan" HeaderText="idStan" InsertVisible="False" ReadOnly="True" SortExpression="idStan" />
                <asp:BoundField DataField="sprat" HeaderText="sprat" SortExpression="sprat" />
                <asp:BoundField DataField="parno" HeaderText="parno" SortExpression="parno" />
                <asp:BoundField DataField="parking" HeaderText="parking" SortExpression="parking" />
                <asp:BoundField DataField="idObjekt" HeaderText="idObjekt" SortExpression="idObjekt" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <br />
        <h2>Промени канцеларија</h2>
        <asp:SqlDataSource ID="SqlDataSourcePromeniKancelarija" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\AgencijaZaNEdviznini.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [kancelarija]" DeleteCommand="DELETE FROM [kancelarija] WHERE [idKancelarija] = @idKancelarija" InsertCommand="INSERT INTO [kancelarija] ([internet], [idObjekt]) VALUES (@internet, @idObjekt)" UpdateCommand="UPDATE [kancelarija] SET [internet] = @internet, [idObjekt] = @idObjekt WHERE [idKancelarija] = @idKancelarija">
            <DeleteParameters>
                <asp:Parameter Name="idKancelarija" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="internet" Type="String" />
                <asp:Parameter Name="idObjekt" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="internet" Type="String" />
                <asp:Parameter Name="idObjekt" Type="Int32" />
                <asp:Parameter Name="idKancelarija" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewPromeniKancelarija" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idKancelarija" DataSourceID="SqlDataSourcePromeniKancelarija">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="idKancelarija" HeaderText="idKancelarija" InsertVisible="False" ReadOnly="True" SortExpression="idKancelarija" />
                <asp:BoundField DataField="internet" HeaderText="internet" SortExpression="internet" />
                <asp:BoundField DataField="idObjekt" HeaderText="idObjekt" SortExpression="idObjekt" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </div>
</asp:Content>
