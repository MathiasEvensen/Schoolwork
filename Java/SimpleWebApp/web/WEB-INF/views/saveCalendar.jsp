<%-- 
    Document   : saveCalendar
    Created on : 12.des.2017, 15:57:24
    Author     : Ann Margrethe
--%>

<%@page import="java.sql.PreparedStatement"%>
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
        <title>Kalender Save</title>
    </head>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    <body>
        
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
                
                String strCalendar_ID = request.getParameter("Calendar_ID");
		String strDato = request.getParameter("txtDato");
		String strHendelse = request.getParameter("txtHendelse");
		
		String sql = "UPDATE Calendar " +
                        "SET Dato = "+strDato+"" +
                        ",Hendelse = "+strHendelse+"" +
                        " WHERE Calendar_ID = "+strCalendar_ID+"";
                
                PreparedStatement pstm = conn.prepareStatement(sql);
                pstm.setString(1, strDato);
                pstm.setString(2, strHendelse);
                pstm.setString(3, strCalendar_ID);
		
		rs = st.executeQuery(sql);
		out.println("Record Update Successfully");
	  		
	  		
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