using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstateAgency.Models;

namespace RealEstateAgency
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    string userName = HttpContext.Current.User.Identity.Name;
                    KlientModel km = new KlientModel();
                    SopstvenikModel sm = new SopstvenikModel();
                    VrabotenModel vm = new VrabotenModel();

                    if (vm.CheckIfVrabotenExists(userName))
                    {
                        DivKorisnici.Visible = true;
                        
                    }

                }
                
            }
        }
    }
}