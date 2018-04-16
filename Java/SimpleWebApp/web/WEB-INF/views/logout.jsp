<%-- 
    Document   : logout
    Created on : 08.okt.2017, 22:14:15
    Author     : mathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
session.invalidate();
response.sendRedirect("/SimpleWebApp");
%>
