<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DatabaseFile"%>
<!DOCTYPE>
<html>
<head>
    <title>Automatic Routine Generator</title>
    <link rel="stylesheet" href="css/custom.css">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <%@page session="true" %>
</head>
<body>
<div class="container-fluid">
    <div class="jumbotron">
        <h2 style="font-family: SansSerif;">AUTOMATIC ROUTINE GENERATOR</h2>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <ul class="nav navbar-nav">
                    <li ><a href="userprofile.jsp">Home</a></li>
                    <li class="active"><a href="#">Semesters</a></li>!
                    <li><a href="addsubjects.jsp">Subjects</a></li>
                    <li><a href="teacherprofile.jsp">Teachers</a></li>
                    <li><a href="gentimetable.jsp">Generate Routine</a></li>
                    <li><a href="viewtimetable.jsp">View Routine</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li> <a href="#" style="color: blue;">Welcome : <%=session.getAttribute("x")%> </a></li>
                    <li ><a href="logout.jsp"><span class="glyphicon glyphicon-log-out" style="color:red;"></span> sign out</a></li>
                </ul>
            </div>
        </nav>

        <div class="container">
            <div class="column">
                <div class="col-sm-6">
                    <div class="container">
                        <%
                            try {
                                out.println("<font color = 'red'>");

                                if ((request.getParameter("msg") != null) && (!(request.getParameter("msg").trim().equals("")))) {
                                   out.println(request.getParameter("msg"));
                                }
                                else {
                                    out.print("");
                                }

                                out.println("</font><br>");
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </div>
                    <div class="container">
                    <form method="post" action="codeaddsemester.jsp">
                        <div class="col-sm-6">
                        <input type="text" class="form-control" name="semester"><br>
                        <button type="submit" class="btn btn-primary">Add semester</button>
                        </div>
                    </form>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="container-fluid">
                        The default sections for each semesters are: <br>
                        <%
                            String sql0 = "select * from sections";
                            DatabaseFile objDatabase0 = new DatabaseFile();
                            ResultSet resultSet0= objDatabase0.codeselect(sql0);
                            while (resultSet0.next()){
                                out.println(resultSet0.getString("sectionsname") + "<br>");
                            }
                        %>
                        The existing semesters are: <br>
                    <%
                        try {
                            out.println("<font color = 'green'>");

                            if ((request.getParameter("msg1") != null) && (!(request.getParameter("msg1").trim().equals("")))) {
                                out.println(request.getParameter("msg1"));
                            }
                            else {
                                out.print("");
                            }

                            out.println("</font><br>");
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        String sql = "select * from grade";
                        DatabaseFile objDatabase = new DatabaseFile();
                        ResultSet resultSet = objDatabase.codeselect(sql);
                        out.println("<table class=\"table\">");
                        while (resultSet.next()){
                            out.println("<tr><td>"+resultSet.getString("gradename") +"</td>"+
                                    "<td><a href='codeDelete.jsp?index="+ resultSet.getInt("gradeid") +"'>delete</a></td></tr>");
                        }
                        out.println("</table>");
                        resultSet.close();
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
