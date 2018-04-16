<%-- 
    Document   : CreateModule
    Created on : 08.des.2017, 22:41:46
    Author     : jonas
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Module</title>
        <link href="Main.css" rel="stylesheet" type="text/css">
    </head>
    <body>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    
    <p style="color: red;">${errorString}</p>
    
    <form method="POST" action="${pageContext.request.contextPath}/createModule">
        <table style="border-collapse: collapse; margin: 25px 0px 0px 25px;" class="opprettStudent" border="0">
            <tr>
                <th colspan="2"> Create Module</th>
            </tr>
            <tr>
                <p style="color: red;">${errorString}</p>
                <td>Module Name</td>
                <td><input required style="width: 400px;" type="text" name="module_name" value="${module.module_name}" /></td>
            </tr>
            <tr>
                <td>Delivery Date</td>
                <td><input required style="width: 400px;" type="datetime-local" name="delivery_date" value="${module.delivery_date}" /></td>
            </tr>
            <tr>
                <td>Description</td>
                <td><textarea required style="width: 400px; height: 140px;" type="text" name="description" value="${module.description}"/></textarea></td>
            </tr>
            <tr>
                <td>Learning Goals</td>
                <td><textarea required style="width: 400px; height: 140px;" type="text" name="learningGoals" value="${module.learningGoals}"/></textarea></td>
            </tr>
            <tr>
                <td>Resources</td>
                <td><textarea style="width: 400px; height: 140px;" type="text" name="resources" value="${module.resources}"/></textarea></td>
            </tr>
            <tr>
                <td style="background-color:#355C7D;" colspan="2">
                    <input type="submit" value="Submit"/>&nbsp;&nbsp;
                    <button><a href="modules">Cancel</a></button>
            </tr>
        </table>
      </form>
    </body>    
</html>