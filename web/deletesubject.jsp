<%@page import="Database.DatabaseFile"%>
<%@page session="true" %>
<%
    try
    {
        //session
        HttpSession hs = request.getSession(true);
        //argument
        String username =  hs.getAttribute("x").toString();
        int RequestId = Integer.parseInt(request.getParameter("index"));

        String page1 = " ";

        if (((username != null) && (!username.trim().equals(""))) && (RequestId != 0))
        {
            DatabaseFile objDatabaseFile = new DatabaseFile();
            String sql = "delete from subject where subjectid='"+RequestId+"'";

            objDatabaseFile.codedelete(sql);
            page1 = "addsubjects.jsp";

%>
<jsp:forward page="<%=page1%>">
    <jsp:param name="msg" value="Deleted Successfully!"/>
</jsp:forward>
<%
}
else
{
%>
<jsp:forward page="<%=page1%>">
    <jsp:param name="msg" value="Not Deleted Successfully!"/>
</jsp:forward>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>