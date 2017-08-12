<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DatabaseFile"%>
<!DOCTYPE>
<html style="height: auto">
    <head>
        <title>Automatic Routine Generator</title>
        <link rel="stylesheet" href="styles/layout.css">
        <link rel="stylesheet" href="css/style.css">
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
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="addsemester.jsp">Semesters</a></li>!
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
        <h2>Instructions for the admin to generate routine automatically !!!</h2>
            <div class="panel panel-default">
                <div class="panel-body">
                    <ol>
                        <h2><li>Add Semesters</li></h2>
                        <h2><li>Add Subjects</li></h2>
                        <h2><li>Add Teachers</li></h2>
                        <h2><li>Generate Routine</li></h2>
                        <h2><li>View Routine</li></h2>
                    </ol>
                </div>
            </div>
            <div class="clear">

            </div>
            <footer class="block">
                Copyright @ mohan</footer>
        </div>
    </div>
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
