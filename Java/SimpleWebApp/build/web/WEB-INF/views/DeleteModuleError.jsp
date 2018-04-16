<%-- 
    Document   : DeleteModuleError
    Created on : 11.des.2017, 04:11:23
    Author     : jonas
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Delete Module</title>
 </head>
 
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    
    <h3>Delete Module</h3>
    
    <p style="color: red;">${errorString}</p>
    <a href="moduleList">Module List</a>

 </body>
</html>