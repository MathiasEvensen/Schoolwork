<%-- 
    Document   : modulView
    Created on : Sep 24, 2017, 10:35:44 PM
    Author     : jonas
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Modules</title>
    <link href="Main.css" rel="stylesheet" type="text/css">
 </head>
 <body>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
     
     <h3 style="margin-left: 25px; font-family: Helvetica; text-decoration: underline;">Modules Overview</h3>
    
     <table style="border-collapse:collapse; margin-left: 25px;" class="tables">
         <tr>
             <th>ID</th>
             <th>Name</th>
             <th>Delivery Date</th>
             <th>Edit</th>
             <th>Delete</th>
         </tr>
        <c:forEach items="${moduleList}" var="module">
         <tr>
             <td><a href="moduleDetails?module_id=${module.module_id}">${module.module_id}</td>
             <td>${module.module_name}</td>
             <td>${module.delivery_date}</td>
             <td>
                 <a href="editModule?module_id=${module.module_id}">Edit</a>
             </td>
             <td>
                 <a href="deleteModule?module_id=${module.module_id}">Delete</a>
             </td>
         </tr>
        </c:forEach>
     </table>
     <p></p>
     <button style="margin-left: 25px;"><a href="createModule" class="createModule">Create Module</a></button> 
     </body>
 </html>