/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.sql.*;

public class DatabaseFile {
    
    //select code here
    public ResultSet codeselect(String sql)
    {
        ResultSet rs = null;
        
        try
        {
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegetimetable", "root", "123");
            
            Statement  st  = con.createStatement();
            
            rs  = st.executeQuery(sql);
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return rs;
    }
    
    //insert code here
    public void codeinsert(String sql)
    {
         try
        {
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegetimetable", "root", "123");
            
            Statement  st = con.createStatement();
            
            st.executeUpdate(sql);
           
            st.close();
            
            con.commit();
            
            con.close();
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
    //update code here
    public void codeupdate(String sql)
    {
         try
        {
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegetimetable", "root", "123");
            
            Statement   st = con.createStatement();
            
            st.executeUpdate(sql);
            
            st.close();
            
            con.close();
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
    //delete code here
    public void codedelete(String sql)
    {
         try
        {
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegetimetable", "root", "123");
            
            Statement  st  = con.createStatement();
            
            st.executeUpdate(sql);
            
            st.close();
            
            con.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }    
}