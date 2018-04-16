<%-- 
    Document   : forumView
    Created on : 24.okt.2017, 18:15:54
    Author     : ellak
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    
        <style>
            
            
            table {
                border: 1px solid black;
                border-collapse: collapse;
                
                width: 100% 
                
                
                
            }
            
            table, th, td {
                color: #000;
           
            }
            
            table a hover {
                color: #B40E1F;
                text-align: left;
                
            }   
            
            th{
                background-color: #B40E1F;
                color: #F0F0F0;
                padding: 5px;
              
            }
            
            .leftpart {
                width: 60%;
            }
            
            .rightpart {
                width: 40%;
            }
     
       
        </style>
        <title>Forum</title>
     
    </head>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu2.jsp"></jsp:include>
    <body>
        
        <h1>Forums</h1>
        
        <table border = "1">
       
            <tr>
                <th>Category</th>
                
            </tr>
            <td> <a href="${pageContext.request.contextPath}/IS-100">IS-100-1</a> <p></p> Introduksjon til informasjonssystemer</td>
           
            
            <tr>
                <td> <a href="${pageContext.request.contextPath}/IS-104">IS-104-1</a> <p></p> Brukergrensesnitt</td>
                
            </tr>
            
            <tr>
                <td> <a href="${pageContext.request.contextPath}/IS-109">IS-109-1</a> <p></p> Objektorientert programmering 1 </td>
                
            </tr>
            
            <tr>
                <td> <a href="${pageContext.request.contextPath}/IS-111">IS-111-1 </a> <p></p> Introduksjon til systemutviklingsprosjekter </td>
               
            </tr>
        </table>
    </body>
</html>