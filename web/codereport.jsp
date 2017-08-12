<%@page import="java.io.FileInputStream"%>
<%@page import="Database.DatabaseFile"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="java.sql.*"%>
<%
    try 
    {
        Workbook wb = new HSSFWorkbook();
        Sheet personSheet = wb.createSheet("TimeTableList");
        Row headerRow = personSheet.createRow(0);
        
        Cell s1HeaderCell = headerRow.createCell(0);
        s1HeaderCell.setCellValue("Day");
        
        Cell s2HeaderCell = headerRow.createCell(1);
        s2HeaderCell.setCellValue("8 to 9 am");
        
        Cell s3HeaderCell = headerRow.createCell(2);
        s3HeaderCell.setCellValue("9 to 10 am");
        
        Cell s4HeaderCell = headerRow.createCell(3);
        s4HeaderCell.setCellValue("10 to 11 am");
        
        Cell s5HeaderCell = headerRow.createCell(4);
        s5HeaderCell.setCellValue("11 to 12 am");
        
        Cell s6HeaderCell = headerRow.createCell(5);
        s6HeaderCell.setCellValue("01 to 02 pm");
        
        Cell s7HeaderCell = headerRow.createCell(6);
        s7HeaderCell.setCellValue("02 to 03 pm");
        
        Cell s8HeaderCell = headerRow.createCell(7);
        s8HeaderCell.setCellValue("03 to 04 pm");
        
        String sql = "SELECT * FROM timetable_"+request.getParameter("index").toString().trim()+" WHERE Grade="+request.getParameter("index1").toString().trim();
                
        DatabaseFile objDatabaseFile = new DatabaseFile();
        ResultSet rs = objDatabaseFile.codeselect(sql);

        int row = 1;
        
        while (rs.next()) 
        {
            String name = rs.getString("Day");
            String s1 = rs.getString("8_9");
            String s2 = rs.getString("9_10");
            String s3 = rs.getString("10_11");
            String s4 = rs.getString("11_12");
            String s5 = rs.getString("1_2");
            String s6 = rs.getString("2_3");
            String s7 = rs.getString("3_4");
           
            Row dataRow = personSheet.createRow(row);

            Cell dataNameCell = dataRow.createCell(0);
            dataNameCell.setCellValue(name);

            String sql1 = "SELECT subjectname "
                    + "FROM subject "
                    + "WHERE subjectid = '"+s1+"'";
            
            ResultSet rs1 = objDatabaseFile.codeselect(sql1);
            
            while (rs1.next()) 
            {
                s1 = rs1.getString("subjectname");
            }
            
            String sql2 = "SELECT subjectname "
                    + "FROM subject "
                    + "WHERE subjectid = '"+s2+"'";
            
            ResultSet rs2 = objDatabaseFile.codeselect(sql2);
            
            while (rs2.next()) 
            {
                s2 = rs2.getString("subjectname");
            }
            
            String sql3 = "SELECT subjectname "
                    + "FROM subject "
                    + "WHERE subjectid = '"+s3+"'";
            
            ResultSet rs3 = objDatabaseFile.codeselect(sql3);
            
            while (rs3.next()) 
            {
                s3 = rs3.getString("subjectname");
            }
            
            String sql4 = "SELECT subjectname "
                    + "FROM subject "
                    + "WHERE subjectid = '"+s4+"'";
            
            ResultSet rs4 = objDatabaseFile.codeselect(sql4);
            
            while (rs4.next()) 
            {
                s4 = rs4.getString("subjectname");
            }
            
            String sql5 = "SELECT subjectname "
                    + "FROM subject "
                    + "WHERE subjectid = '"+s5+"'";
            
            ResultSet rs5 = objDatabaseFile.codeselect(sql5);
            
            while (rs5.next()) 
            {
                s5 = rs5.getString("subjectname");
            }
            
            String sql6 = "SELECT subjectname "
                    + "FROM subject "
                    + "WHERE subjectid = '"+s6+"'";
            
            ResultSet rs6 = objDatabaseFile.codeselect(sql6);
            
            while (rs6.next()) 
            {
                s6 = rs6.getString("subjectname");
            }
            
            String sql7 = "SELECT subjectname "
                    + "FROM subject "
                    + "WHERE subjectid = '"+s7+"'";
            
            ResultSet rs7 = objDatabaseFile.codeselect(sql7);
            
            while (rs7.next()) 
            {
                s7 = rs7.getString("subjectname");
            }                       
            
            Cell dataAddressCell = dataRow.createCell(1);
            dataAddressCell.setCellValue(s1);

            Cell dataEmailCell = dataRow.createCell(2);
            dataEmailCell.setCellValue(s2);

            Cell dataphone_noCell = dataRow.createCell(3);
            dataphone_noCell.setCellValue(s3);

            Cell dataaccount_noCell = dataRow.createCell(4);
            dataaccount_noCell.setCellValue(s4);

            Cell dataaccount_typeCell = dataRow.createCell(5);
            dataaccount_typeCell.setCellValue(s5);

            Cell dataprincipal_amountCell = dataRow.createCell(6);
            dataprincipal_amountCell.setCellValue(s6);

            Cell datarate_of_interestCell = dataRow.createCell(7);
            datarate_of_interestCell.setCellValue(s7);

            row = row + 1;
        }

        String outputDirPath = "E:\\workbook.xls";
        FileOutputStream fileOut = new FileOutputStream(outputDirPath);
        wb.write(fileOut);
        fileOut.close();

        String filename = "E:\\workbook.xls";

        ServletOutputStream out1 = response.getOutputStream();
        FileInputStream in = new FileInputStream(filename);

        response.setContentType("application/vnd.ms-excel");
        response.addHeader("content-disposition","attachment; filename=" + filename);

        int octet;
        
        while ((octet = in.read()) != -1) 
        {
            out1.write(octet);
        }

        in.close();
        out1.close();
    } 
    catch (Exception e) 
    {
        e.printStackTrace();
    }
%>