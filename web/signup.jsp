<!DOCTYPE>
<html>
<head>
<title>Automatic Routine Generation</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
</head>
<body style="background-color: #1b6d85">
<div class="container-fluid">
<div class="col-xs-4 col-md-offset-4">
      <h1 style="color: whitesmoke; text-align: center;">User Registration Form</h1>
      <form action="codesignup.jsp" method="post" style="align-content: center">
              <div class="form-group">
                  <label>Name:</label><input type="text" name="name" class="form-control"/>
              </div>
              <div class="form-group">
                  <label>Phone Number:</label><input type="text" name="phone" class="form-control"/>
              </div>
              <div class="form-group">
                  <label>Email Id:</label><input type="text" name="email" class="form-control"/>
              </div>
              <div class="form-group">
                  <label>Address</label><input type="text" name="address" class="form-control"/>
              </div>
              <div class="form-group">
                  <label>Username:</label><input type="text" name="username" class="form-control"/>
              </div>
              <div class="form-group">
                  <label>Password:</label><input type="text" name="password" class="form-control"/>
              </div>
          <button class="btn btn-primary" type="submit">Submit</button>
      </form>
</div>
      <%
      out.println("<font color = 'red' >");
      
      //getting response
      try
      {
          if( (request.getParameter("msg") != null) && (!(request.getParameter("msg").trim().equals(""))) )
          {
              out.println(request.getParameter("msg"));
          }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      
      out.println("</font>");
      %>
</div>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
</body>
</html>
