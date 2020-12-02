using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstateAgency.Models;

namespace RealEstateAgency
{
    public partial class Katalog : System.Web.UI.Page
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

                    if (km.CheckIfKlientExists(userName))
                    {
                        DivFormaZaDodavanjeImoti.Visible = false;
                        gridViewImotiSamoPrikaz.Visible = true;
                        gridViewImotiAdmin.Visible = false;
                    }
                    if (sm.CheckIfSopstvenikExists(userName))
                    {
                        DivFormaZaDodavanjeImoti.Visible = true;
                        gridViewImotiSamoPrikaz.Visible = true;
                        gridViewImotiAdmin.Visible = true;
                    }
                    if (vm.CheckIfVrabotenExists(userName))
                    {
                        DivFormaZaDodavanjeImoti.Visible = true;
                        gridViewImotiSamoPrikaz.Visible = true;
                        gridViewImotiAdmin.Visible = true;
                    }

                }
                SopstvenikModel sm2 = new SopstvenikModel();
                //sm.GetAllSopstveniciZaDropDown().Tables[0].Columns.Add("IdWithStudenName", typeof(string), "Id + ' - ' + StudenName");
                sopstvenici_db.DataSource = sm2.GetAllSopstveniciZaDropDown();
                //sopstvenici_db.DataValueField = 
                sopstvenici_db.DataBind();
            }
        }
        protected void tip_objekt_db_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tip_objekt_db.SelectedValue == "kukja")
            {
                //kancelarija
                internet_l.Visible = false;
                internet_tb.Visible = false;
                RequiredFieldValidator9.Visible = false;
                //stan
                sprat_l.Visible = false;
                sprat_tb.Visible = false;
                RequiredFieldValidator10.Visible = false;

                parno_l.Visible = false;
                parno_tb.Visible = false;
                RequiredFieldValidator11.Visible = false;

                parking_l.Visible = false;
                parking_tb.Visible = false;
                RequiredFieldValidator12.Visible = false;
                //kukja
                kvadraturaDvor_l.Visible = true;
                kvadraturaDvor_tb.Visible = true;
                RequiredFieldValidator8.Visible = true;
            }
            if (tip_objekt_db.SelectedValue == "stan")
            {
                //kancelarija
                internet_l.Visible = false;
                internet_tb.Visible = false;
                RequiredFieldValidator9.Visible = false;

                //kukja
                kvadraturaDvor_l.Visible = false;
                kvadraturaDvor_tb.Visible = false;
                RequiredFieldValidator8.Visible = false;

                //stan
                sprat_l.Visible = true;
                sprat_tb.Visible = true;
                RequiredFieldValidator10.Visible = true;

                parno_l.Visible = true;
                parno_tb.Visible = true;
                RequiredFieldValidator11.Visible = true;

                parking_l.Visible = true;
                parking_tb.Visible = true;
                RequiredFieldValidator12.Visible = true;
            }
            if (tip_objekt_db.SelectedValue == "kancelarija")
            {
                //kukja
                kvadraturaDvor_l.Visible = false;
                kvadraturaDvor_tb.Visible = false;
                RequiredFieldValidator8.Visible = false;

                //stan
                sprat_l.Visible = false;
                sprat_tb.Visible = false;
                RequiredFieldValidator10.Visible = false;

                parno_l.Visible = false;
                parno_tb.Visible = false;
                RequiredFieldValidator11.Visible = false;

                parking_l.Visible = false;
                parking_tb.Visible = false;
                RequiredFieldValidator12.Visible = false;

                //kancelarija
                internet_l.Visible = true;
                internet_tb.Visible = true;
                RequiredFieldValidator9.Visible = true;
            }

        }

        protected void dodadi_b_Click(object sender, EventArgs e)
        {
            ObjektModel om = new ObjektModel();
            objekt o = new objekt();
            o.ulica = ulica_tb.Text;
            o.grad = grad_tb.SelectedValue;
            o.sobi = sobi_tb.Text;
            o.urlMapa = SaveMapa(FileUploadMapa.PostedFile, FileUploadMapa);
            o.kvadratura = Convert.ToInt32(kvadratura_tb.Text);
            o.linkSliki = SaveFile(FileUploadSlika.PostedFile, FileUploadSlika);
            o.idSopstvenik = Convert.ToInt32(sopstvenici_db.SelectedValue);
            LabelResultObjekt.Text=om.InsertObjekt(o);
            ObjektModel om2 = new ObjektModel();
            switch (tip_objekt_db.SelectedValue)
            {
                case "kukja": KukjaModel km = new KukjaModel();
                    kukja k = new kukja();
                    k.KVADRATURADVOR = Convert.ToInt32(kvadraturaDvor_tb.Text);
                    k.idObjekt = om2.GetThisObjektId(o);
                    LabelResultVidObjekt.Text = km.InsertKukja(k);

                    break;
                case "stan": StanModel sm = new StanModel();
                    stan s = new stan();
                    s.sprat= Convert.ToInt32(sprat_tb.Text);
                    s.parno = parno_tb.Text;
                    s.parking = parking_tb.Text;
                    s.idObjekt = om2.GetThisObjektId(o);
                    LabelResultVidObjekt.Text = sm.InsertStan(s);
                    break;
                case "kancelarija": KancelarijaModel kam = new KancelarijaModel();
                    kancelarija kan = new kancelarija();
                    kan.internet = internet_tb.Text;
                    kan.idObjekt = om2.GetThisObjektId(o);
                    LabelResultVidObjekt.Text = kam.InsertKancelarija(kan);
                    break;
                default:
                    break;
            }
        }

        private string SaveFile(HttpPostedFile file, FileUpload fu)
        {
            // Specify the path to save the uploaded file to.
            string savePath = Server.MapPath("Images/Objekti/");


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

            return "Images/Objekti/" + fileName;

        }

        private string SaveMapa(HttpPostedFile file, FileUpload fu)
        {
            // Specify the path to save the uploaded file to.
            string savePath = Server.MapPath("Images/Mapi/");


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

            return "Images/Mapi/" + fileName;

        }

        //protected void GridViewObjekt_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    //get selected row
        //    GridViewRow row = GridViewObjekt.Rows[e.NewEditIndex];

        //    //get id of selected row
        //    int rowId = Convert.ToInt32(row.Cells[2].Text);

        //    Response.Redirect("~/ManageObjekt.aspx?idObjekt=" + rowId);
        //}

        //protected void GridViewObjekt_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    // Get selecterd row
        //    GridViewRow row = GridViewObjekt.Rows[e.RowIndex];
        //    // Get ID of selected row
        //    int rowID = Convert.ToInt32(row.Cells[2].Text);

        //    string delete = new NewsModel().DeleteNews(rowID);
        //    Response.Redirect(Request.RawUrl);
        //}
    }
}