<%-- 
    Document   : AdminDeleteFile
    Created on : 27 Mar, 2021, 4:45:43 PM
    Author     : Ramu Maloth
--%>

<%@page import="com.clouds.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id  = Integer.parseInt(request.getParameter("id"));
            PreparedStatement ps = null;
            ResultSet rs = null;
            int count = 0;
            try (Connection con = DBConnection.getDBConnection()) {
                String sqlQuery = "delete from cloudfiles where id = ?";
                ps = con.prepareStatement(sqlQuery);
                ps.setInt(1, id);
                ps.executeUpdate();
                response.sendRedirect("AdminViewFiles.jsp?msg=Deleted");
                }catch(Exception ex){
                                     System.out.println("Error at Deleteing FIle users "+ex.getMessage());
                                     }
        %>



    </body>
</html>
