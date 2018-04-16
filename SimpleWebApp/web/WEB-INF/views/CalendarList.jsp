<%-- 
    Document   : CalendarList
    Created on : 05.des.2017, 19:53:33
    Author     : Ann Margrethe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendar List</title>
    </head>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>

        <body>
            <h1>Calendar list with edit</h1>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.PreparedStatement"%>

            <%
            
        //String id = request.getParameter("ID");
        String driverName = "com.mysql.jdbc.Driver";
        String hostName = "jdbc:mysql://localhost:3306/";
        String dbName = "Skybase";
        String userName = "root";
        String password = "root";
        try {
        Class.forName(driverName);
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
        }
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        %>
            <table 
                cellpadding = "10" cellspacing = "10" border = "1">
              
                     <tr bgcolor = "darkred" >
                     <td><b>Calendar_ID</b></td> 
                     <td><b>Date</b></td> 
                     <td><b>Event</b></td>
                     <td><b>Edit</b></td>
                     
                     </tr>
                     <%
                        try {
                        conn = DriverManager.getConnection(hostName+ dbName, userName, password);
                        st = conn.createStatement();

                          String sql = "SELECT * FROM Calendar ORDER BY Calendar_ID";
                          
                        rs = st.executeQuery(sql);
                        while ((rs!=null) && (rs.next())) {
                        %> 
                        <tbody> 
                            <tr>
                                
                    <td><%= rs.getInt("Calendar_ID") %></td>
                    <td><%= rs.getString("Date") %></td>
                    <td><%= rs.getString("Event") %></td>
                   
                    <td> <a href="editCalendar?Calendar_ID=<%=rs.getInt("Calendar_ID")%>">Edit</a></td>
                    
                    </tr>                
           
                        <%
                        }
                        } catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	
		try {
			if(st!=null){
				st.close();
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
                        %>
                            
                        </table>
                        
                       

                        <p><a href="${pageContext.request.contextPath}/Calendar">Return</a>
                        
                        </body>
                        </html>