<%-- 
    Document   : BlogListView
    Created on : 21.nov.2017, 13:20:39
    Author     : evakristine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post View</title>
    </head>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>


        <body>
            <h1>Your blog posts</h1>

        <%-- Henter informasjon fra databasen og viser det i en tabell--%>      

        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>

        <%

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
            align = "left" cellpadding = "5" cellspacing = "5" border = "1" >
            <tr>

            </tr>
            <tr bgcolor = "firebrick" >

                <td><b>Log_ID</b></td> 
                <td><b>Title</b></td> 
                <td><b>Content</b></td>
                <td><b>Date</b></td>
                <td><b>Edit or Delete</b></td>

            </tr>
            <%     try {
                    conn = DriverManager.getConnection(hostName + dbName, userName, password);
                    st = conn.createStatement();
                    String sql = "SELECT * FROM Log LIMIT 100;";

                    rs = st.executeQuery(sql);
                    while (rs.next()) {
            %> 
            <tr 
                bgcolor = "white" >

                <td><%= rs.getString("Log_ID")%></td>
                <td><%= rs.getString("Title")%></td>
                <td><%= rs.getString("Content")%></td>
                <td><%= rs.getString("Date")%></td> 
             
                <td>
                    <a href="editBlog?Log_ID=<%=rs.getString("Log_ID")%>">Edit</a>

                    <a href="deleteBlog?Log_ID=<%=rs.getString("Log_ID")%>">Delete</a>
                </td>
            </tr>


            <%
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>

    </body>
</html>