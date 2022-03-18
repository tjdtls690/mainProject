                                          <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Modal dd</title>
    <style>
       .modal-header{
       background: #F7941E;
       color: #fff;
       }
    </style>
  </head>
  <body>
   <div class="container mt-5">
   <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">Contact Us</button>
   <div class="modal" id="myModal">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title">Contact us</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
         </div>
         <div class="modal-body">
            <form>
               <div class="mb-3">
                  <label class="form-label">Name</label>
                  <input type="text" class="form-control">
               </div>
               <div class="mb-3">
                  <label class="form-label">Email</label>
                  <input type="text" class="form-control">
               </div>
               <div class="mb-3">
                  <label class="form-label">Type your message here</label>
                  <textarea class="form-control"></textarea>
               </div>
            </form>
         </div>
         <div class="modal-footer">
         <button type="submit" class="btn btn-primary">Submit</button>
         <button type="submit" class="btn btn-primary">Cancel</button>
         </div>
         </div>
         </div>
         </div>
   </div>

 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  </body>
</html>