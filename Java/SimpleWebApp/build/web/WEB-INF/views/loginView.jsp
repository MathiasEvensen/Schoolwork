<%-- 
    Document   : loginView
    Created on : 17.sep.2017, 20:31:44
    Author     : mathi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Login</title>
 </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
    <%--
    <jsp:include page="_menu.jsp"></jsp:include>
 --%>
    <h3>Login Page</h3>
 
    <p style="color: red;">${errorString}</p>
 
    <form method="POST" action="${pageContext.request.contextPath}/login">
       <table border="0">
          <tr>
             <td>User Name</td>
             <td><input type="text" name="userName" value= "${user.userName}" /> </td>
          </tr>
          <tr>
             <td>Password</td>
             <td><input type="password" name="password" value="${user.password}" size="20" />
         <button type="button" id="eye" onclick="if(password.type=='text')password.type='password';
             else password.type='text';"> Show Password
         </button> 
        </td>
          </tr>
          <tr>
             <td>Remember me</td>
             <td><input type="checkbox" name="rememberMe" value= "Y" /> </td>
          </tr>
          <tr>
             <td colspan ="2">
                <input type="submit" value= "Login" />
                <%--<a href="${pageContext.request.contextPath}/">Cancel</a>
            --%> 
            </td>
          </tr>
       </table>
    </form>
           
             <p style="color:blue;">User Name: tom<br> password: tom001 or <br><br> mette/mette001</p>
             
 </body>
</html>