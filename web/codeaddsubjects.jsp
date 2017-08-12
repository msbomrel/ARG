<%@page import="Database.*"%>
<%@page import="java.sql.*"%>
<%
    try{
        String subject = request.getParameter("subject");
        if(subject != null){
            DatabaseFile databaseFile = new DatabaseFile();

            String sql = "insert into subject (subjectname) values ('"+subject+"')";
            databaseFile.codeinsert(sql);

%>
    <jsp:forward page="addsubjects.jsp">
        <jsp:param name="msg" value="Subjects added successfully."></jsp:param>
    </jsp:forward>
<%
        }
    }catch (Exception e){
        e.printStackTrace();
    }
%>