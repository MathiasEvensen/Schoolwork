<%-- 
    Document   : createTopicView
    Created on : 16.nov.2017, 13:23:03
    Author     : ellak
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Create Question</title>
    </head>
    <body>
        
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu2.jsp"></jsp:include>
        
        <h3>IS-100 forums</h3>
   
    <a href="IS-100">Back to forums</a>
    
    <form method="POST" action="${pageContext.request.contextPath}/createQuestion">
       <table width="500" border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="#000000" >
             
           <td>
        <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
            <tr>
                <td colspan="3" bgcolor="#d1cfcf"><b style="color: #000000;">Create question</b> </td>
            </tr>
            
            <tr>
                <td width="30%" style="text-align: right;"><strong>Title:</strong></td>
                <td width="70%"><input name="title" type="text" value="${Question.title}" size="50" /></td>
            </tr>
            
            <tr>
                <td valign="top" style="text-align: right;"><strong>CreateDate:</strong></td>
                <td><input name="createDate" type="text" value="${Question.createDate}" size="50" /></td>
                
            </tr>
            
            <tr>
                <td style="text-align: right;"><strong>Details:</strong></td>
                <td><textarea name="details" cols="50" rows="5" value="${Question.details}"></textarea></td>
            </tr>
            
            <tr>
                <td style="text-align: right;"><strong>Name:</strong></td>
                <td><input name="name" type="text" value="${Question.name}" size="50" /></td>
            </tr>
            
            <tr>
                <td style="text-align: right;"><strong>Email:</strong></td>
                <td><input name="email" type="text" value="${Question.email}" size="50" /></td>
            </tr>
            <tr>
                <td>
                <td><input type="submit"  value="Add forum" />     
                <a href="questionList">Clear</a>  
                </td>
            </tr>
            
        </table>
               
         </form>
      
                
    </body>
</html>