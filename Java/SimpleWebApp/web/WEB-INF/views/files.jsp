<%-- 
    Document   : studentsListView
    Created on : 10.dec.2017, 19:52:27
    Author     : mathi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Files</title>
 </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
 
    <h3>Files</h3>
 
    <p style="color: red;">${errorString}</p>
 
    <table border="1" cellpadding="5" cellspacing="1" >
       <tr>
          <th>ID</th>
          <th>File Name</th>
          <th>Description</th>
          <th>Download</th>
          <th>Delete</th>
          
       </tr>
       <c:forEach items="${filesList}" var="file" >
          <tr>
             <td>${file.id}</td>
             <td>${file.fileName}</td> 
             <td>${file.description}</td>
             <td>
                 <a href="downloadAttachment?attachment_id=${file.id}"><input type="submit" value="Download" name="download" /></a>
             </td>
             <td>
                 <a href="deleteFiles?attachment_id=${file.id}"><input type="submit" value="Delete" name="delete" /></a>
             </td>
             
       </c:forEach>
    </table>
 </body>
</html>