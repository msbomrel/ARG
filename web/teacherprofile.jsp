<%@page import="Database.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE>
<html>
<head>
<title>add teacher</title>
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
        <div class="container-fluid">
      <h3>Teacher Registration Form</h3>
          <div class="col-sm-4 col-md-4">
              <form action="codeteacherprofile.jsp" method="post" class="form-horizontal">
          <div class="form-group">
              <div class="col-xs-5">
                 <label>  Name:</label>
                  <input class="form-control" name="fullname" type="text">
              </div>
          </div>
              <div class="form-group">
              <div class="col-xs-5">
                  <label>Age: </label>
                  <input class="form-control" name="age" type="text">
              </div>
              </div>
              <div class="form-group">
              <div class="col-xs-5">
                  <label>ContactNo: </label>
                  <input class="form-control" name="contactno" type="text">
              </div>
              </div>
              <div class="form-group">
              <div class="col-xs-5">
                  <label>Address: </label>
                  <input class="form-control" name="address" type="text">
              </div>
              </div>
              <label for="subject">Subjects (can be more than one)</label>
                  <select name="subjects" id="subject" multiple class="form-control" style="width:340px;">
                          <%
                          try
                          {
                              ResultSet rs = null;
                              String sql = "select * from subject";
                              DatabaseFile obj = new DatabaseFile();
                              rs = obj.codeselect(sql);
                              while(rs.next())
                              {
                                  %> <%
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
                      </select> <br>
                  <label for="semester"> Semester:  </label>
                  <select name="semester" multiple class="form-control" id="semester" style="width:340px;">
                          <%
                          try
                          {
                              ResultSet rs = null;
                              String sql = "select * from grade";
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
                      </select> <br>
                  <label>Sections:</label>
                  <select name="sections" multiple class="form-control" style="width: 220px;">
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
                      </select><br>
                  <button class="btn btn-primary" type="submit">Add teacher</button>
            </form >
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
            <!-- ####################################################################################################### -->
            <div class="col-sm-8 col-md-8">
            The teachers profiles are:
                <%
                    try
                    {
                        int g = 1;
                        out.println("<table class=\"table\" border='2px' align='center'>");
                        out.println("<tr>");
                        out.println("<th>Sno</th>");
                        out.println("<th>Full Name</th>");
                        out.println("<th>Age</th>");
                        out.println("<th>Contact No</th>");
                        out.println("<th>Address</th>");
                        out.println("<th>Subjects</th>");
                        out.println("<th>Grades</th>");
                        out.println("<th>Sections</th>");
                        out.println("<th>Edit</th>");
                        out.println("<th>Delete</th>");
                        out.println("</tr>");
                        String sql = "SELECT * from teacherinfo ";
                        DatabaseFile objDatabaseFile = new DatabaseFile();

                        ResultSet rs = objDatabaseFile.codeselect(sql);

                        while(rs.next())
                        {
                            //subject
                            String sql1 = "SELECT s.subjectname "
                                    + "FROM teacher_subjects AS t "
                                    + "LEFT JOIN subject AS s ON s.subjectid = t.subjectid "
                                    + "WHERE t.teacherid = '"+rs.getInt("teacherid") +"' ";

                            ResultSet rs1 = objDatabaseFile.codeselect(sql1);

                            String s1 = "<table border='2px' align='center'>";

                            while(rs1.next())
                            {
                                s1 += "<tr>";
                                s1 += "<td>"+rs1.getString(1)+"</td>";
                                s1 += "</tr>";
                            }
                            rs1.close();
                            s1 += "</table>";

                            //grade
                            String sql2 = "SELECT s.gradename "
                                    + "FROM teacher_grades AS t "
                                    + "LEFT JOIN grade AS s ON s.gradeid = t.gradeid "
                                    + "WHERE t.teacherid = '"+rs.getInt("teacherid") +"' ";

                            ResultSet rs2 = objDatabaseFile.codeselect(sql2);

                            String s2 = "<table border='2px' align='center'>";

                            while(rs2.next())
                            {
                                s2 += "<tr>";
                                s2 += "<td>"+rs2.getString(1)+"</td>";
                                s2 += "</tr>";
                            }
                            rs2.close();
                            s2 += "</table>";

                            //section
                            String sql3 = "SELECT s.sectionsname "
                                    + "FROM teacher_sections AS t "
                                    + "LEFT JOIN sections AS s ON s.sectionid = t.sectionid "
                                    + "WHERE t.teacherid = '"+rs.getInt("teacherid") +"' ";

                            ResultSet rs3 = objDatabaseFile.codeselect(sql3);

                            String s3 = "<table border='2px' align='center'>";

                            while(rs3.next())
                            {
                                s3 += "<tr>";
                                s3 += "<td>"+rs3.getString(1)+"</td>";
                                s3 += "</tr>";
                            }
                            rs2.close();
                            s3 += "</table>";

                            out.println("<tr><td>" + g++
                                    + "</td><td>" + rs.getString("FullName")
                                    + "</td><td>" + rs.getString("Age")
                                    + "</td><td>" + rs.getString("ContactNo")
                                    + "</td><td>" + rs.getString("Address")
                                    + "</td><td>" + s1.toString()
                                    + "</td><td>" + s2.toString()
                                    + "</td><td>" + s3.toString()
                                    + "<td><a href='teacherprofileedit.jsp?index="+ rs.getInt("teacherid") +"'><img src='images/Edit.png'></img></a></td>"
                                    + "<td><a href='codeDelete.jsp?index="+ rs.getInt("teacherid") +"'><img src='images/Delete.png'></img></a></td>"
                                    + "</td></tr>");
                            s1 = null;
                            s2 = null;
                            s3 = null;
                        }

                        rs.close();

                        if(g == 1)
                        {
                            out.println("<tr>"
                                    + "<td> &nbsp; </td>"
                                    + "<td> &nbsp; </td>"
                                    + "<td> &nbsp; </td>"
                                    + "<td> &nbsp; </td>"
                                    + "<td> &nbsp; </td>"
                                    + "<td> &nbsp; </td>"
                                    + "<td> &nbsp; </td>"
                                    + "<td style='color: red;'> Not Result Found! </td>"
                                    + "<td> &nbsp; </td>"
                                    + "<td> &nbsp; </td>"
                                    + "</tr>");
                        }
                        out.println("</table>");

                    }
                    catch(Exception e)
                    {
                        e.printStackTrace();
                    }
                %>
            </div>

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
</div>
</div>
</div>
</div>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
