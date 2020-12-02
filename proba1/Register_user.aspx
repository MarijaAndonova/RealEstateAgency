<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register_user.aspx.cs" Inherits="RealEstateAgency.Register_user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="tip_korisnik" runat="server" AssociatedControlID="tip_korisnik_db">Избери тип на корисник</asp:Label>
                            <asp:DropDownList ID="tip_korisnik_db" runat="server" AutoPostBack="true" OnSelectedIndexChanged="tip_korisnik_db_SelectedIndexChanged">
                                <asp:ListItem Enabled="true" Selected="True" Text="Избери тип на корисник"></asp:ListItem>
                                <asp:ListItem Value="klient">Клиент</asp:ListItem>
                                <asp:ListItem Value="sopstvenik">Сопственик</asp:ListItem>
                                <asp:ListItem Value="vraboten">Вработен</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="tip_korisnik_db" CssClass="field-validation-error" ErrorMessage="Задолжително поле." />
                        
    
    <fieldset>
                        <legend>Форма за регистрација</legend>

                        
                       
                            

                        <!-- СОПСТВЕНИК -->
                        <div id ="sopstvenik" runat="server" visible="false">
                                        <ol>
                                            
                                                
                                            <li>
                                                <asp:Label ID="ime_l" runat="server" >Име</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtSopstvenikIme"  />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSopstvenikIme"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                            <li>
                                                <asp:Label ID="prezime_l" runat="server" >Презиме</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtSopstvenikPrezime"  />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtSopstvenikPrezime"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                            <li>
                                                <asp:Label ID="telefon_l" runat="server">Телефон</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtSopstvenikTelefon"  />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtSopstvenikTelefon"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                            <li>
                                                <asp:Label ID="ulica_l" runat="server">Улица</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtSopstvenikUlica"  />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSopstvenikUlica"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                            <li>
                                                <asp:Label ID="grad_l" runat="server" >Град</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtSopstvenikGrad"  />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtSopstvenikGrad"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                            <li>
                                                <asp:Label ID="Label10" runat="server" >Прикачи слика</asp:Label><br />
                                                <asp:FileUpload ID="FileUploadSopstvenikSlika" runat="server" />
                                            </li>
                                        </ol> 
                            </div>

                            <!-- ВРАБОТЕН -->
                        <div id ="vraboten" runat="server" visible="false">
                                        <ol>
                                            

                                            <li>
                                                <asp:Label ID="Label15" runat="server">Име</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtVrabotenIme"  />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtVrabotenIme"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                            <li>
                                                <asp:Label ID="Label16" runat="server" >Презиме</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtVrabotenPrezime"  />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtVrabotenPrezime"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                            <li>
                                                <asp:Label ID="Label17" runat="server" >Телефон</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtVrabotenTel"  />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtVrabotenTel"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                            <li>
                                                <asp:Label ID="Label18" runat="server" >Улица</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtVrabotenUlica"  />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtVrabotenUlica"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                            <li>
                                                <asp:Label ID="Label19" runat="server" >Град</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtVrabotenGrad"  />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtVrabotenGrad"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                             <li>
                                                <asp:Label ID="Label20" runat="server" >Позиција</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtVrabotenPozicija"  />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtVrabotenPozicija"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                             <li>
                                                <asp:Label ID="Label21" runat="server" >Процент</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtVrabotenProcent"  />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtVrabotenProcent"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                             <li>
                                                <asp:Label ID="Label22" runat="server" >Датум</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtVrabotenDatum"  />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtVrabotenDatum"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                             <li>
                                                <asp:Label ID="Label23" runat="server" >Плата</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtVrabotenPlata"  />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtVrabotenPlata"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                            <li>
                                                <asp:Label ID="Label24" runat="server" >Избери слика</asp:Label><br />
                                                <asp:FileUpload ID="FileUploadVrabotenSlika" runat="server" />
                                            </li>
                                        </ol> 
                            </div>

                              <!-- КЛИЕНТ -->
                        <div id ="klient" runat="server" visible="false">
                                        <ol>
                                          

                                            <li>
                                                <asp:Label ID="Label29" runat="server" >Име</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtKlientIme" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtKlientIme"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                            <li>
                                                <asp:Label ID="Label30" runat="server" >Презиме</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtKlientPrezime" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtKlientPrezime"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                            <li>
                                                <asp:Label ID="Label31" runat="server">Телефон</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtKlientTel"  />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtKlientTel"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                            <li>
                                                <asp:Label ID="Label32" runat="server" >Улица</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtKlientUlica"  />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="txtKlientUlica"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                            <li>
                                                <asp:Label ID="Label33" runat="server" >Град</asp:Label><br />
                                                <asp:TextBox runat="server" ID="txtKlientGrad"  />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="txtKlientGrad"
                                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле" />
                                            </li>

                                            <li>
                                                <asp:Label ID="Label34" runat="server" >Избери слика</asp:Label><br />
                                                <asp:FileUpload ID="FileUploadKlientSlika" runat="server" />
                                            </li>
                                        </ol> 
                            </div>
        <asp:Label ID="LabelResult2" ForeColor="#00ff00" runat="server" Text=""></asp:Label><br />
                        
                    </fieldset>
    <asp:CreateUserWizard runat="server" ID="RegisterUser" ViewStateMode="Disabled" OnCreatedUser="RegisterUser_CreatedUser">
        <LayoutTemplate>
            <asp:PlaceHolder runat="server" ID="wizardStepPlaceholder" />
            <asp:PlaceHolder runat="server" ID="navigationPlaceholder" />
        </LayoutTemplate>
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" ID="RegisterUserWizardStep">
                <ContentTemplate>
                    

                    <p class="validation-summary-errors">
                        <asp:Literal runat="server" ID="ErrorMessage" />
                    </p>

                    <fieldset>
                        <legend>Форма за регистрација</legend>
                        <ol>
                            <li>
                                <asp:Label ID="Label1" runat="server" AssociatedControlID="UserName">Корисничко име</asp:Label>
                                <asp:TextBox runat="server" ID="UserName" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="UserName"
                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле." />
                            </li>
                            <li>
                                <asp:Label ID="Label2" runat="server" AssociatedControlID="Email">Email</asp:Label>
                                <asp:TextBox runat="server" ID="Email" TextMode="Email" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="Email"
                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле." />
                            </li>
                            <li>
                                <asp:Label ID="Label5" runat="server" AssociatedControlID="Password">Лозинка</asp:Label>
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="Password"
                                    CssClass="field-validation-error" ErrorMessage="Задолжително поле." />
                            </li>
                            <li>
                                <asp:Label ID="Label6" runat="server" AssociatedControlID="ConfirmPassword">Потврди лозинка</asp:Label>
                                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ControlToValidate="ConfirmPassword"
                                     CssClass="field-validation-error" Display="Dynamic" ErrorMessage="Задолжително поле." />
                                <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                     CssClass="field-validation-error" Display="Dynamic" ErrorMessage="Лозинките не се софпаѓаат." />
                            </li>
                        </ol>
                        <asp:Button ID="ButtonRegister" runat="server" CommandName="MoveNext" Text="Регистрирај се" OnClick="ButtonRegister_Click" />
                        
                    </fieldset>
                </ContentTemplate>
                <CustomNavigationTemplate />
            </asp:CreateUserWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    <asp:Label ID="LabelUploadStatus" ForeColor="#00ff00" runat="server"></asp:Label><br />
    <asp:Label ID="LabelResult" runat="server" Text=""></asp:Label>
</asp:Content>
