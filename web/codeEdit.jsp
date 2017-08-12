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
        
        //getting values from design page
        String fullname = request.getParameter("fullname");
        String age = request.getParameter("age");
        String nationality = request.getParameter("nationality");
        String contactno = request.getParameter("contactno");   
        String address = request.getParameter("address");
        String passportno = "1222";
        String passportexpy = "2016-09-12";
        String visatype = "HIB";
        String school = "Yes";
        String subjects[] = request.getParameterValues("subjects");
        String grades[] = request.getParameterValues("grades");
        String sections[] = request.getParameterValues("sections");
        String tutor = "y";
        String grade = request.getParameter("grade");
        String id = request.getParameter("hide");
       
        String page1 = "";
            
        if( ((id!=null) && (!id.trim().equals(""))) 
            && ((fullname!=null) && (!fullname.trim().equals(""))) && ((age!=null) && (!age.trim().equals(""))) 
            && ((nationality!=null) && (!nationality.trim().equals(""))) && ((contactno!=null) && (!contactno.trim().equals(""))) 
            && ((address!=null) && (!address.trim().equals(""))) && ((passportno!=null) && (!passportno.trim().equals("")))
            && ((passportexpy!=null) && (!passportexpy.trim().equals(""))) && ((visatype!=null) && (!visatype.trim().equals("")))
            && ((school!=null) && (!school.trim().equals(""))) && ((tutor!=null) && (!tutor.trim().equals("")))
            && ((grade!=null) && (!grade.trim().equals(""))) && (subjects!=null) && (grades!=null) && (sections!=null))
        {        
            //type casting
            Long mobile = Long.parseLong(contactno);
            
            DatabaseFile objDatabaseFile = new DatabaseFile();

            String sql1 = "UPDATE teacherinfo "
                    + " SET FullName = '"+fullname+"', "
                    + " Age= '"+age+"', "
                    + " Nationality= '"+nationality+"', "
                    + " ContactNo = '"+mobile+"', "
                    + " Address = '"+address+"', "
                    + " PassportNo = '"+passportno+"', "
                    + " PassportExpiryDate = '"+passportexpy+"', "
                    + " VisaType = '"+visatype+"', " 
                    + " SchoolAccommodation = '"+school+"', "
                    + " Tutor= '"+tutor+"', "
                    + " Grade = '"+grade+"' "
                    + " where teacherid = '" + id + "' ";

            objDatabaseFile.codedelete(sql1);
            
            String sql2 = "DELETE "
                    + " FROM teacher_subjects "
                    + " where teacherid = '" + id + "'";

            objDatabaseFile.codedelete(sql2);
            
            String sql3 = "DELETE "
                    + " FROM teacher_grades "
                    + " where teacherid = '" + id + "'";

            objDatabaseFile.codedelete(sql3);
            
            String sql4 = "DELETE "
                    + " FROM teacher_sections "
                    + " where teacherid = '" + id + "'";

            objDatabaseFile.codedelete(sql4);
            
             //subjects
            for(int i = 0; i < subjects.length; i++)
            {
                String sql5 = "INSERT INTO teacher_subjects(teacherid, subjectid) VALUES('"+id+"', '"+subjects[i]+"')";
                
                objDatabaseFile.codeinsert(sql5);
            }
            
            //grade
            for(int i = 0; i < grades.length; i++)
            {
                String sql6 = "INSERT INTO teacher_grades(teacherid, gradeid) VALUES('"+id+"', '"+grades[i]+"')";
                
                objDatabaseFile.codeinsert(sql6);
            }
            
            //sections
            for(int i = 0; i < sections.length; i++)
            {
                String sql7 = "INSERT INTO teacher_sections(teacherid, sectionid) VALUES('"+id+"', '"+sections[i]+"')";
                
                objDatabaseFile.codeinsert(sql7);
            }
                      
            page1 = "viewteacherprofile.jsp";
        
                     %>
                     <jsp:forward page="<%=page1%>">
                             <jsp:param name="msg" value="Account modified Successfully!"/>
                         </jsp:forward>
                     <%                          
        } 
        else 
        {
                     %>
                     <jsp:forward page="<%=page1%>">
                             <jsp:param name="msg" value="Record Not Modified Successfully!"/>
                         </jsp:forward>
                     <%    
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>