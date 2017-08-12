<%@page import="java.sql.*"%>
<%@page import="Database.DatabaseFile"%>
<%@page session="true" %>
<%
try{
    //session  close
    session.getAttribute("x");
    //invalidate session or destroy session
    session.invalidate();
    %>
    <jsp:forward page="index.jsp"></jsp:forward>
    <%
}
catch(Exception e)
{
    e.printStackTrace();
}
%>