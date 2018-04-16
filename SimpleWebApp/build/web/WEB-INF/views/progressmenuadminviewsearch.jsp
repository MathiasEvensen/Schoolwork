<%-- 
    Document   : progressmenuview
    Created on : Nov 13, 2017, 8:18:32 PM
    Author     : Brage
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
 <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Progress</title>
 </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>

Progresjon
    
    <br>
    
        <table border="1" cellpadding="5" cellspacing="1" >
       <tr>
          <th>Username</th>
          <th>Name</th>
          
       </tr>
       <c:forEach items="${userAccountList}" var="useraccount" >
          <tr>
             <td>${useraccount.userName}</td>
             
             
            
             <td><a href="ProgressMenuAdminStudent?user_account_id=${useraccount.user_account_id}">${useraccount.name}</a></td>
             
        
             
           
             
             
       </c:forEach>
    </table>
 
    <a href="progressMenuAdmin_1" >Go to search</a>
 </body>
</html>