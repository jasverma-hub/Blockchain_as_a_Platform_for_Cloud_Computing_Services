<%-- 
    Document   : logout
    Created on : 12 Apr, 2021, 10:16:37 AM
    Author     : Ramu Maloth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        session.invalidate();
        response.sendRedirect("index.jsp");
        
        %>
    </body>
</html>
