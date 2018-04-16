<%-- 
    Document   : calendar
    Created on : 17.okt.2017, 11:23:06
    Author     : Ann Margrethe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException" %> 

<html>
 <head>
    <meta charset="UTF-8">
    <title>Calendar</title>
 </head>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
 
    <body>
<h1>Calendar</h1>
     
  <%
	String keyword = "";
	if(request.getParameter("txtKeyword") != null) {
		keyword = request.getParameter("txtKeyword");
	}
%>

<form name="frmSearch" method="get" action="CalendarSearch"><p>
	  
	    <tr>
	      <th>Search for date
	      <input name="txtKeyword" type="text" id="txtKeyword" value="<%=keyword%>">
	      <input type="submit" value="Search"></th>
	    </tr>
	  </table>
	</form>

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
             
                <table width="400" border="1" >
                    
		  <tr>
                     <tr bgcolor = "#009999" >
		    <th width="50" height="40"> <div align="center">Date </div></th>
		    <th width="50" height="40"> <div align="center">Event </div></th>
		    
		  </tr>	
			<%while((rs!=null) && (rs.next())) { %>
				  <tr>
				    <td><div align="center"><%=rs.getString("Date")%></div></td>
				    <td><%=rs.getString("Event")%></td>
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
                      
             <h3>Calendar List</h3>
              <a href="${pageContext.request.contextPath}/CalendarList">Go to calendar list to edit</a>     
    </body>           
</html>