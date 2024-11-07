<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="mynotes.WebForm1" %>



<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>SnapNotes</title>



  </head>
  <body>


      <div class="container" >

         
           <h3 class="bg-primary p-3 text-center text-light">SnapNotes</h3>

         

          <div class="row mt-5" >
              <div class="col-3">
          <div class="list-group">
 
  <a href="#" class="list-group-item list-group-item-action active">Add note</a>
  <a href="WebForm2.aspx" class="list-group-item list-group-item-action">View notes</a>
 
 
</div>
</div>
              <div class="col-8">


           <form id="form1" runat="server">
           <div>

           <div class="form-group">
     <asp:Label ID="Label1" runat="server" Text="Title" ></asp:Label>
                  
     
         <asp:TextBox ID="TextBox1" runat="server"  CssClass="form-control"></asp:TextBox>
                </div>
         <br />
          <div class="form-group" >
         <asp:Label ID="Label2" runat="server" Text="Content"></asp:Label>
         <br />
         <textarea id="TextArea1" name="S1" class="form-control" rows="5" ></textarea>

         <br />
              </div>

               <div class="container text-center">
                   <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Save" />


               </div>
         
         <br /><br />

         
     </div>
 </form>
                  </div>

         
      </div>
          </div>
















    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>




