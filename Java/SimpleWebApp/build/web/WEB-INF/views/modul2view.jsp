<%-- 
    Document   : modulView
    Created on : Sep 24, 2017, 10:35:44 PM
    Author     : Brage
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Modules</title>
 </head>
 <body>
     
 
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
 
    <h3>Leverte moduler</h3>
    
    <table border  ="1">
        
        <br>
        
      
        
        <tr>
            <th>Navn</th>
            <th>Module ID</th>
            <th>UserID</th>
            <th>Last ned fil</th>
            <th>Beskrivelse</th>
            <th>Status</th>
            <th>Poeng</th>
            <th>Åpen kommentar</th>
            <th>Skjult kommentar</th>
            <th> Vurder </th>
        </tr>
            
    <c:forEach items="${moduleFeedbackList}" var="modulefeedback" >
            
          <tr>
             <td>${modulefeedback.name}</td>
             <td>${modulefeedback.module_id}</td>
             <td>${modulefeedback.user_account_id}</td>
             <td><a href="downloadAttachment?attachment_id=${modulefeedback.attachment_id}"><input type="submit" value="Download" name="download" /></a>${modulefeedback.attachment_id}</td>
             <td>${modulefeedback.description}</td>
             <td>${modulefeedback.status}</td>
             <td>${modulefeedback.score}</td>
             <td>${modulefeedback.commentOpen}</td>
             <td>${modulefeedback.commentHidden}</td>
             <td>
                <a href="moduleDetails?module_id=2">Vurder</a>
 
             </td>
             
       </c:forEach>
        
    </table>

 <a href="${pageContext.request.contextPath}/home">Tilbake</a>