<%-- 
    Document   : newCreateTopic
    Created on : 20.nov.2017, 18:05:36
    Author     : ellak
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Forum Info</title>
    </head>
    <body>
        
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu2.jsp"></jsp:include>
    
    <h3>Forum Info:</h3>
    
    <h3>Your post has been sucess! <p style="color: red;">${question.name}</p></h3>
    <table border="1" cellpadding="4" cellspacing="0" >
    <tr>
          <th>Title</th>
          <th>ID</th>
          <th>Name</th>
          <th>Email</th>
    </tr>
    
    <tr>
        <td>${question.title}</td>
        <td>${question.question_id}</td>
        <td>${question.name}</td>
        <td>${question.email}</td>
    </tr>
    </table>
    <br>
  
    </body>
</html>