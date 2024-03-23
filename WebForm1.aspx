<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .dialog {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }
        .dialog-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
        .dialog-content input[type="text"] {
            width: 100%;
            margin-bottom: 10px;
        }
    </style>
    <script type='text/javascript'>
        function setFocus(controlID) {
            var control = document.getElementById(controlID);
            if (control) {
                control.focus();
            }
        }

        function openPopup(controlID) {
            var eventName = 'Event Name'; // Set your event name here or dynamically
            var textBoxName = controlID; // Set your textbox name here or dynamically
            //var value = prompt('Please enter value for ' + textBoxName + ':', ''); // Open a prompt for user input
            openDialog('Please enter value for ' + textBoxName + ':');
            //document.getElementById(controlID).value = value;
        }

        function openDialog(message) {
            document.getElementById('dialogMessage').innerText = message;
            document.getElementById('customDialog').style.display = 'block';
        }

        function closeDialog() {
            document.getElementById('customDialog').style.display = 'none';
            return false;
        }

        function submitDialog() {
            var value = document.getElementById('dialogInput').value;
            document.getElementById(controlID).value = value;
            closeDialog();
            return false;
            // Process the entered value here
            //console.log('Value entered:', value);
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td>Last Name:</td>
                <td>
                    <asp:TextBox ID="lastName" runat="server" CssClass="error" Text=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="lastNameValidator" runat="server" ControlToValidate="lastName" ErrorMessage="Last Name is required." InitialValue="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>First Name:</td>
                <td>
                    <asp:TextBox ID="firstName" runat="server" CssClass="error" Text=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="firstNameValidator" runat="server" ControlToValidate="firstName" ErrorMessage="First Name is required." InitialValue="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Date of Birth:</td>
                <td>
                    <asp:TextBox ID="dob" runat="server" TextMode="Date" InputMode="Date" CssClass="error" Text=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="dobValidator" runat="server" ControlToValidate="dob" ErrorMessage="Date of Birth is required." InitialValue="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Blank</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" InputMode="Date" CssClass="error" Text=""></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Date of Birth:</td>
                <td>
                    <asp:DropDownList ID="ddlHr" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlHr" ErrorMessage="Date of Birth is required." InitialValue="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="validateButton" runat="server" Text="Validate" OnClick="validateButton_Click" />
                </td>
            </tr>
        </table>

        <table id="errorTable" runat="server" visible="false">
            <thead>
                <tr>
                    <th>Field</th>
                    <th>Error Message</th>
                    <th>Fix</th>
                    <th>Focus</th>
                </tr>
            </thead>
            <tbody>
                <!-- Error rows will be dynamically added here -->
            </tbody>
        </table>
        <div id="customDialog" class="dialog">
            <div class="dialog-content">
                <span id="dialogMessage"></span>
                <br>
                <input type="text" id="dialogInput"><br>
                <button onclick="submitDialog()">Submit</button>
                <button onclick="closeDialog()">Cancel</button>
            </div>
        </div>
    </form>

</body>
</html>
