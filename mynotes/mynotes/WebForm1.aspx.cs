using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mynotes
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        // Get the connection string from Web.config
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Load data when the page loads for the first time
            if (!IsPostBack)
            {
               
            }
        }

       


        // Event handler for the button click to insert data
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Get the user input from TextBox and TextArea
            string title = TextBox1.Text;
            string content = Request.Form["S1"]; // Retrieving the textarea content via form collection

            // Insert into the database
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                string query = "INSERT INTO notes (title, contents) VALUES (@Title, @Content)";
                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    // Add parameters to prevent SQL injection
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Content", content);

                    try
                    {
                        connection.Open();
                        cmd.ExecuteNonQuery(); // Execute the insert command
                        // Show a success message
                        Response.Write("Note saved successfully!");
                    }
                    catch (MySqlException ex)
                    {
                        // Handle any errors that occur during the database operation
                        Response.Write("Error: " + ex.Message);
                    }
                }
            }

           
        }

       

       
    }
}
