<%-- 
    Document   : is111View
    Created on : 13.nov.2017, 15:58:17
    Author     : ellak
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Forum</title>
        <style>
            
            table{
                border: 2px solid black;
                border-collapse: collapse;
                width: 100%
            
            }
       
        </style>
    </head>
    <body>
        
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu2.jsp"></jsp:include>

    
        <h3>IS-100 forums</h3>
        
        <table border ="1">
            <th>QuestionID</th>
            <th>Question</th>
            <th>Name</th>
            <th>CreateDate</th>
            <th>View</th>
            <th>Reply</th>
            
            
            </tr>
            <td>001</td>
            <td> <a href="${pageContext.request.contextPath}/">How to write a good group contracts? </td>
            <td>Mette</td>
            <td>2017.11.13 <p>16:12:24</p> </td>
            <td>0</td>
            <td>0</td>
            
            <tr>
                <td>002</td>
                <td> <a href="${pageContext.request.contextPath}/">What is Scrum?</a></td>
                <td>Tom</td>
                <td>2017.11.13 <p>15:37:54</p> </td>
                <td>0</td>
                <td>0</td>
                
            </tr>
            
            <tr>
                <td>003</td>
                <td> <a href="${pageContext.request.contextPath}/">How many programming languages are there in the world? </td>
                <td>Vegar</td>
                <td>2017.11.13 <p>15:12:24</p> </td>
                <td>0</td>
                <td>0</td>
                
            </tr>
            
            <tr>
                <td>004</td>
                <td> <a href="${pageContext.request.contextPath}/">What is software engineering?</td>
                <td>Joakim</td>
                <td>2017.11.13 <p>15:12:04</p> </td>
                <td>0</td>
                <td>0</td>
            </tr>
        </table>
                <a href="${pageContext.request.contextPath}/studentForum">Back to previous</a>
                <a href="${pageContext.request.contextPath}/">Next>></a>
            
       
    </body>
</html>