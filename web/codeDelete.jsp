<%@page import="Database.DatabaseFile"%>
<%@page import="java.sql.ResultSet"%>
<%@page session="true" %>
<%
    try 
    {
        //session
        HttpSession hs = request.getSession(true);
        //argument
        String username =  hs.getAttribute("x").toString();
        int RequestId = Integer.parseInt(request.getParameter("index"));   
       
        String page1 = "";

        if (((username != null) && (!username.trim().equals(""))) && (RequestId != 0)) 
        {
            DatabaseFile objDatabaseFile = new DatabaseFile();

            String sql1 = "DELETE "
                    + " FROM teacherinfo "
                    + " where teacherid = '" + RequestId + "'";

            objDatabaseFile.codedelete(sql1);
            
            String sql2 = "DELETE "
                    + " FROM teacher_subjects "
                    + " where teacherid = '" + RequestId + "'";

            objDatabaseFile.codedelete(sql2);
            
            String sql3 = "DELETE "
                    + " FROM teacher_grades "
                    + " where teacherid = '" + RequestId + "'";

            objDatabaseFile.codedelete(sql3);
            
            String sql4 = "DELETE "
                    + " FROM teacher_sections "
                    + " where teacherid = '" + RequestId + "'";

            objDatabaseFile.codedelete(sql4);

            String sql5 = "delete * from grade where gradeid = '"+RequestId+"'";
            objDatabaseFile.codedelete(sql5);

                page1 = "viewteacherprofile.jsp";

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