<%@page import="Database.*"%>
<%@page import="java.sql.*"%>
<%
try
{
     //session
     HttpSession hs = request.getSession(true);
    String username =  hs.getAttribute("x").toString();
    //getting values from teaccherprofile.jsp
    String fullname = request.getParameter("fullname");
    String age = request.getParameter("age");
    String contactno = request.getParameter("contactno");   
    String address = request.getParameter("address");
    String subjects[] = request.getParameterValues("subjects");
    String grades[] = request.getParameterValues("semester");
    String sections[] = request.getParameterValues("sections");

    if( ( (username!=null)&&(fullname!=null) && (!fullname.trim().equals(""))) && ((age!=null) && (!age.trim().equals("")))
            &&  ((contactno!=null) && (!contactno.trim().equals("")))
            && ((address!=null) && (!address.trim().equals("")))  && (subjects!=null) && (grades!=null) && (sections!=null))
    {        
        //type casting
        Long mobile = Long.parseLong(contactno);
        //jdbc connection
        try
        {           
            //calling database class
            DatabaseFile obj = new DatabaseFile();
            
            String sql = "insert into teacherinfo(FullName, Age, ContactNo, Address, RecordedDate)"
                    + " VALUES('"+fullname+"', '"+age+"', '"+contactno+"', '"+address+"', now())";

            obj.codeinsert(sql);
            
            String sql1 = "SELECT teacherid "
                    + "FROM teacherinfo "
                    + "ORDER BY teacherid DESC "
                    + " LIMIT 1";
            
            ResultSet rs = obj.codeselect(sql1);
            
            int teacherid = 0;
            
            while(rs.next())
            {
                teacherid = rs.getInt("teacherid");
            }
            
            rs.close();
                   
            //subjects
            for(int i = 0; i < subjects.length; i++)
            {
                String sql2 = "INSERT INTO teacher_subjects(teacherid, subjectid) VALUES('"+teacherid+"', '"+subjects[i]+"')";
                
                obj.codeinsert(sql2);
            }
            
            //grade
            for(int i = 0; i < grades.length; i++)
            {
                String sql3 = "INSERT INTO teacher_grades(teacherid, gradeid) VALUES('"+teacherid+"', '"+grades[i]+"')";
                
                obj.codeinsert(sql3);
            }
            
            //sections
            for(int i = 0; i < sections.length; i++)
            {
                String sql4 = "INSERT INTO teacher_sections(teacherid, sectionid) VALUES('"+teacherid+"', '"+sections[i]+"')";
                
                obj.codeinsert(sql4);
            }
           
           %>
               <jsp:forward page="teacherprofile.jsp">
                   <jsp:param name="msg" value="Account Created Sucessfully!"></jsp:param>               
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
           <jsp:forward page="teacherprofile.jsp">
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