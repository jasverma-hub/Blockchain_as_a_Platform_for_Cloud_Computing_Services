<%-- 
    Document   : AdminLoginCheck
    Created on : 25 Feb, 2021, 11:09:07 AM
    Author     : Ramu Maloth
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
String cloudname = request.getParameter("loginid");
String pswd = request.getParameter("pswd");
if(cloudname.equals("Admin") && pswd.equals("Admin")){
response.sendRedirect("CloudHome.jsp?msg=success");
}else{
response.sendRedirect("CloudLogin.jsp?msg=failed");
}
%>