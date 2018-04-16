<%-- 
    Document   : BlogPost
    Created on : 24.okt.2017, 12:21:34
    Author     : evakristine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog post</title>
        <style>

        </style>


    </head>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
        <body>

            <h1>Blog post:</h1>


            <h2>Your post has been saved in "Your posts"</h2> 
            <p
        </p>
        
        <a href="${pageContext.request.contextPath}/BlogListView">Your posts</a>

    <a href="${pageContext.request.contextPath}/Blog"> Cancel</a>

</body>
</html>