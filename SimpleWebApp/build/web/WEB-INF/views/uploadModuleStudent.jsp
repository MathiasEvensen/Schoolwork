<%-- 
    Document   : uploadModuleStudent
    Created on : Dec 12, 2017, 12:49:18 PM
    Author     : Mr.Schibbye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Upload</title>
 </head>
 <body>
 <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    
    <p style="color: red;">${errorString}</p>

    <form method="POST" action="${pageContext.request.contextPath}/uploadModuleStudents">
       <table border="0">
           
           <tr>

          <th>ID</th>
          
    </tr>
           
          <tr>
              <p style="color: red;">${errorString}</p> 
             <td>${user.user_account_id}</td>
          </tr>
          
       </table>
    </form>