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
    <jsp:include page="_menu2.jsp"></jsp:include>

    

      
       
        Oversikt over <b>${user.userName}</b>'s progresjon <b>${id.id}</b>
                
    
    <br>
    
   <table border="1" cellpadding="5" cellspacing="1" >
      
        <tr>
            <th>Modul no.</th>
            <th>Status</th>
            <th>Poeng</th>
            <th>Kommentar</th>
        </tr>

            <c:forEach items="${feedbackList}" var="feedback" >
                
          <tr>
             <td>${feedback.module_id}</td>
             <td>${feedback.status}</td>
             <td>${feedback.score}</td>
             <td>${feedback.commentOpen}</td>
        
       </c:forEach>
         </table> 
    
    </body>
</html>
