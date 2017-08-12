<%@page import="java.util.Random"%>
<%@page import="java.util.Collections"%>
<%@page import="GeniticAlgorithm.Algorithm"%>
<%@page import="GeniticAlgorithm.Population"%>
<%@page import="GeniticAlgorithm.FitnessCalc"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Database.*"%>
<%@page import="java.sql.*"%>
<%
    //session
    HttpSession hs = request.getSession(true);
    //argument
    String username =  hs.getAttribute("x").toString();
    //jdbc connection
    try
    {
        //calling database class
        DatabaseFile obj = new DatabaseFile();

        String sql1 = "SELECT sectionid, sectionsname "
                + "FROM sections ";

        ResultSet rs = obj.codeselect(sql1);

        while(rs.next()) {
            //delete existing
            String sql2 = "DELETE FROM timetable_" + rs.getString("sectionsname");

            obj.codedelete(sql2);
            System.out.println("Previous Table deleted successfully:");

            //create table
            String sql = "CREATE TABLE IF NOT EXISTS timetable_" + rs.getString("sectionsname") + "("
                    + "sno int(11) NOT NULL AUTO_INCREMENT, "
                    + "Day varchar(250) NOT NULL, "
                    + "8_9 int(11) NOT NULL, "
                    + "9_10 int(11) NOT NULL, "
                    + "10_11 int(11) NOT NULL, "
                    + "11_12 int(11) NOT NULL, "
                    + "1_2 int(11) NOT NULL, "
                    + "2_3 int(11) NOT NULL, "
                    + "3_4 int(11) NOT NULL, "
                    + "Grade int(11) NOT NULL, "
                    + "PRIMARY KEY (sno), "
                    + "KEY 8_9 (8_9),"
                    + "KEY 9_10 (9_10), "
                    + "KEY 10_11 (10_11),"
                    + "KEY 11_12 (11_12), "
                    + "KEY 1_2 (1_2), "
                    + "KEY 2_3 (2_3), "
                    + "KEY 3_4 (3_4), "
                    + "KEY Grade (Grade)) "
                    + "ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1";

            System.out.println(sql);
            obj.codeupdate(sql);
            System.out.println("created new table :) ");

            int no_days = 5;
            int no_of_lessons = 7;
            int total_lessons = 35;

            ArrayList<String> weeklist = new ArrayList<String>();
            weeklist.add("Monday");
            weeklist.add("Tuesday");
            weeklist.add("Wednesday");
            weeklist.add("Thursday");
            weeklist.add("Friday");

            String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "", s6 = "", s7 = "";

            // Set a candidate solution
            FitnessCalc.setSolution("1111000000000000000000000000000000000000000000000000000000001111");

            // Create an initial population
            Population myPop = new Population(35, true);

            // Evolve our population until we reach an optimum solution
            int generationCount = 0;

            while (myPop.getFittest().getFitness() < FitnessCalc.getMaxFitness()) {
                generationCount++;
                System.out.println("Generation: " + generationCount + " Fittest: " + myPop.getFittest().getFitness());
                myPop = Algorithm.evolvePopulation(myPop);
            }
            System.out.println("Solution found!");
            System.out.println("Generation: " + generationCount);
            System.out.println("Genes:");
            System.out.println(myPop.getFittest());

            //grade
            ArrayList wholeList = new ArrayList<String>();

            String sql11 = "SELECT gradeid,gradename "
                    + "FROM grade";

            ResultSet rs11 = obj.codeselect(sql11);

            int gradeid = 0;

            ArrayList<String> gradeList = new ArrayList<String>();

            while (rs11.next()) {
                ArrayList<String> finalList = new ArrayList<String>();

                gradeid = rs11.getInt("gradeid");

                String sql22 = "SELECT subjectid, NoOfClasses "
                        + "FROM subject_grade "
                        + "WHERE gradeid = '" + gradeid + "'";

                ResultSet rs22 = obj.codeselect(sql22);

                while (rs22.next()) {
                    int subject_id = rs22.getInt("subjectid");
                    int k = rs22.getInt("NoOfClasses");

                    for (int k1 = 0; k1 < k; k1++) {
                        finalList.add(subject_id + "");
                    }
                }
                wholeList.add(finalList);
                gradeList.add(gradeid + "");
            }

            rs11.close();
            System.out.println("********************************" + wholeList.size());
                if(!wholeList.isEmpty()) {
                    for (int i = 0; i < wholeList.size(); i++) {
                        ArrayList<String> objArrayList = (ArrayList<String>) wholeList.get(i);

                        long seed = System.nanoTime();

                        Collections.shuffle(objArrayList, new Random(seed));

                        String sql4 = "INSERT INTO timetable_" + rs.getString("sectionsname") + " (Day, 8_9, 9_10, 10_11, 11_12, 1_2, 2_3, 3_4, Grade) "
                                + "VALUES ('" + weeklist.get(0) + "',  '" + objArrayList.get(0) + "', '" + objArrayList.get(1) + "', '" + objArrayList.get(2) + "', '" + objArrayList.get(3) + "', '" + objArrayList.get(4) + "', '" + objArrayList.get(5) + "', '" + objArrayList.get(6) + "', '" + gradeList.get(i) + "'),"
                                + "('" + weeklist.get(1) + "', '" + objArrayList.get(7) + "', '" + objArrayList.get(8) + "', '" + objArrayList.get(9) + "', '" + objArrayList.get(10) + "', '" + objArrayList.get(11) + "', '" + objArrayList.get(12) + "', '" + objArrayList.get(13) + "', '" + gradeList.get(i) + "'),"
                                + "('" + weeklist.get(2) + "', '" + objArrayList.get(14) + "', '" + objArrayList.get(15) + "', '" + objArrayList.get(16) + "', '" + objArrayList.get(17) + "', '" + objArrayList.get(18) + "', '" + objArrayList.get(19) + "', '" + objArrayList.get(20) + "', '" + gradeList.get(i) + "'),"
                                + "('" + weeklist.get(3) + "', '" + objArrayList.get(21) + "', '" + objArrayList.get(22) + "', '" + objArrayList.get(23) + "', '" + objArrayList.get(24) + "', '" + objArrayList.get(25) + "', '" + objArrayList.get(26) + "', '" + objArrayList.get(27) + "', '" + gradeList.get(i) + "'),"
                                + "('" + weeklist.get(4) + "', '" + objArrayList.get(28) + "', '" + objArrayList.get(29) + "', '" + objArrayList.get(30) + "', '" + objArrayList.get(31) + "', '" + objArrayList.get(32) + "', '" + objArrayList.get(33) + "', '" + objArrayList.get(34) + "', '" + gradeList.get(i) + "')";

                        obj.codeupdate(sql4);

                        System.out.println("********************************");
                        System.out.println("Routine generated successfully");
                    }
                }else {
                    System.out.println("I am mohan");
                    System.out.println(wholeList.get(0));
                    System.out.println(wholeList.get(1));
                    System.out.println(wholeList.get(2));

%>
                    <jsp:forward page="gentimetable.jsp">
                    <jsp:param name="msg" value="There is no sufficient data to produce routine!"></jsp:param>
                    </jsp:forward>
              <%

                }

                wholeList.clear();
                wholeList = null;
        }

        rs.close();
            %>
<jsp:forward page="gentimetable.jsp">
    <jsp:param name="msg" value="Time Table Generated Sucessfully!"></jsp:param>
</jsp:forward>
<%

    }
    catch(Exception e)
    {
        e.printStackTrace();
    }

%>