using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstateAgency.Models;

namespace RealEstateAgency.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];

            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        protected void Unnamed6_Click(object sender, EventArgs e)
        {
            DropDownList tip_korisnik_db = (DropDownList)login1.FindControl("tip_korisnik_db");
            //var UserNam2e = (TextBox)((Literal)LayoutTemplate.FindControl("litControlTitle")).Text = "Your text";
            string UserName = ((TextBox)login1.FindControl("UserName")).Text;
            Button LoginButton = (Button)login1.FindControl("LoginButton");


            switch (tip_korisnik_db.SelectedValue)
            {
                case "klient": KlientModel km = new KlientModel();
                    if (km.CheckIfKlientExists(UserName))
                    {
                        LoginButton.CommandName = "Login";
                    }
                    else LabelResult.Text = "Не постои таков КЛИЕНТ";
                    break;
                case "vraboten": VrabotenModel vm = new VrabotenModel();
                    if (vm.CheckIfVrabotenExists(UserName))
                    {
                        LoginButton.CommandName = "Login";
                    }
                    else LabelResult.Text = "Не постои таков ВРАБОТЕН";
                    break;
                case "sopstvenik": SopstvenikModel sm = new SopstvenikModel();
                    if (sm.CheckIfSopstvenikExists(UserName))
                    {
                        LoginButton.CommandName = "Login";
                    }
                    else LabelResult.Text = "Не постои таков СОПСТВЕНИК";
                    break;
                default:
                    break;
            }
        }

        
    }
}