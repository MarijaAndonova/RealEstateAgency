using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstateAgency.Models;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using Microsoft.AspNet.Membership.OpenAuth;

namespace RealEstateAgency
{
    public partial class Register_user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            FormsAuthentication.SetAuthCookie(RegisterUser.UserName, createPersistentCookie: false);

            string continueUrl = RegisterUser.ContinueDestinationPageUrl;
            if (!OpenAuth.IsLocalUrl(continueUrl))
            {
                continueUrl = "~/";
            }
            Response.Redirect(continueUrl);
        }


        protected void tip_korisnik_db_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tip_korisnik_db.SelectedValue == "klient")
            {
                klient.Visible = true;
                vraboten.Visible = false;
                sopstvenik.Visible = false;
            }

            if (tip_korisnik_db.SelectedValue == "vraboten")
            {
                klient.Visible = false;
                vraboten.Visible = true;
                sopstvenik.Visible = false;
            }

            if (tip_korisnik_db.SelectedValue == "sopstvenik")
            {
                klient.Visible = false;
                vraboten.Visible = false;
                sopstvenik.Visible = true;
            }
        }

        protected void ButtonRegister_Click(object sender, EventArgs e)
        {
            switch (tip_korisnik_db.SelectedValue)
            {
                case "klient": CreateKlient();
                    break;
                case "vraboten": CreateVraboten();
                    break;
                case "sopstvenik": CreateSopstvenik();
                    break;
                default:
                    break;
            }
            
        }

        protected void CreateVraboten()
        {
            var UserName = (TextBox)RegisterUserWizardStep.ContentTemplateContainer.FindControl("UserName");
            var Email = (TextBox)RegisterUserWizardStep.ContentTemplateContainer.FindControl("Email");
            var Password = (TextBox)RegisterUserWizardStep.ContentTemplateContainer.FindControl("Password");

            VrabotenModel vm = new VrabotenModel();
            vraboten vra = new vraboten();
            vra.ime = txtVrabotenIme.Text;
            vra.prezime = txtVrabotenPrezime.Text;
            vra.telefon = txtVrabotenTel.Text;
            vra.pozicija = txtVrabotenPozicija.Text;
            vra.procentPoDogovor = Convert.ToInt32(txtVrabotenProcent.Text);
            vra.dataVrabotuvanje = Convert.ToDateTime(txtVrabotenDatum.Text);
            vra.plata = Convert.ToInt32(txtVrabotenPlata.Text);
            vra.ulica = txtVrabotenUlica.Text;
            vra.grad = txtVrabotenGrad.Text;
            vra.linkSlika = SaveFile(FileUploadVrabotenSlika.PostedFile, FileUploadVrabotenSlika);

            vra.username = UserName.Text;
            vra.password = Password.Text;
            vra.email = Email.Text;

            LabelResult.Text = vm.InsertVraboten(vra);
            ClearTextBoxesVraboten();
        }

        protected void CreateSopstvenik()
        {
            var UserName = (TextBox)RegisterUserWizardStep.ContentTemplateContainer.FindControl("UserName");
            var Email = (TextBox)RegisterUserWizardStep.ContentTemplateContainer.FindControl("Email");
            var Password = (TextBox)RegisterUserWizardStep.ContentTemplateContainer.FindControl("Password");

            SopstvenikModel sm = new SopstvenikModel();
            sopstvenik sop = new sopstvenik();
            sop.ime = txtSopstvenikIme.Text;
            sop.prezime = txtSopstvenikPrezime.Text;
            sop.telefon = txtSopstvenikTelefon.Text;
            sop.ulica = txtSopstvenikUlica.Text;
            sop.grad = txtSopstvenikGrad.Text;
            sop.linkSlika = SaveFile(FileUploadSopstvenikSlika.PostedFile, FileUploadSopstvenikSlika);
            
            sop.username = UserName.Text;
            sop.password = Password.Text;
            sop.email = Email.Text;

            LabelResult.Text = sm.InsertSopstvenik(sop);
            ClearTextBoxesSopstvenik();
        }

        protected void CreateKlient()
        {
            var UserName = (TextBox)RegisterUserWizardStep.ContentTemplateContainer.FindControl("UserName");
            var Email = (TextBox)RegisterUserWizardStep.ContentTemplateContainer.FindControl("Email");
            var Password = (TextBox)RegisterUserWizardStep.ContentTemplateContainer.FindControl("Password");

            KlientModel km = new KlientModel();
            klient kli = new klient();
            kli.ime = txtKlientIme.Text;
            kli.prezime = txtKlientPrezime.Text;
            kli.telefon = txtKlientTel.Text;
            kli.email = Email.Text;
            kli.ulica = txtKlientUlica.Text;
            kli.grad = txtKlientGrad.Text;
            kli.link_slika = SaveFile(FileUploadKlientSlika.PostedFile, FileUploadKlientSlika);
            
            kli.username = UserName.Text;
            kli.password = Password.Text;

            LabelResult.Text = km.InsertKlient(kli);
            ClearTextBoxesKlient();
        }

        protected void ClearTextBoxesVraboten()
        {
            txtVrabotenIme.Text = "";
            txtVrabotenPrezime.Text = "";
            txtVrabotenTel.Text = "";
            txtVrabotenPozicija.Text = "";
            txtVrabotenProcent.Text = "";
            txtVrabotenDatum.Text = "";
            txtVrabotenPlata.Text = "";
            txtVrabotenUlica.Text = "";
            txtVrabotenGrad.Text = "";
            
        }

        protected void ClearTextBoxesSopstvenik() 
        {
            txtSopstvenikIme.Text= "";
            txtSopstvenikPrezime.Text= "";
            txtSopstvenikTelefon.Text= "";
            txtSopstvenikUlica.Text= "";
            txtSopstvenikGrad.Text= "";
           
        }

        protected void ClearTextBoxesKlient() 
        {
            txtKlientIme.Text = "";
            txtKlientPrezime.Text = "";
            txtKlientTel.Text = "";
            txtKlientUlica.Text = "";
            txtSopstvenikGrad.Text = "";
            
            
        }

        private string SaveFile(HttpPostedFile file, FileUpload fu)
        {
            // Specify the path to save the uploaded file to.
            string savePath = Server.MapPath("Images/Profiles/");


            // Get the name of the file to upload.
            string fileName = fu.FileName;


            // Create the path and file name to check for duplicates.
            string pathToCheck = savePath + fileName;


            // Create a temporary file name to use for checking duplicates.
            string tempfileName = "";


            // Check to see if a file already exists with the
            // same name as the file to upload.        
            if (System.IO.File.Exists(pathToCheck))
            {
                int counter = 2;
                while (System.IO.File.Exists(pathToCheck))
                {
                    // if a file with this name already exists,
                    // prefix the filename with a number.
                    tempfileName = counter.ToString() + fileName;
                    pathToCheck = savePath + tempfileName;
                    counter++;
                }

                fileName = tempfileName;

                // Notify the user that the file name was changed.
                LabelUploadStatus.Text = "A file with the same name already exists." +
                    "<br />Your file was saved as " + fileName;
            }
            else
            {
                // Notify the user that the file was saved successfully.
                LabelUploadStatus.Text = "Your file was uploaded successfully.";
            }

            // Append the name of the file to upload to the path.
            savePath += fileName;

            // Call the SaveAs method to save the uploaded
            // file to the specified directory.
            fu.SaveAs(savePath);

            return "Images/Profiles/" + fileName;

        }

    }
}