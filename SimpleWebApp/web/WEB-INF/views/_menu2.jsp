<%-- 
    Document   : _menu2
    Created on : 12.des.2017, 16:51:32
    Author     : mathi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    
<style>  
    @font-face {
    font-family: "brandon";
    src: url(font/Brandon.otf);
    }
    
    .menu{
        font-family: brandon;
    }
    .menu ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #171e21;
    box-shadow: 0px 3px 5px gray;
    }
    
    .menu li {
    float: left;
    }
    
    .menu li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    }
    
    .menu li a:hover {
    background-color: #444444;
    }
    
    .logoutbutton {
        margin-left: 30cm;
        font-size: 18px;
        background-color: #355C7D
    }
    
</style>

<div class="menu" style="padding: 5px;">
    <ul>
        <li><a href="${pageContext.request.contextPath}/StudentInformation">My Account Info</a></li>
     <%--
   <a href="${pageContext.request.contextPath}/login">Login</a>
|
   <a href="${pageContext.request.contextPath}/modules">Modules</a>
   |--%>
   <li><a href="${pageContext.request.contextPath}/progressMenus2">My Progression</a></li>
   
   <li><a href="${pageContext.request.contextPath}/uploadToDB">Upload</a></li>
     
   <li><a href="${pageContext.request.contextPath}/Blog">Blog</a></li>
   
   <li><a href="${pageContext.request.contextPath}/Calendars2">Calendar</a></li>
   
   <li><a href="${pageContext.request.contextPath}/studentForum">Forum</a></li>
   
   <li><a class="logoutbutton" href="logout.jsp"/>LOGOUT</a></li>
    </ul>
   
   
</div>  