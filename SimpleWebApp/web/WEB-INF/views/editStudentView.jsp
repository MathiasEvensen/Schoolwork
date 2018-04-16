<%-- 
    Document   : editStudentView
    Created on : 17.sep.2017, 23:30:56
    Author     : mathi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Edit Student</title>
 </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
 
    <h3>Edit Student</h3>
 
    <p style="color: red;">${errorString}</p>
 
    <c:if test="${not empty useraccount}">
        <form method="POST" action="${pageContext.request.contextPath}/editStudents">
          <input type="hidden" name="user_account_id" value="${useraccount.user_account_id}" />
          <table border="0">
             <tr>
                <td>Id</td>
                <td style="color: red;">${useraccount.user_account_id}</td>
             </tr>
          <tr>
             <td>User Name</td>
             <td><input type="text" name="username" value="${useraccount.userName}" /></td>
          </tr>
          <tr>
             <td>Gender</td>
             <td><input type="text" name="gender" value="${useraccount.gender}" /></td>
          <tr>
              <td>Name</td>
             <td><input type="text" name="name" value="${useraccount.name}" /></td>
          </tr>
          <tr>
              <td>Password</td>
             <td><input type="password" name="password" value="${useraccount.password}" size="20" />
                 <button type="button" id="eye" onclick="if(password.type=='text')password.type='password';
             else password.type='text';"> Show Password
          </tr>
          <tr>
             <td>Email</td>
             <td><input type="text" name="email" value="${useraccount.email}" /></td>
          </tr>
          <tr>
             <td>User type</td>
             <td><input type="text" name="usertype" value="${useraccount.userType}" /></td>
          </tr>
             <tr>
                <td colspan = "2">
                    <input type="submit" value="Submit" />
                    <a href="${pageContext.request.contextPath}/studentList">Cancel</a>
                </td>
             </tr>
          </table>
       </form>
    </c:if>
 </body>
</html>
