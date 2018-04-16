<%-- 
    Document   : progressmenuview
    Created on : Nov 13, 2017, 8:18:32 PM
    Author     : Brage
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
 <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Progress</title>
 </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>

    

      
       
    <h3> Oversikt over alle studenters progresjon </h3>
        
        
        
         <form method="GET" action="${pageContext.request.contextPath}/ProgressMenuAdminSearch">
          <table border="0">
              
              <tbody>
                  <tr>
                      <td>Studentsøk: </td>
                      <td> <input type="text" name="name" value="${useraccount.name}" size="50" /> </td>
                  </tr>
              </tbody>
          </table>
          &nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;
          <input type="submit" value="Submit" /> 
      </form>

      
     
    
    <textarea name="txtReason" id="txtReason" style="display: none;" class="textboxmulti">

</textarea>
    
    <br>
    
        <table border="1" cellpadding="5" cellspacing="1" >
       <tr>
          <th>Username</th>
          <th>Name</th>
          
       </tr>
       <c:forEach items="${userAccountList}" var="useraccount" >
          <tr>
             <td>${useraccount.userName}</td>
             
             
            
             <td><a href="ProgressMenuAdminStudent?user_account_id=${useraccount.user_account_id}">${useraccount.name}</a></td>
             
        
             
           
             
             
       </c:forEach>
    </table>
 
    <a href="home" >Go Home</a>
 </body>
</html>
