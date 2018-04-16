<%-- 
    Document   : progressMenuStudentView
    Created on : Dec 10, 2017, 4:24:12 PM
    Author     : Brage
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Progress for student</title>
 </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
 
    <h3>Progress for student</h3>
 
     <table border="1" cellpadding="5" cellspacing="1" >
      
        <tr>
            <th>User ID</th>
            <th>Modul no.</th>
            <th>Status</th>
            <th>Poeng</th>
            <th>Kommentar</th>
            <th>Lukket kommentar</th>
        </tr> 
        <c:forEach items="${feedbackList}" var="feedback" >
            
          <tr>
             <td>${feedback.user_account_id}</td>
             <td>${feedback.module_id}</td>
             <td>${feedback.status}</td>
             <td>${feedback.score}</td>
             <td>${feedback.commentOpen}</td>
             <td>${feedback.commentHidden}</td>
       </c:forEach>
        </table>
 </body>
</html>

    
    
