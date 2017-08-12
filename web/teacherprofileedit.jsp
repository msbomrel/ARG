<%@page import="Database.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE>
<html>
<head>
<title>Automatic Routine Generator</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="jumbotron">
        <h2 style="font-family: SansSerif;">AUTOMATIC ROUTINE GENERATOR</h2>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <ul class="nav navbar-nav">
                    <li><a href="#">Home</a></li>
                    <li><a href="addsemester.jsp">Semesters</a></li>!
                    <li><a href="addsubjects.jsp">Subjects</a></li>
                    <li class="active"><a href="teacherprofile.jsp">Teachers</a></li>
                    <li><a href="gentimetable.jsp">Generate Routine</a></li>
                    <li><a href="viewtimetable.jsp">View Routine</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li> <a href="#" style="color: blue;">Welcome : <%=session.getAttribute("x")%> </a></li>
                    <li ><a href="logout.jsp"><span class="glyphicon glyphicon-log-out" style="color:red;"></span> sign out</a></li>
                </ul>
            </div>
        </nav>
      <h3>Teacher Registration Form</h3>
      <form action="codeEdit.jsp" method="post">
          <%
                        try
                        {
                             DatabaseFile objDatabaseFile = new DatabaseFile();
                                                       
                             if ((request.getParameter("index") != null) && (!(request.getParameter("index").trim().equals("")))) 
                             {
                                 String sql11 = "SELECT FullName, Age, ContactNo, Address FROM teacherinfo "
                                         + "WHERE teacherid = '"+request.getParameter("index")+"'";
                                 
                                ResultSet rs11 = objDatabaseFile.codeselect(sql11);
                            
                                while(rs11.next())
                                {          
                                   %>
                                  <table align="center" border="0px" width="100px" class="table-responsive">
              
                                  <tr >
                                      <td>Full Name:</td><td><input type="text" name="fullname" value="<%=rs11.getString(1)%>" size="54px"/></td>
                                  </tr>

                                  <tr >
                                      <td>Age:</td><td><input type="text" name="age" value="<%=rs11.getString(2)%>" size="54px"/></td>
                                  </tr>

                                  <tr >
                                      <td>Contact No:</td><td><input type="text" name="contactno" value="<%=rs11.getString(3)%>" size="54px"/></td>
                                  </tr>

                                  <tr >
                                      <td>Address:</td><td><input name="address" value="<%=rs11.getString(4)%>" /> </td>
                                  </tr>

                                  <tr >
                                      <td>Subjects</td>
                                      <td><select name="subjects" multiple="multiple" style="width:340px;">                         
                                              <%
                                              try
                                              {
                                                  ResultSet rs = null;

                                                  String sql = "SELECT * FROM subject";

                                                  DatabaseFile obj = new DatabaseFile();

                                                  rs = obj.codeselect(sql);

                                                  while(rs.next())
                                                  {
                                                      %>
                                                      <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                                                      <%
                                                  }
                                                  rs.close();
                                              }
                                              catch(Exception e)
                                              {
                                              e.printStackTrace();    
                                              }
                                              %>
                                          </select>
                                      </td>
                                  </tr>
                                 <tr >
                                      <td>Semesters</td>
                                      <td><select name="grades" multiple="multiple" style="width:340px;">                        
                                              <%
                                              try
                                              {
                                                  ResultSet rs = null;

                                                  String sql = "SELECT * FROM grade";

                                                  DatabaseFile obj = new DatabaseFile();

                                                  rs = obj.codeselect(sql);

                                                  while(rs.next())
                                                  {
                                                      %>
                                                      <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                                                      <%
                                                  }
                                                  rs.close();
                                              }
                                              catch(Exception e)
                                              {
                                              e.printStackTrace();    
                                              }
                                              %>
                                          </select>
                                      </td>

                                    </tr>

                                   <tr >
                                      <td>Sections</td>
                                      <td><select name="sections" multiple="multiple" style="width:340px;">                        
                                              <%
                                              try
                                              {
                                                  ResultSet rs = null;

                                                  String sql = "SELECT * FROM sections";

                                                  DatabaseFile obj = new DatabaseFile();

                                                  rs = obj.codeselect(sql);

                                                  while(rs.next())
                                                  {
                                                      %>
                                                      <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                                                      <%
                                                  }
                                                  rs.close();
                                              }
                                              catch(Exception e)
                                              {
                                              e.printStackTrace();    
                                              }
                                              %>
                                          </select>
                                      </td>
                                  </tr>

                                  <tr >
                                      <td>&nbsp;</td><td><input type="hidden" name="hide" value="<%=request.getParameter("index")%>" size="54px"/></td>
                                  </tr>

                                  <tr>
                                      <td>&nbsp;</td>
                                      <td><input type="submit" value="Submit"/><input type="reset" value="Reset"/></td>
                                  </tr>

                              </table>
                                   <%
                                }
                                rs11.close();
                             }
                             
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
          %>
                    
      </form>
                      
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
</div>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
