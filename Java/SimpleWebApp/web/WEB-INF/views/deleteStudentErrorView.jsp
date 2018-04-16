<%-- 
    Document   : deleteStudentErrorView
    Created on : 18.sep.2017, 00:03:57
    Author     : mathi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
 </head>
 
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    
    <h3>Delete Student</h3>
    
    <p style="color: red;">${errorString}</p>
    <a href="studentList">Student List</a>
   
 </body>
</html>