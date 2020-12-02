using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstateAgency.Models;

namespace RealEstateAgency
{
    public partial class Dogovor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    string userName = HttpContext.Current.User.Identity.Name;
                    KlientModel km2 = new KlientModel();
                    SopstvenikModel sm2 = new SopstvenikModel();
                    VrabotenModel vm2 = new VrabotenModel();

                    if (km2.CheckIfKlientExists(userName))
                    {
                        
                        gridViewDogovoriSamoPrikaz.Visible = true;
                        gridViewDogovoriAdmin.Visible = false;
                    }
                    if (sm2.CheckIfSopstvenikExists(userName))
                    {

                        gridViewDogovoriSamoPrikaz.Visible = true;
                        gridViewDogovoriAdmin.Visible = true;
                    }
                    if (vm2.CheckIfVrabotenExists(userName))
                    {

                        gridViewDogovoriSamoPrikaz.Visible = true;
                        gridViewDogovoriAdmin.Visible = true;
                    }

                }
                KlientModel km = new KlientModel();
                DropDownListKlienti.DataSource = km.GetAllKlientiZaDropDown();
                DropDownListKlienti.DataBind();

                VrabotenModel vm = new VrabotenModel();
                DropDownListVraboteni.DataSource = vm.GetAllVraboteniZaDropDown();
                DropDownListVraboteni.DataBind();

                ObjektModel om = new ObjektModel();
                DropDownListObjeki.DataSource = om.GetAllObjektiZaDropDown();
                DropDownListObjeki.DataBind();
            }

        }

        protected void DropDownListVidNaDogovor_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (DropDownListVidNaDogovor.SelectedValue)
            {
                case "iznajmuvanje": divIznajmuvanje.Visible = true;
                    divProdavanje.Visible = false;
                    break;
                case "prodavanje": divProdavanje.Visible = true;
                    divIznajmuvanje.Visible = false;
                    break;

                default:
                    break;
            }
        }

        protected void ButtonAddDeal_Click(object sender, EventArgs e)
        {
            DogovorModel dm = new DogovorModel();
            dogovor d = new dogovor();
            d.idKlient = Convert.ToInt32(DropDownListKlienti.SelectedValue);
            d.idVraboten = Convert.ToInt32(DropDownListVraboteni.SelectedValue);
            d.idObjekt = Convert.ToInt32(DropDownListObjeki.SelectedValue);
            d.notar = TextBoxNotar.Text;
            LabelDogovorResult.Text = dm.InsertDogovor(d);
            

            switch (DropDownListVidNaDogovor.SelectedValue)
            {
                case "iznajmuvanje": DogovorIznajmuvanjeModel dim = new DogovorIznajmuvanjeModel();
                    dogovorIznajmuvanje di = new dogovorIznajmuvanje();
                    di.dataOd = Convert.ToDateTime(DateTimePickerIznajmuvanjeOd.Value);
                    di.dataDo = Convert.ToDateTime(DateTimePickerIznajmuvanjeDo.Value);
                    DogovorModel dm2 = new DogovorModel();
                    di.idDogovor = dm2.GetTheLastElementID();
                    LabelIznajmuvanjeResult.Text = dim.InsertDogovorZaIznajmuvanje(di);
                    break;
                case "prodavanje": DogovorProdavanjeModel dpm = new DogovorProdavanjeModel();
                    dogovorProdavanje dp = new dogovorProdavanje();
                    dp.dataOd = Convert.ToDateTime(DateTimePickerProdavanjeDatumOd.Value);
                    
                    DogovorModel dm3 = new DogovorModel();
                    dp.idDogovor = dm3.GetTheLastElementID();

                    LabelIznajmuvanjeResult.Text = dpm.InsertDogovorZaProdavanje(dp);
                    break;

                default:
                    break;
            }
        }
    }
}