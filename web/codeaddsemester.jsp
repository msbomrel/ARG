<%@page import="Database.*"%>
<%@page import="java.sql.*"%>
<%

    String semester = request.getParameter("semester");

    DatabaseFile objDatabase = new DatabaseFile();
    String sql1 = "select * from grade where gradename='"+semester+"'";
    ResultSet resultSet = objDatabase.codeselect(sql1);

    if(semester != null){
    int count = 0;
    if(resultSet.next()){
        count = resultSet.getInt(1);
        count ++;
    }
    if(count > 0) {
        %>
    <jsp:forward page="addsemester.jsp">
        <jsp:param name="msg1" value="You cannnot add same semester twice !!!"></jsp:param>
    </jsp:forward>
<%
    }else {
        String sql = "insert into grade(gradename) values('" + semester + "')";
        objDatabase.codeinsert(sql);
     %>

    <jsp:forward page="addsemester.jsp">
        <jsp:param name="msg" value="Semester Sucessfully!"></jsp:param>
    </jsp:forward>
<%

    }
    }
    else {
     %>
    <jsp:forward page="addsemester.jsp">
        <jsp:param name="msg" value="You cannot enter empty value!"></jsp:param>
    </jsp:forward>
<%
    }
%>

