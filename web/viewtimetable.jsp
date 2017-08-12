<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DatabaseFile"%>
<!DOCTYPE>
<html>
    <head>
        <title>Automatic Routine Generation</title>
        <%@page session="true" %>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
    <div class="container-fluid">
        <div class="jumbotron">
            <h2 style="font-family: SansSerif;">AUTOMATIC ROUTINE GENERATOR</h2>
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <ul class="nav navbar-nav">
                        <li ><a href="#">Home</a></li>
                        <li><a href="addsemester.jsp">Semesters</a></li>!
                        <li><a href="addsubjects.jsp">Subjects</a></li>
                        <li><a href="teacherprofile.jsp">Teachers</a></li>
                        <li><a href="gentimetable.jsp">Generate Routine</a></li>
                        <li class="active"><a href="viewtimetable.jsp">View Routine</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li> <a href="#" style="color: blue;">Welcome : <%=session.getAttribute("x")%> </a></li>
                        <li ><a href="logout.jsp"><span class="glyphicon glyphicon-log-out" style="color:red;"></span> sign out</a></li>
                    </ul>
                </div>
            </nav>
            <!-- ####################################################################################################### -->
            <div class="panel panel-default">
                <div class="panel-body">
                  <h3>View Semester wise Routine</h3>
                  <form action="codeviewtimetable.jsp" method="post">
                  <table align="center" class="table-responsive">

                      <tr>
                      <td>Sections</td>
                      <td><select name="sections" class="form-control">
                              <option value="-select-">-select-</option>
                              <%
                              try
                              {
                                  ResultSet rs = null;
                                  String sql = "SELECT sectionid, sectionsname FROM sections";
                                  DatabaseFile obj = new DatabaseFile();
                                  rs = obj.codeselect(sql);
                                  while(rs.next())
                                  {
                                      %>
                                      <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
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
                  <td>Semester</td>
                  <td><select name="grades" class="form-control">
                           <option value="-select-">-select-</option>
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
                           
                  <tr>
                      <td>&nbsp;</td>
                      <td><button type="submit" class="btn btn-primary">Submit</button></td>
                  </tr>
                  </table>
                  <br/>
                  <br/>
                          <%
                        //getting response
                        try {
                            out.println("<font color = 'red'>");

                            if ((request.getParameter("msg") != null) && (!(request.getParameter("msg").trim().equals("")))) {
                                out.println(request.getParameter("msg"));
                            }

                            out.println("</font>");
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        %>
                </div>                
         </div>
        </form>
        </div>
        </div>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>
