<%-- 
    Document   : editBlog
    Created on : 11.des.2017, 19:39:15
    Author     : evakristine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Blog Post</title>
 </head>
 <body>
 

<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<html>
    <head>
     
     <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    <body>
        <h1>Edit blog post</h1>
<%	
        String Log_ID = request.getParameter("Log_ID");
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
		
		String sql = "SELECT * FROM Log WHERE Log_ID = '" + Log_ID + "' ";
		
		rs = st.executeQuery(sql);
		if(rs != null) {
			rs.next();
		%>
                
                <form name="frmUpdate" method="post" action= "${pageContext.request.contextPath}/editBlog">
                    
		Edit title or content
                <p><table align = "left" cellpadding = "5" cellspacing = "5" border = "1" >
			<tr>
                           
                            <th >
				<div align="left">Log_ID </div></th>
                                <td> <%=rs.getString("Log_ID") %> </td>
                                <td><input type="text" name="Log_ID" value="${blogBlog.Log_ID}"></td>
                                
                                   
			</tr>
			<tr>
				<th >
				<div align="left">Title </div></th>
                                <td> <%=rs.getString("Title") %> </td>
				<td><input type="text" name="Title"  value="${blogBlog.Title}"></td>
			</tr>
			<tr>
				<th >
				<div align="left">Content </div></th>
                                <td> <%=rs.getString("Content") %> </td>
				<td><input type="text" name="Content" value="${blogBlog.Content}"></td>
			</tr>			
	
			</table> 
                        <p> 
                        <p> <input align="bottom" type="submit" value="Save">
                  </p>
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