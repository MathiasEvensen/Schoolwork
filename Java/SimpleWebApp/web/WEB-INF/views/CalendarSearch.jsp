<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : CalendarSearch
    Created on : 14.nov.2017, 10:48:34
    Author     : Ann Margrethe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendar Search</title>
    </head>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>

        <body>
            <h1>Calendar Search</h1>          

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException" %> 

  <%
	String keyword = "";
	if(request.getParameter("txtKeyword") != null) {
		keyword = request.getParameter("txtKeyword");
	}
%>

       <%
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
		
		String sql = "SELECT * FROM  Calendar WHERE Date like '%" +  keyword + "%' OR Event like '%" +  keyword + "%' ";
		
		System.out.println(sql);
		
		rs = st.executeQuery(sql);
		%>      
             
                <table width="600" border="1">
		  <tr>
		    <th width="91"> <div align="center">Date </div></th>
		    <th width="98"> <div align="center">Event </div></th>
		    
		  </tr>	
			<%while((rs!=null) && (rs.next())) { %>
				  <tr>
				    <td><div align="center"><%=rs.getString("Date")%></div></td>
				    <td><div align="center"><%=rs.getString("Event")%></td>
				  </tr>
	       	<%}%>
	  	</table>      
             
                <%	
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
                        
                        <p><a href="${pageContext.request.contextPath}/Calendar">Return</a>
                        
                        </body>
                         </html>