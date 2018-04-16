<%-- 
    Document   : is104View
    Created on : 13.nov.2017, 09:23:12
    Author     : ellak
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Question List</title>
    </head>
    <body>
        
        <jsp:include page="_header.jsp"></jsp:include>
        <jsp:include page="_menu2.jsp"></jsp:include>
        
        <h1>Question List</h1>
         
        <p style="color: red;">${errorString}</p>
        
        <a href="createQuestion" >Create Questions</a> <<>>
         <a href="studentForum" >Back to forum</a>
        <table border="1" cellpadding="4" cellspacing="1" >
        <tr>
          <th>Question_ID</th> 
          <th>Title</th>
          <th>Details</th>
          <th>Id</th>
          <th>CreateDate</th>
          <th>Name</th>
          <th>Email</th>
         
         
          
          
       </tr>
       <c:forEach items="${questionList}" var="question" >
          <tr>
             <td>${question.question_id}</td>
             <td>${question.title}</td>
             <td>${question.details}</td> 
             <td>${question.createDate}</td>
             <td>${question.name}</td>
             <td>${question.email}</td>
             
             <td>
         </c:forEach>
    </table>
 
       
    </body>
</html>