<%@page import="Database.*"%>
<%@page import="java.sql.*"%>
<%
try
{
    //getting values from design page
    String firstname = request.getParameter("name");
    String phoneno = request.getParameter("phone");
    String email = request.getParameter("email");
    String address = request.getParameter("address");   
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    if( ((firstname!=null) && (!firstname.trim().equals(""))) && ((phoneno!=null) && (!phoneno.trim().equals(""))) 
            && ((email!=null) && (!email.trim().equals(""))) && ((address!=null) && (!address.trim().equals(""))) 
            && ((username!=null) && (!username.trim().equals(""))) && ((password!=null) && (!password.trim().equals(""))))
    {        
        //type casting
        Long mobile = Long.parseLong(phoneno);
       
        //jdbc connection
        try
        {
            ResultSet rs = null;
            int count = 0;
            //calling database class
            DatabaseFile obj = new DatabaseFile();
            String sql1 = "SELECT COUNT(*) as c "
                    + "FROM userinfo "
                    + "WHERE UserName = '"+username+"' "
                    + "AND  Password = '"+password+"' ";
            
            rs = obj.codeselect(sql1);

            while(rs.next())
            {
                count = rs.getInt(1);
                System.out.println("count:"+ count);
            }

            rs.close();
            
            if(count > 0)
            {
               %>
               <jsp:forward page="signup.jsp">
                   <jsp:param name="msg" value="Username or Password already exits"></jsp:param>
               </jsp:forward>
               <%
            }

            if(count == 0)
            {
                String sql = "INSERT INTO userinfo(Name, PhoneNo, Email, Address, UserName, Password, RecordedDate)"
                    + " VALUES('"+firstname+"', '"+mobile+"', '"+email+"', '"+address+"', '"+username+"', '"+password+"', now())";

                obj.codeinsert(sql);
            }

           %>
               <jsp:forward page="index.jsp">
                   <jsp:param name="msg" value="You can login, your account is active."></jsp:param>               
               </jsp:forward>
           <%

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    else
    {
           %>
           <jsp:forward page="signup.jsp">
               <jsp:param name="msg" value="Please Fill All Details"></jsp:param>
           </jsp:forward>
           <%
    }
    
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
%>