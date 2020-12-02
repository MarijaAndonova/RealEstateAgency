using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstateAgency.Models;

namespace RealEstateAgency
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ObjektModel om = new ObjektModel();
            objekt o = new objekt();
            o.ulica = ulica_tb.Text;
            o.grad = grad_tb.SelectedValue;
            o.sobi = sobi_tb.Text;
            o.urlMapa = urlMapa_tb.Text;
            o.kvadratura = Convert.ToInt32(kvadratura_tb.Text);
            o.linkSliki = SaveFile(FileUploadSlika.PostedFile, FileUploadSlika);
            o.idSopstvenik = 1;

            om.InsertObjekt(o);
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
    }
}