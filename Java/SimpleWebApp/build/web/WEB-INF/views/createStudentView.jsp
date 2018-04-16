<%-- 
    Document   : createStudentView
    Created on : 17.sep.2017, 22:18:42
    Author     : mathi, Brage
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Create Student</title>
 </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    
    <h3>Create Student</h3>
    
    <p style="color: red;">${errorString}</p>
    
    <form method="POST" action="${pageContext.request.contextPath}/createStudents">
       <table border="0">
          <tr>
              <p style="color: red;">${errorString}</p> 
             <td>Id - autogenerert</td>
             <td><input type="hidden" name="user_account_id" value="${useraccount.user_account_id}" /></td>
          </tr>
          <tr>
             <td>User Name</td>
             <td><input type="text" name="username" value="${useraccount.userName}" /></td>
          </tr>
          <tr>
             <td>User type</td>
             <td><select name="gender" size="2" value="${useraccount.gender}">
              <option>M</option>
              <option>F</option>
              </select>
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
             <td><select name="usertype" size="2" value="${useraccount.userType}">
              <option>ADMIN</option>
              <option>USER</option>
              </select>
                 <%--<input type="text" name="usertype" value="${useraccount.userType}" /></td>--%>
          </tr>
          <tr>
             <td colspan="2">                  
                 <input type="submit" value="Submit" />
                 <a href="studentList">Cancel</a>
             </td>
          </tr>
       </table>
    </form>
 </body>
</html>
