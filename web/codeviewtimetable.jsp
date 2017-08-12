<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DatabaseFile"%>
<!DOCTYPE>
<html>
    <head>
        <title>Time Table Task</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <%@page session="true" %>
    </head>
    <body>
    <div class="container-fluid">
        <div class="jumbotron">
            <h2 style="font-family: SansSerif;">AUTOMATIC ROUTINE GENERATOR</h2>
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <ul class="nav navbar-nav">
                        <li><a href="userprofile.jsp">Home</a></li>
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

            <%
                out.println("<font color = 'green' >");

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

                    <%
                        try
                        {
                            if((!request.getParameter("sections").equalsIgnoreCase("-select-")) && (!request.getParameter("grades").equalsIgnoreCase("-select-")))
                             {
                                 int g = 1;
                                 DatabaseFile objDatabaseFile = new DatabaseFile();
                                 String gradeid = request.getParameter("grades");

                                 String query = "select * from grade where gradeid="+ gradeid+"";
                                 ResultSet sem = objDatabaseFile.codeselect(query);

                                 while (sem.next()){
                                     String sem1 =sem.getString("gradename");
                                 out.println("<h3> "+ sem1.toUpperCase() + "-" + "["+request.getParameter("sections").toUpperCase()+"]"+"</h3>");
                                 }
                                 out.println("<table  class=\"table table-striped\">");
                                 out.println("<tr>");
                                 out.println("<th>SNO</th>");
                                 out.println("<th>DAY</th>");
                                 out.println("<th>8 to 9 am</th>");
                                 out.println("<th>9 to 10 am</th>");
                                 out.println("<th>10 to 11 am</th>");
                                 out.println("<th>11 to 12 am</th>");                                
                                 out.println("<th>01 to 02 pm</th>"); 
                                 out.println("<th>02 to 03 pm</th>"); 
                                 out.println("<th>03 to 04 pm</th>");                                  
                                 out.println("<th>Download</th>");                                                                                                                                                                
                                 out.println("</tr>");

                                 String sql = "SELECT * FROM timetable_"+request.getParameter("sections").toString().trim()+" WHERE Grade="+request.getParameter("grades").toString().trim();

                                 System.out.println(sql);


                                 ResultSet rs = objDatabaseFile.codeselect(sql);
                            
                                 while(rs.next())
                                 {      
                                    String s1 = rs.getString("8_9");
                                    String s2 = rs.getString("9_10");
                                    String s3 = rs.getString("10_11");
                                    String s4 = rs.getString("11_12");
                                    String s5 = rs.getString("1_2");
                                    String s6 = rs.getString("2_3");
                                    String s7 = rs.getString("3_4");                                   
                                                     
                                     String sql1 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s1+"'";

                                                ResultSet rs1 = objDatabaseFile.codeselect(sql1);

                                                while (rs1.next()) 
                                                {
                                                    s1 = rs1.getString("subjectname");
                                                }
                                                
                                                rs1.close();

                                                                                
                                                String sql2 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s2+"'";

                                                ResultSet rs2 = objDatabaseFile.codeselect(sql2);

                                                while (rs2.next()) 
                                                {
                                                    s2 = rs2.getString("subjectname");
                                                }

                                                String sql3 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s3+"'";

                                                ResultSet rs3 = objDatabaseFile.codeselect(sql3);

                                                while (rs3.next()) 
                                                {
                                                    s3 = rs3.getString("subjectname");
                                                }

                                                rs3.close();

                                                String sql4 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s4+"'";

                                                ResultSet rs4 = objDatabaseFile.codeselect(sql4);

                                                while (rs4.next()) 
                                                {
                                                    s4 = rs4.getString("subjectname");
                                                }
                                                 
                                                rs4.close();

                                                String sql5 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s5+"'";

                                                ResultSet rs5 = objDatabaseFile.codeselect(sql5);

                                                while (rs5.next()) 
                                                {
                                                    s5 = rs5.getString("subjectname");
                                                }

                                                rs5.close();

                                                String sql6 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s6+"'";

                                                ResultSet rs6 = objDatabaseFile.codeselect(sql6);

                                                while (rs6.next()) 
                                                {
                                                    s6 = rs6.getString("subjectname");
                                                }

                                                rs6.close();

                                                String sql7 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s7+"'";

                                                ResultSet rs7 = objDatabaseFile.codeselect(sql7);

                                                while (rs7.next()) 
                                                {
                                                    s7 = rs7.getString("subjectname");
                                                }

                                               rs7.close();


                                     out.println("<tr><td>" + g++ + "</td><td>" 
                                             + rs.getString("Day") + "</td><td>" 
                                             + s1 + "</td><td>" 
                                             + s2 +  "</td><td>" 
                                             + s3 +  "</td><td>" 
                                             + s4 +  "</td><td>" 
                                             + s5 +  "</td><td>" 
                                             + s6 +  "</td><td>" 
                                             + s7 +  "</td>"                                                                                      
                                             + "<td><a href='codereport.jsp?index="+request.getParameter("sections").toString().trim()
                                             +"&&index1="+request.getParameter("grades").toString().trim()+"'><img src='images/Excel.png'></img></a></td>"
                                             + "</tr>");
                                 }
                                
                                 rs.close();

                                 out.println("</table>");
                             }
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
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
            <script src="js/jquery-3.1.1.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
    </body>
</html>
