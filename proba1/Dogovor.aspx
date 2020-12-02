<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dogovor.aspx.cs" Inherits="RealEstateAgency.Dogovor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <fieldset>
        <legend>Форма за правење договор</legend>
        <ol>
            <li>
                <asp:Label ID="LabelVidNaDogovor" runat="server" Text="Вид на договор"></asp:Label><br />
                <asp:DropDownList ID="DropDownListVidNaDogovor"  AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownListVidNaDogovor_SelectedIndexChanged">
                    <asp:ListItem Enabled="true" Selected="True" Text="Изберете тип на имот"></asp:ListItem>
                    <asp:ListItem Value="iznajmuvanje">Изнајмување</asp:ListItem>
                    <asp:ListItem Value="prodavanje">Продавање</asp:ListItem>
                </asp:DropDownList>
            </li>
            <li>
                <asp:Label ID="LabelKlienti" runat="server" Text="Клиент"></asp:Label><br />
                <asp:DropDownList ID="DropDownListKlienti" DataTextField="fulname" DataValueField="id"  runat="server"></asp:DropDownList>
            </li>
            <li>
                <asp:Label ID="LabelVraboteni" runat="server" Text="Вработен"></asp:Label><br />
                <asp:DropDownList ID="DropDownListVraboteni" DataTextField="fulname" DataValueField="id" runat="server"></asp:DropDownList>
            </li>
            <li>
                <asp:Label ID="LabelObjekti" runat="server" Text="Објект"></asp:Label><br />
                <asp:DropDownList ID="DropDownListObjeki" DataTextField="fulname" DataValueField="id" runat="server"></asp:DropDownList>
            </li>
            
            <li><asp:Label ID="LabelNotar" runat="server" Text="Нотар"></asp:Label><br />
            <asp:TextBox ID="TextBoxNotar" runat="server"></asp:TextBox></li>
        </ol>
        <div id="divIznajmuvanje" runat="server" visible="false">
            <ol>

                <li>
                    <asp:Label ID="LabelDatumOd" runat="server" Text="Datum od"></asp:Label><br />
                    <input id="DateTimePickerIznajmuvanjeOd" type="date" runat="server" />

                </li>

                <li>
                    <asp:Label ID="LabelDatumDo" runat="server" Text="Datum Do"></asp:Label><br />
                    <input id="DateTimePickerIznajmuvanjeDo" type="date" runat="server" />

                </li>

                <li>
                    <%--<asp:DropDownList ID="DropDownListIznajmuvanjeIdDogovor" runat="server"></asp:DropDownList>--%>

                </li>

            </ol>
        </div>

        <div id="divProdavanje" runat="server" visible="false">

            <ol>

                <li>
                    <asp:Label ID="LabelProdavanjeDatumOd" runat="server" Text="Datum od"></asp:Label><br />
                    <input id="DateTimePickerProdavanjeDatumOd" type="date" runat="server" />

                </li>

                <li>
                    <%--<asp:DropDownList ID="DropDownListProdavanjeIdDogovor" runat="server"></asp:DropDownList>--%>

                </li>

            </ol>
        </div>
        <asp:Label ID="LabelIznajmuvanjeResult" runat="server" Text="" ForeColor="Green"></asp:Label>
        <asp:Label ID="LabelDogovorResult" runat="server" Text="" ForeColor="Green"></asp:Label>
        <asp:Button ID="ButtonAddDeal" runat="server" Text="Додади договор" OnClick="ButtonAddDeal_Click" />
    </fieldset>

    <div id="gridViewDogovoriSamoPrikaz" runat="server" visible="false">
        <h2>Договори за изнајмување</h2>
        <asp:SqlDataSource ID="SqlDataSourceDogovorIznajmuvanje" runat="server" 
            ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\AgencijaZaNEdviznini.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" 
            ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT klient.ime, klient.prezime, klient.email, klient.link_slika, vraboten.ime AS Expr1, vraboten.prezime AS Expr2, vraboten.linkSlika, objekt.ulica, objekt.grad, objekt.sobi, objekt.kvadratura, objekt.linkSliki, dogovorIznajmuvanje.dataOd, dogovorIznajmuvanje.dataDo FROM dogovor INNER JOIN dogovorIznajmuvanje ON dogovor.idDogovor = dogovorIznajmuvanje.idDogovor INNER JOIN klient ON dogovor.idKlient = klient.idKlient INNER JOIN vraboten ON dogovor.idVraboten = vraboten.idVraboten INNER JOIN objekt ON dogovor.idObjekt = objekt.idObjekt"></asp:SqlDataSource>
        <asp:GridView ID="GridViewDogovorIznajmuvanje" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDogovorIznajmuvanje">
            <Columns>
                <asp:BoundField DataField="ime" HeaderText="Ime Klient" SortExpression="ime" />
                <asp:BoundField DataField="prezime" HeaderText="Prezime Klient" SortExpression="prezime" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:ImageField DataImageUrlField="link_slika" HeaderText="link_slika" SortExpression="link_slika" ControlStyle-Width="100"/>
                <asp:BoundField DataField="Expr1" HeaderText="Ime Vraboten" SortExpression="Expr1" />
                <asp:BoundField DataField="Expr2" HeaderText="Prezime Vraboten" SortExpression="Expr2" />
                <asp:ImageField DataImageUrlField="linkSlika" HeaderText="linkSlika" SortExpression="linkSlika" ControlStyle-Width="100"/>
                <asp:BoundField DataField="ulica" HeaderText="ulica" SortExpression="ulica" />
                <asp:BoundField DataField="grad" HeaderText="grad" SortExpression="grad" />
                <asp:BoundField DataField="sobi" HeaderText="sobi" SortExpression="sobi" />
                <asp:BoundField DataField="kvadratura" HeaderText="kvadratura" SortExpression="kvadratura" />
                <asp:ImageField DataImageUrlField="linkSliki" HeaderText="linkSliki" SortExpression="linkSliki" ControlStyle-Width="100"/>
                <asp:BoundField DataField="dataOd" HeaderText="dataOd" SortExpression="dataOd" />
                <asp:BoundField DataField="dataDo" HeaderText="dataDo" SortExpression="dataDo" />
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
        <h2>Договори за продавање</h2>
        <asp:SqlDataSource ID="SqlDataSourceDogovorProdavanje" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\AgencijaZaNEdviznini.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT klient.ime, klient.prezime, klient.email, klient.link_slika, vraboten.ime AS Expr1, vraboten.prezime AS Expr2, vraboten.email AS Expr3, vraboten.linkSlika, objekt.ulica, objekt.grad, objekt.sobi, objekt.kvadratura, objekt.linkSliki, dogovor.notar FROM dogovor INNER JOIN dogovorProdavanje ON dogovor.idDogovor = dogovorProdavanje.idDogovor INNER JOIN klient ON dogovor.idKlient = klient.idKlient INNER JOIN vraboten ON dogovor.idVraboten = vraboten.idVraboten INNER JOIN objekt ON dogovor.idObjekt = objekt.idObjekt"></asp:SqlDataSource>
        <asp:GridView ID="GridViewDogovorProdavanje" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDogovorProdavanje">
            <Columns>
                <asp:BoundField DataField="ime" HeaderText="ime" SortExpression="ime" />
                <asp:BoundField DataField="prezime" HeaderText="prezime" SortExpression="prezime" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:ImageField DataImageUrlField="link_slika" HeaderText="link_slika" SortExpression="link_slika" ControlStyle-Width="100"/>
                <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" />
                <asp:BoundField DataField="Expr2" HeaderText="Expr2" SortExpression="Expr2" />
                <asp:BoundField DataField="Expr3" HeaderText="Expr3" SortExpression="Expr3" />
                <asp:ImageField DataImageUrlField="linkSlika" HeaderText="linkSlika" SortExpression="linkSlika" ControlStyle-Width="100"/>
                <asp:BoundField DataField="ulica" HeaderText="ulica" SortExpression="ulica" />
                <asp:BoundField DataField="grad" HeaderText="grad" SortExpression="grad" />
                <asp:BoundField DataField="sobi" HeaderText="sobi" SortExpression="sobi" />
                <asp:BoundField DataField="kvadratura" HeaderText="kvadratura" SortExpression="kvadratura" />
                <asp:ImageField DataImageUrlField="linkSliki" HeaderText="linkSliki" SortExpression="linkSliki" ControlStyle-Width="100"/>
                <asp:BoundField DataField="notar" HeaderText="notar" SortExpression="notar" />
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

    <div id="gridViewDogovoriAdmin" runat="server" visible="false">
        <h2>Промени договор</h2>
        <asp:SqlDataSource ID="SqlDataSourcePromeniDogovor" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\AgencijaZaNEdviznini.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" DeleteCommand="DELETE FROM [dogovor] WHERE [idDogovor] = @idDogovor" InsertCommand="INSERT INTO [dogovor] ([idKlient], [idVraboten], [idObjekt], [notar]) VALUES (@idKlient, @idVraboten, @idObjekt, @notar)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [dogovor]" UpdateCommand="UPDATE [dogovor] SET [idKlient] = @idKlient, [idVraboten] = @idVraboten, [idObjekt] = @idObjekt, [notar] = @notar WHERE [idDogovor] = @idDogovor">
            <DeleteParameters>
                <asp:Parameter Name="idDogovor" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="idKlient" Type="Int32" />
                <asp:Parameter Name="idVraboten" Type="Int32" />
                <asp:Parameter Name="idObjekt" Type="Int32" />
                <asp:Parameter Name="notar" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="idKlient" Type="Int32" />
                <asp:Parameter Name="idVraboten" Type="Int32" />
                <asp:Parameter Name="idObjekt" Type="Int32" />
                <asp:Parameter Name="notar" Type="String" />
                <asp:Parameter Name="idDogovor" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewPromeniDogovor" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idDogovor" DataSourceID="SqlDataSourcePromeniDogovor">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="idDogovor" HeaderText="idDogovor" InsertVisible="False" ReadOnly="True" SortExpression="idDogovor" />
                <asp:BoundField DataField="idKlient" HeaderText="idKlient" SortExpression="idKlient" />
                <asp:BoundField DataField="idVraboten" HeaderText="idVraboten" SortExpression="idVraboten" />
                <asp:BoundField DataField="idObjekt" HeaderText="idObjekt" SortExpression="idObjekt" />
                <asp:BoundField DataField="notar" HeaderText="notar" SortExpression="notar" />
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
        <h2>Промени договор за изнајмување</h2>
        <asp:SqlDataSource ID="SqlDataSourcePromeniDogovorZaIznajmuvanje" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\AgencijaZaNEdviznini.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" DeleteCommand="DELETE FROM [dogovorIznajmuvanje] WHERE [idDogovorIznajmuvanje] = @idDogovorIznajmuvanje" InsertCommand="INSERT INTO [dogovorIznajmuvanje] ([dataOd], [dataDo], [idDogovor]) VALUES (@dataOd, @dataDo, @idDogovor)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [dogovorIznajmuvanje]" UpdateCommand="UPDATE [dogovorIznajmuvanje] SET [dataOd] = @dataOd, [dataDo] = @dataDo, [idDogovor] = @idDogovor WHERE [idDogovorIznajmuvanje] = @idDogovorIznajmuvanje">
            <DeleteParameters>
                <asp:Parameter Name="idDogovorIznajmuvanje" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="dataOd" />
                <asp:Parameter DbType="Date" Name="dataDo" />
                <asp:Parameter Name="idDogovor" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="dataOd" />
                <asp:Parameter DbType="Date" Name="dataDo" />
                <asp:Parameter Name="idDogovor" Type="Int32" />
                <asp:Parameter Name="idDogovorIznajmuvanje" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewPromeniDogovorZaIznajmuvanje" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idDogovorIznajmuvanje" DataSourceID="SqlDataSourcePromeniDogovorZaIznajmuvanje">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="idDogovorIznajmuvanje" HeaderText="idDogovorIznajmuvanje" InsertVisible="False" ReadOnly="True" SortExpression="idDogovorIznajmuvanje" />
                <asp:BoundField DataField="dataOd" HeaderText="dataOd" SortExpression="dataOd" />
                <asp:BoundField DataField="dataDo" HeaderText="dataDo" SortExpression="dataDo" />
                <asp:BoundField DataField="idDogovor" HeaderText="idDogovor" SortExpression="idDogovor" />
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
        <h2>Промени договор за продавање</h2>
        <asp:SqlDataSource ID="SqlDataSourcePromeniDogovorZaProdavanje" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\AgencijaZaNEdviznini.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" DeleteCommand="DELETE FROM [dogovorProdavanje] WHERE [idDogovorProdavanje] = @idDogovorProdavanje" InsertCommand="INSERT INTO [dogovorProdavanje] ([dataOd], [idDogovor]) VALUES (@dataOd, @idDogovor)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [dogovorProdavanje]" UpdateCommand="UPDATE [dogovorProdavanje] SET [dataOd] = @dataOd, [idDogovor] = @idDogovor WHERE [idDogovorProdavanje] = @idDogovorProdavanje">
            <DeleteParameters>
                <asp:Parameter Name="idDogovorProdavanje" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="dataOd" />
                <asp:Parameter Name="idDogovor" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="dataOd" />
                <asp:Parameter Name="idDogovor" Type="Int32" />
                <asp:Parameter Name="idDogovorProdavanje" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewPromeniDogovorZaProdavanje" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idDogovorProdavanje" DataSourceID="SqlDataSourcePromeniDogovorZaProdavanje">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="idDogovorProdavanje" HeaderText="idDogovorProdavanje" InsertVisible="False" ReadOnly="True" SortExpression="idDogovorProdavanje" />
                <asp:BoundField DataField="dataOd" HeaderText="dataOd" SortExpression="dataOd" />
                <asp:BoundField DataField="idDogovor" HeaderText="idDogovor" SortExpression="idDogovor" />
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
    </div>
</asp:Content>
