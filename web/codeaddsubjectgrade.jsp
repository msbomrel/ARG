<%@page import="Database.*"%>
<%@page import="java.sql.*"%>

<%
    try {
        String semesterid = request.getParameter("semester");
        String subjectid = request.getParameter("subject");
        String noofclass = request.getParameter("noOfclass");

        if (semesterid != null && subjectid != null && noofclass != null) {
            DatabaseFile databaseFile = new DatabaseFile();
            String sql = "insert into subject_grade(subjectid,gradeid,NoOfClasses) values ('" + subjectid + "','" + semesterid + "','" + noofclass + "')";
            databaseFile.codeinsert(sql);
%>
        <jsp:forward page="addsubjects.jsp">
            <jsp:param name="msg" value="Subjects assigned successfully"></jsp:param>
        </jsp:forward>
<%
        } else{
            %>
            <jsp:forward page="addsubjects.jsp">
                <jsp:param name="msg" value="Subjects is not assigned"></jsp:param>
            </jsp:forward>
            <%

        }
    }
    catch (Exception e){
        e.printStackTrace();
    }
%>