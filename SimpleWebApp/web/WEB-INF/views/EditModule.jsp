<%-- 
    Document   : EditModule
    Created on : 10.des.2017, 22:52:45
    Author     : jonas
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Edit Module</title>
      <link href="Main.css" rel="stylesheet" type="text/css">
   </head>
   <body>
 
      <jsp:include page="_header.jsp"></jsp:include>
      <jsp:include page="_menu.jsp"></jsp:include>
 
          <h3 style="margin-left: 25px; font-family: Helvetica; text-decoration: underline;">Edit Module</h3>
          
      <p style="color: red;">${errorString}</p>
      
      <%--Sjekker om en lsiten er tom--%>
      <c:if test="${not empty module}">
       
         <form method="POST" action="${pageContext.request.contextPath}/editModule">
            <input type="hidden" name="module_id" value="${module.module_id}" />
            <table style="border-collapse: collapse; margin: 25px 0px 0px 25px;" class="opprettStudent" border="0">
               <tr>
                  <td style="vertical-align: top; text-align: left;">Module ID</td>
                  <td style="color:red;">${module.module_id}</td>
               </tr>
               <tr>
                  <td style="vertical-align: top; text-align: left;">Module Name</td>
                  <td><input style="width: 450px;" type="text" name="module_name" value="${module.module_name}" /></td>
               </tr>
               <tr>
                  <td style="vertical-align: top; text-align: left;">Delivery Date</td>
                  <td><input style="width: 450px;" type="datetime-local" name="delivery_date" value="${module.delivery_date}" /></td>
               </tr>
               <tr>
                  <td style="vertical-align: top; text-align: left;">Description</td>
                  <td><textarea style="width: 450px; height: 140px;" type="text" name="description">${module.description}</textarea></td>
               </tr>
               <tr>
                  <td style="vertical-align: top; text-align: left;">learningGoals</td>
                  <td><textarea style="width: 450px; height: 140px;" type="text" name="learningGoals">${module.learningGoals}</textarea></td>
               </tr>
               <tr>
                  <td style="vertical-align: top; text-align: left;">Resources</td>
                  <td><textarea style="width: 450px; height: 140px;" type="text" name="resources">${module.resources}</textarea></td>
               </tr>
               <tr>
                  <td style="background-color:#355C7D;" colspan = "2">
                      <input type="submit" value="Submit"/>&nbsp;&nbsp;
                      <button><a href="${pageContext.request.contextPath}/modules">Cancel</a></button>
                  </td>                     
               </tr>
            </table>
          </form>          
      </c:if> 
   </body>
</html>