<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="mynotes.WebForm2" %>

<!doctype html>
<html lang="en">
  <head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>SnapNotes</title>

    <style type="text/css">
        #TextArea1 {
            height: 152px;
            width: 204px;
        }
    </style>
  </head>
  <body>
    <div class="container">
      <h3 class="bg-primary p-3 text-center text-light">SnapNotes</h3>

      <div class="row">
        <div class="col-3 ">
          <div class="list-group mt-5">
            <a href="WebForm1.aspx" class="list-group-item list-group-item-action">Add note</a>
            <a href="WebForm2.aspx" class="list-group-item list-group-item-action active">View notes</a>
          </div>
        </div>

        <div class="col-9">
          <form id="form2" runat="server">
            <div class="container mt-5">
              <div class="row">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                    CssClass="table" OnRowEditing="GridView1_RowEditing" 
                    OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
                  <Columns>
                    
                    <asp:TemplateField>
                      <ItemTemplate>
                        <div class=" mb-4">
                          <div class="card h-100">
                            <div class="card-body">
                              <h5 class="card-title">
                                <!-- Display Title -->
                                <%# Eval("title") %>
                              </h5>
                              <p class="card-text">
                                <!-- Display Content -->
                                <%# Eval("contents") %>
                              </p>
                            </div>
                            <div class="container text-center card-footer">
                              <!-- Edit and Delete Buttons -->

                              <asp:LinkButton ID="EditButton" runat="server" 
                                CommandName="Edit" Text="Edit" CssClass="btn btn-primary btn-sm"></asp:LinkButton>
                              <asp:LinkButton ID="DeleteButton" runat="server" 
                                CommandName="Delete" Text="Delete" CssClass="btn btn-danger btn-sm"></asp:LinkButton>
                            </div>
                          </div>
                        </div>
                      </ItemTemplate>

                      <EditItemTemplate>
                        <div class=" mb-4">
                          <div class="card h-100">
                            <div class="card-body">
                              <!-- Editable TextBoxes -->
                              <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("title") %>' 
                                CssClass="form-control mb-2"></asp:TextBox>
                              <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("contents") %>' 
                                CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                            </div>
                            <div class="container text-center card-footer">
                              <!-- Update and Cancel Buttons -->
                              <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" 
                                Text="Update" CssClass="btn btn-success btn-sm"></asp:LinkButton>
                              <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Cancel" CssClass="btn btn-secondary btn-sm"></asp:LinkButton>
                            </div>
                          </div>
                        </div>
                      </EditItemTemplate>
                    </asp:TemplateField>
                  </Columns>
                </asp:GridView>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
