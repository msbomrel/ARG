<!DOCTYPE>
<html>
<title>sigin</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body id="top">
<%
    //getting response
    out.println("<font color = 'red' >");

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

    out.println("<font>");
%>
<div class="login-form">
    <div class="head">
        <img src="images/man.png" alt="">
        <center><h4>Admin Login</h4></center>
    </div>
    <form method="post" action="codeindex.jsp">
        <center><h1><b>Automatic Routine Generator</b></h1></center><hr>
        <input type="hidden" name="page" value="login">
        <li>
            <a class=" icon user"></a>
            <input type="text" class="text" name="username" value="username" onfocus="this.value = '';"
                   onblur="if (this.value == '') {this.value = 'username';}" >
        </li>
        <li>
            <a class=" icon lock"></a>
            <input type="password" name="password" value="password" onfocus="this.value = '';"
                   onblur="if (this.value == '') {this.value = 'password';}">
        </li>
        <center>
            <input type="submit" value="SIGN IN">
        </center>
        <hr>
        <center><a href="signup.jsp">New User</a></center>

    </form>
</div>
</body>
</html>
