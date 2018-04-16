<%-- 
    Document   : userInfoView
    Created on : 17.sep.2017, 20:37:55
    Author     : mathi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>User Info</title>
 </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu2.jsp"></jsp:include>
     
   
    
    <h3>Hello: <p style="color: red;">${user.name}</p></h3>
    <table border="1" cellpadding="5" cellspacing="0" >
    <tr>
          <th>User Name</th>
          <th>ID</th>
          <th>Type of user</th>
    </tr>
    
    <tr>
        <td>${user.userName}</td>
        <td>${user.user_account_id}</td>
        <td>${user.userType}</td>
    </tr>
    </table>
    <br>
    <%--
    User Name: <b>${user.userName}</b>
    <br>
    Gender: ${user.gender}
    <br>
    Name: <b>${user.name}</b>
    <br>
    Type of user: ${user.userType}
    <br>
--%>
    <a href="${pageContext.request.contextPath}/Snake.jsp">Snake</a>
 </body>
</html>