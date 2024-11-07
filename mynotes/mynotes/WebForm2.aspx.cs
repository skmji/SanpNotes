using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mynotes
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        // Get the connection string from Web.config
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Only bind the GridView if it's not a postback
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        // Fetch data from the database and bind it to the GridView
        private void BindGrid()
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                try
                {
                    // Open the MySQL connection
                    connection.Open();

                    // Query to fetch data
                    string query = "SELECT id, title, contents FROM notes";
                    MySqlCommand cmd = new MySqlCommand(query, connection);

                    // Use MySqlDataAdapter to fill the DataTable
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        // Bind the DataTable to the GridView
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
                catch (MySqlException ex)
                {
                    // Handle MySQL exceptions
                    Response.Write("MySQL Error: " + ex.Message);
                }
                catch (Exception ex)
                {
                    // Handle general exceptions
                    Response.Write("Error: " + ex.Message);
                }
            }
        }

        // Event handler for GridView RowEditing (enable edit mode)
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid(); // Rebind the GridView to enter edit mode
        }

        // Event handler for GridView RowUpdating (update the record)
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Get the ID of the row being edited
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["id"]);

            // Find the TextBox controls inside the EditItemTemplate
            TextBox titleTextBox = GridView1.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
            TextBox contentTextBox = GridView1.Rows[e.RowIndex].FindControl("TextBox3") as TextBox;

            if (titleTextBox != null && contentTextBox != null)
            {
                // Retrieve the values from TextBoxes
                string title = titleTextBox.Text;
                string content = contentTextBox.Text;

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    string query = "UPDATE notes SET title = @Title, contents = @Content WHERE id = @Id";
                    MySqlCommand cmd = new MySqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Content", content);

                    try
                    {
                        connection.Open();
                        cmd.ExecuteNonQuery();
                    }
                    catch (MySqlException ex)
                    {
                        // Handle SQL errors
                        Response.Write("MySQL Error: " + ex.Message);
                    }
                }

                GridView1.EditIndex = -1; // Exit edit mode
                BindGrid(); // Rebind the GridView to refresh the data
            }
            else
            {
                Response.Write("Error: Could not find the TextBox controls for the update.");
            }
        }

        // Event handler for GridView RowCancelingEdit (cancel edit mode)
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1; // Cancel edit mode
            BindGrid(); // Rebind the GridView to reset
        }

        // Event handler for GridView RowDeleting (delete the record)
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["id"]);

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                string query = "DELETE FROM notes WHERE id = @Id";
                MySqlCommand cmd = new MySqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@Id", id);

                try
                {
                    connection.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (MySqlException ex)
                {
                    // Handle SQL errors
                    Response.Write("MySQL Error: " + ex.Message);
                }
            }

            BindGrid(); // Rebind the GridView to reflect changes after deletion
        }
    }
}
