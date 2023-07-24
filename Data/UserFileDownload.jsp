<%-- 
    Document   : UserFileDownload
    Created on : 12 Apr, 2021, 1:09:38 PM
    Author     : Ramu Maloth
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@page import="com.clouds.db.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Blob image = null;
    Connection con = null;
    byte[] imgData = null;
    Statement stmt = null;
    ResultSet rs = null;
    int fid = Integer.parseInt(request.getParameter("id"));
    String fileName=null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con =DriverManager.getConnection("jdbc:mysql://localhost:3306/secureblckcloud","root","root");
        stmt = con.createStatement();
        rs = stmt.executeQuery("select filedata,originalname from cloudfiles where id = '"+fid+"'");
        if (rs.next()) {
            image = rs.getBlob(1);
            imgData = image.getBytes(1, (int) image.length());
            fileName = rs.getString("originalname");
        } else {
            out.println("Display Blob Example");
            out.println("image not found for given id>");
            return;
        }
// display the image
        //response.setContentType("image/jpg");
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment;filename="+fileName);
        OutputStream o = response.getOutputStream();
        o.write(imgData);
        o.flush();
        o.close();
    } catch (Exception e) {
        out.println("Unable To Display image");
        out.println("Image Display Error=" + e.getMessage());
        return;
    } finally {
        try {
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
