using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void validateButton_Click(object sender, EventArgs e)
        {
            ValidateControl();
        }

        protected void ValidateControl()
        {
            string controlText = string.Empty;
            string errorMessage;
            foreach (BaseValidator validator in Page.Validators)
            {
                if (validator is RequiredFieldValidator requiredValidator)
                {
                    //controlText = ((TextBox)requiredValidator.FindControl(requiredValidator.ControlToValidate)).Text;
                    Control control = Page.FindControl(requiredValidator.ControlToValidate);
                    if (control is TextBox textBox)
                    {
                        controlText = textBox.Text;
                    }
                    else if (control is DropDownList dropDownList)
                    {
                        controlText = dropDownList.SelectedValue; // Or .Text if you want the displayed text
                    }

                    errorMessage = requiredValidator.ErrorMessage;
                }
                if (string.IsNullOrEmpty(controlText))
                {
                    AddErrorRow(validator.ControlToValidate, validator.ErrorMessage);
                }
            }
            errorTable.Visible = true; // Show the error table

        }

        private void AddErrorRow(string field, string errorMessage)
        {
            // Create a new row and cells for the error message
            HtmlTableRow row = new HtmlTableRow();
            HtmlTableCell cellField = new HtmlTableCell();
            HtmlTableCell cellMessage = new HtmlTableCell();
            HtmlTableCell cellButton = new HtmlTableCell();
            HtmlTableCell cellButtonFocus = new HtmlTableCell();
            Button button = new Button();
            button.ID = "btnValidate" + field;
            button.Text = "Fix";
            button.OnClientClick= "openPopup('" + field + "'); return false;";
            // Set the text of the cells
            cellField.InnerText = field;
            cellMessage.InnerText = errorMessage;
            cellButton.Controls.Add(button);
            Button buttonFocus = new Button();
            buttonFocus.ID = "btnFocus" + field;
            buttonFocus.Text = "Fix";
            buttonFocus.OnClientClick = "setFocus('" + field + "'); return false;";
           
           cellButtonFocus.Controls.Add(buttonFocus);
            row.Cells.Add(cellField);
            row.Cells.Add(cellMessage);
            row.Cells.Add(cellButton);
            row.Cells.Add(cellButtonFocus);
            errorTable.Rows.Add(row);
        }       
    }
}