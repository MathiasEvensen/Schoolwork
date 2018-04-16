<%-- 
    Document   : editCalendar
    Created on : 11.des.2017, 15:57:22
    Author     : Ann Margrethe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Edit Calendar</title><p>
    </head>
     <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    <body>
        <h1>Calendar Edit</h1>
<%	
        String Calendar_ID = request.getParameter("Calendar_ID");
	String driverName = "com.mysql.jdbc.Driver";
        String hostName = "jdbc:mysql://localhost:3306/";
        String dbName = "Skybase";
        String userName = "root";
        String password = "root";
        
	Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
	
	try {
		Class.forName(driverName);
		
		conn =  DriverManager.getConnection(hostName+ dbName, userName, password);
		
		st = conn.createStatement();
		
		String sql = "SELECT * FROM Calendar WHERE Calendar_ID = '" + Calendar_ID + "'  ";
		
		rs = st.executeQuery(sql);
		if(rs != null) {
			rs.next();
		%>
     
                <form name="frmUpdate" method="POST" action="${pageContext.request.contextPath}/editCalendar">
                
                Edit date or event

                <p><table border="1">	
			<tr>
				<th>
				<div align="left">Calendar_ID </div></th>
                                <td><%=rs.getString("Calendar_ID")%></td>
                                <td><input type="text" name="Calendar_ID" value="${calendar.Calendar_ID}" /></td>
				
			</tr>
			<tr>
				<th>
				<div align="left">Date </div></th>
                                <td><%=rs.getString("Date")%></td>
                                <td><input type="text" name="Date" value="${calendar.Date}" /></td>
				
			</tr>
			<tr>
				<th>
				<div align="left">Event </div></th>
                                <td><%=rs.getString("Event")%></td>
                                <td><input type="text" name="Event" value="${calendar.Event}" /></td>
                                
				
			</tr>			
	
			</table> 
                        <p><input type="submit" value="Save">
		</form> 
		
		<% }
	  		
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
</body>
</html>