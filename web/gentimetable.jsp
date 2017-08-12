<%@page import="Database.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE>
<html>
<head>
<title>Time Table Task</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
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
                    <li  class="active"><a href="gentimetable.jsp">Generate Routine</a></li>
                    <li><a href="viewtimetable.jsp">View Routine</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li> <a href="#" style="color: blue;">Welcome : <%=session.getAttribute("x")%> </a></li>
                    <li ><a href="signout.jsp"><span class="glyphicon glyphicon-log-out" style="color:red;"></span> sign out</a></li>
                </ul>
            </div>
        </nav>

        <div class="panel panel-default">
            <div class="panel-body">
                <form action="codegenerateschool.jsp">
                    <label> Generate Routine for all semesters</label><br>
                    <button type="submit" class="btn btn-primary" id="load"
                            data-loading-text="<i class='fa fa-spinner fa-spin '></i> processing">Start Genetic Algorithm</button>
                </form>
            </div>
            <%
                out.println("<font color = 'green' >");

                //getting response
                try
                {
                    if( (request.getParameter("msg") != null) && (!(request.getParameter("msg").trim().equals(""))) )
                    {
                        out.println("<div class=\"panel-body\">");
                        out.println("<h3>" + request.getParameter("msg")+ "</h3>");
                        out.println("</div");
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
  </div>
<script>
    $('.btn').on('click', function() {
        var $this = $(this);
        $this.button('loading');
        setTimeout(function() {
            $this.button('reset');
        }, 8000);
    });

</script>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
