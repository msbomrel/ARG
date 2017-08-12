<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DatabaseFile"%>
<%@ page import="static com.sun.xml.internal.fastinfoset.alphabet.BuiltInRestrictedAlphabets.table" %>
<!DOCTYPE>
<html>
<head>
    <title>Automatic Routine Generator</title>
    <link rel="stylesheet" href="styles/layout.css">
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
                    <li><a href="addsemester.jsp">Semesters</a></li>!
                    <li class="active"><a href="addsubjects.jsp">Subjects</a></li>
                    <li><a href="teacherprofile.jsp">Teachers</a></li>
                    <li><a href="gentimetable.jsp">Generate Routine</a></li>
                    <li><a href="viewtimetable.jsp">View Routine</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li> <a href="#" style="color: red;">Welcome : <%=session.getAttribute("x")%> </a></li>
                    <li ><a href="logout.jsp"><span class="glyphicon glyphicon-log-out" style="color:red;"></span> sign out</a></li>
                </ul>
            </div>
        </nav>
        <div class="panel panel-default">
            <div class="panel-body">
            <div class="container">
            <div class="row">
                <div class="col-sm-3 col-md-6">
                    <h3>Add subjects</h3>
                    <%
                        //getting respons
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
                    %>
                    <form action="codeaddsubjects.jsp">
                            <input class="form-control" name="subject" type="text"> <br>

                        <button class="btn btn-primary" type="submit">add subject</button>
                    </form>

                    <h3>The existing subjects are:</h3><br>
                    <%
                        DatabaseFile databaseFile = new DatabaseFile();
                        String sql = "select * from subject";
                        ResultSet resultSet = databaseFile.codeselect(sql);
                        out.println("<table class=\"table\">");
                        while (resultSet.next()){

                            out.println("<tr><td>"+resultSet.getString("subjectname")+"</td>"+
                                    "<td><a href='deletesubject.jsp?index="+ resultSet.getInt("subjectid") +"'>delete</a></td></tr>");
                        }
                        out.println("</table>");
                        resultSet.close();
                    %>

                </div>
                <div class="col-sm-9 col-md-6">
                    <h3>Assign subjects to semesters and provide noOfClasses per week to them</h3>
                    <form action="codeaddsubjectgrade.jsp" method="post">
                        <div class="col-xl-6">
                                <label for="semester">Select Semester:</label>
                                <select class="form-control" id="semester" name="semester">
                                    <%
                                        try
                                        {
                                            ResultSet rs = null;
                                            String sql1 = "SELECT * from grade";
                                            DatabaseFile obj = new DatabaseFile();
                                            rs = obj.codeselect(sql1);
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
                                <label for="subject">Select Subject:</label>
                                <select class="form-control" id="subject" name="subject">
                                    <%
                                        try
                                        {
                                            ResultSet rs = null;
                                            String sql1 = "SELECT * from subject";
                                            DatabaseFile obj = new DatabaseFile();
                                            rs = obj.codeselect(sql1);
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
                            <div class="form-group-sm">
                                <label>No of Classes per week:</label>
                            <br>
                                <input type="number" name="noOfclass" class="form-control"> <br>
                            <button class="btn btn-primary" type="submit">Assign Subject</button>
                        </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
    </div>
</div>
<script src="scripts/jquery-1.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
