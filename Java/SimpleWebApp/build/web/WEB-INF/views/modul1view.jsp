<%-- 
    Document   : display
    Created on : Oct 7, 2017, 10:33:08 AM
    Author     : Brage
--%>

<%@page language="java"  contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>

<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Søk etter student</title>
    </head>
        <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    
    <h3>Module 1. Godkjenning</h3>
    
    <table border = "1">
         <tr>
            <th>Module no.</th>
            <th>Learning Goals</th>
         </tr>
    
           <tr>
            <td>1 </td>
            <td>Opprette, åpne og lagre et prosjekt i BlueJ</td>
         </tr>
         
      </table>
    


<a href="${pageContext.request.contextPath}/modules">Tilbake</a>
               
                <br></br>
               
                    <p style="color: red;">${errorString}</p>
    
    <form method="POST" action="${pageContext.request.contextPath}/modul1">
       <table border="0">
                
               <table border="1">
                   
                     <tr>
                       <td>Hvem vurderer du?</td>                      
                     <td><input type="text" name="name" value="${user_account.name}" /></td>  
                         <%--     <td><input type="text" name="user_account_id" value="${feedback.user_account_id}" /></td>  --%>  

                   </tr>
                                      <tr>
                                          <td>Er modulen godkjent?</td>               
                    <td><select name="status" size="2" value="${feedback.status}">
              <option>Godkjent</option>
              <option>Ikke godkjent</option>
              </select>
               
                   <tr>
                       <td>Hvor mange poeng vil du gi</td>                      
                    <td><input type="number" min="1" max="10" name="score" value="${feedback.score}" /></td>
                   </tr>
                   
                   <tr>
                       <td>Åpen kommentar</td>
                       <td><input type="text" name="commentOpen" value="${feedback.commentOpen}" /></td>
                     
                   </tr>
                   
                     <tr>
                       <td>Skjult kommentar</td>
                       <td><input type="text" name="commentHidden" value="${feedback.commentHidden}" /></td>
                     
                   </tr>
                   
                        <tr>
                       <td>Module no.</td>
                       <td><input type="text" name="module_id" value="${feedback.module_id}" /></td>
                     
                   </tr>
                          <td colspan="2">                  
                 <input type="submit" value="submit" />
                <a href="${pageContext.request.contextPath}/modules">Cancel</a>
           
        </table>
             
           
                    
             