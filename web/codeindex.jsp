<%@page import="Database.DatabaseFile"%>
<%@page import="java.sql.*" %>
<%@page  session="true" %>
<%
try
{
    //getting value from 
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    //session 
    session.setAttribute("x", username);
    int count = 0;
    try
    {
         
        if( ((username!=null) && (!username.trim().equals(""))) && ((password!=null) && (!password.trim().equals(""))))
        {
            ResultSet rs = null;

            String sql = "SELECT * FROM userinfo "
                    + " WHERE UserName = '"+username+"' and  Password = '"+password+"'";

            //CALLING DATABASE Class
            DatabaseFile obj = new DatabaseFile();
            rs = obj.codeselect(sql);

            while(rs.next())
            {
                count = rs.getInt(1);
              
                //page redirection
                 %>
                 <jsp:forward page="userprofile.jsp"></jsp:forward>
                 <%
            }    
                                          
           rs.close();
                 %>
                 <jsp:forward page="index.jsp">
                     <jsp:param name="msg" value="Incorrect Username or Password"/>
                 </jsp:forward>
                 <%           
        }
        else
        {
             //page redirection
                 %>
                 <jsp:forward page="index.jsp">
                     <jsp:param name="msg" value="Please Fill Username or Password"/>
                 </jsp:forward>
                 <%
        }
    }
    catch(Exception e)
    {
          e.printStackTrace();     
    }
    
}
catch(Exception e)
{
    e.printStackTrace();
}
%>
