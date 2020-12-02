<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="RealEstateAgency.ManageUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div id="DivKorisnici" runat="server" visible="false">
        <h2>Промени Вработени</h2>
        <asp:SqlDataSource ID="SqlDataSourceVraboteni" runat="server" 
            ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\AgencijaZaNEdviznini.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" 
            DeleteCommand="DELETE FROM [vraboten] WHERE [idVraboten] = @idVraboten" 
            InsertCommand="INSERT INTO [vraboten] ([ime], [prezime], [telefon], [pozicija], [procentPoDogovor], [dataVrabotuvanje], [plata], [linkSlika], [ulica], [grad], [email]) VALUES (@ime, @prezime, @telefon, @pozicija, @procentPoDogovor, @dataVrabotuvanje, @plata, @linkSlika, @ulica, @grad, @email)"
            ProviderName="System.Data.SqlClient" SelectCommand="SELECT [idVraboten], [ime], [prezime], [telefon], [pozicija], [procentPoDogovor], [dataVrabotuvanje], [plata], [linkSlika], [ulica], [grad], [email] FROM [vraboten]" 
            UpdateCommand="UPDATE [vraboten] SET [ime] = @ime, [prezime] = @prezime, [telefon] = @telefon, [pozicija] = @pozicija, [procentPoDogovor] = @procentPoDogovor, [dataVrabotuvanje] = @dataVrabotuvanje, [plata] = @plata, [linkSlika] = @linkSlika, [ulica] = @ulica, [grad] = @grad, [email] = @email WHERE [idVraboten] = @idVraboten">
            <DeleteParameters>
                <asp:Parameter Name="idVraboten" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ime" Type="String" />
                <asp:Parameter Name="prezime" Type="String" />
                <asp:Parameter Name="telefon" Type="String" />
                <asp:Parameter Name="pozicija" Type="String" />
                <asp:Parameter Name="procentPoDogovor" Type="Int32" />
                <asp:Parameter DbType="Date" Name="dataVrabotuvanje" />
                <asp:Parameter Name="plata" Type="Int32" />
                <asp:Parameter Name="linkSlika" Type="String" />
                <asp:Parameter Name="ulica" Type="String" />
                <asp:Parameter Name="grad" Type="String" />
                
                
                <asp:Parameter Name="email" Type="String" />
                
                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ime" Type="String" />
                <asp:Parameter Name="prezime" Type="String" />
                <asp:Parameter Name="telefon" Type="String" />
                <asp:Parameter Name="pozicija" Type="String" />
                <asp:Parameter Name="procentPoDogovor" Type="Int32" />
                <asp:Parameter DbType="Date" Name="dataVrabotuvanje" />
                <asp:Parameter Name="plata" Type="Int32" />
                <asp:Parameter Name="linkSlika" Type="String" />
                <asp:Parameter Name="ulica" Type="String" />
                <asp:Parameter Name="grad" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="idVraboten" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewVraboteni" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idVraboten" DataSourceID="SqlDataSourceVraboteni">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="idVraboten" HeaderText="idVraboten" SortExpression="idVraboten" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="ime" HeaderText="ime" SortExpression="ime" />
                <asp:BoundField DataField="prezime" HeaderText="prezime" SortExpression="prezime" />
                <asp:BoundField DataField="telefon" HeaderText="telefon" SortExpression="telefon" />
                
                <asp:BoundField DataField="pozicija" HeaderText="pozicija" SortExpression="pozicija" />
                <asp:BoundField DataField="procentPoDogovor" HeaderText="procentPoDogovor" SortExpression="procentPoDogovor" />
                <asp:BoundField DataField="dataVrabotuvanje" HeaderText="dataVrabotuvanje" SortExpression="dataVrabotuvanje" />
                <asp:BoundField DataField="plata" HeaderText="plata" SortExpression="plata" />
                <asp:ImageField DataImageUrlField="linkSlika" HeaderText="linkSlika" SortExpression="linkSlika" ControlStyle-Width="100"/>
                <asp:BoundField DataField="ulica" HeaderText="ulica" SortExpression="ulica" />
                <asp:BoundField DataField="grad" HeaderText="grad" SortExpression="grad" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
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

        <h2>Промени Клиенти</h2>
        <asp:SqlDataSource ID="SqlDataSourceKlienti" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\AgencijaZaNEdviznini.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" DeleteCommand="DELETE FROM [klient] WHERE [idKlient] = @idKlient" InsertCommand="INSERT INTO [klient] ([ime], [prezime], [telefon], [email], [ulica], [grad], [link_slika]) VALUES (@ime, @prezime, @telefon, @email, @ulica, @grad, @link_slika)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [idKlient], [ime], [prezime], [telefon], [email], [ulica], [grad], [link_slika] FROM [klient]" UpdateCommand="UPDATE [klient] SET [ime] = @ime, [prezime] = @prezime, [telefon] = @telefon, [email] = @email, [ulica] = @ulica, [grad] = @grad, [link_slika] = @link_slika WHERE [idKlient] = @idKlient">
            <DeleteParameters>
                <asp:Parameter Name="idKlient" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ime" Type="String" />
                <asp:Parameter Name="prezime" Type="String" />
                <asp:Parameter Name="telefon" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="ulica" Type="String" />
                <asp:Parameter Name="grad" Type="String" />
                <asp:Parameter Name="link_slika" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ime" Type="String" />
                <asp:Parameter Name="prezime" Type="String" />
                <asp:Parameter Name="telefon" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="ulica" Type="String" />
                <asp:Parameter Name="grad" Type="String" />
                <asp:Parameter Name="link_slika" Type="String" />
                <asp:Parameter Name="idKlient" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewKlienti" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idKlient" DataSourceID="SqlDataSourceKlienti">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="idKlient" HeaderText="idKlient" InsertVisible="False" ReadOnly="True" SortExpression="idKlient" />
                <asp:BoundField DataField="ime" HeaderText="ime" SortExpression="ime" />
                <asp:BoundField DataField="prezime" HeaderText="prezime" SortExpression="prezime" />
                <asp:BoundField DataField="telefon" HeaderText="telefon" SortExpression="telefon" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="ulica" HeaderText="ulica" SortExpression="ulica" />
                <asp:BoundField DataField="grad" HeaderText="grad" SortExpression="grad" />
                <asp:ImageField DataImageUrlField="link_slika" HeaderText="link_slika" SortExpression="link_slika" ControlStyle-Width="100"/>
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

        <h2>Промени Сопственици</h2>
        <asp:SqlDataSource ID="SqlDataSourceSopstvenici" runat="server" 
            ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\AgencijaZaNEdviznini.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" 
            ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT [idSopstvenik], [ime], [prezime], [telefon], [ulica], [grad], [linkSlika], [email] FROM [sopstvenik]"
            UpdateCommand="UPDATE [sopstvenik] SET [ime] = @ime, [prezime] = @prezime, [telefon] = @telefon, [ulica] = @ulica, [grad] = @grad, [linkSlika] = @linkSlika, [email] = @email WHERE [idSopstvenik] = @idSopstvenik" DeleteCommand="DELETE FROM [sopstvenik] WHERE [idSopstvenik] = @idSopstvenik" InsertCommand="INSERT INTO [sopstvenik] ([ime], [prezime], [telefon], [ulica], [grad], [linkSlika], [email]) VALUES (@ime, @prezime, @telefon, @ulica, @grad, @linkSlika, @email)">
            <DeleteParameters>
                <asp:Parameter Name="idSopstvenik" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ime" Type="String" />
                <asp:Parameter Name="prezime" Type="String" />
                <asp:Parameter Name="telefon" Type="String" />
                <asp:Parameter Name="ulica" Type="String" />
                <asp:Parameter Name="grad" Type="String" />
                <asp:Parameter Name="linkSlika" Type="String" />
                <asp:Parameter Name="email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ime" Type="String" />
                <asp:Parameter Name="prezime" Type="String" />
                <asp:Parameter Name="telefon" Type="String" />
                <asp:Parameter Name="ulica" Type="String" />
                <asp:Parameter Name="grad" Type="String" />
                <asp:Parameter Name="linkSlika" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="idSopstvenik" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewSopstvenici" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceSopstvenici" DataKeyNames="idSopstvenik">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="idSopstvenik" HeaderText="idSopstvenik" InsertVisible="False" ReadOnly="True" SortExpression="idSopstvenik" />
                <asp:BoundField DataField="ime" HeaderText="ime" SortExpression="ime" />
                <asp:BoundField DataField="prezime" HeaderText="prezime" SortExpression="prezime" />
                <asp:BoundField DataField="telefon" HeaderText="telefon" SortExpression="telefon" />
                <asp:BoundField DataField="ulica" HeaderText="ulica" SortExpression="ulica" />
                <asp:BoundField DataField="grad" HeaderText="grad" SortExpression="grad" />
                <asp:ImageField DataImageUrlField="linkSlika" HeaderText="linkSlika" SortExpression="linkSlika" ControlStyle-Width="100"/>
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                
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
