<%-- 
    Document   : uploadToDBResults
    Created on : 09.des.2017, 01:05:11
    Author     : mathi
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<title>Upload files</title>
</head>
<body>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu2.jsp"></jsp:include>
    <h3>Upload has been done successfully!</h3>
    <a href="${pageContext.request.contextPath}/uploadToDB">Continue Upload</a>
    
    <a href="${pageContext.request.contextPath}/StudentInformation">Tilbake</a>
      
    
</body>
</html>