/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cbchain.actions;

import com.clouds.db.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ramu Maloth
 */
public class UserLoginCheck extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String loginid = request.getParameter("loginid");
        String pswd = request.getParameter("pswd");
        PreparedStatement ps = null;
        ResultSet rs = null;
        try (Connection con = DBConnection.getDBConnection()) {
            String sqlQuery = "select status,email from registrations where loginid=? and pswd = ?";
            ps = con.prepareStatement(sqlQuery);
            ps.setString(1, loginid);
            ps.setString(2, pswd);
            rs = ps.executeQuery();
            if(rs.next()){
            String status =rs.getString("status");
            String email = rs.getString("email");
            if (status.equalsIgnoreCase("Activated")){
                HttpSession hs = request.getSession();
                hs.setAttribute("userid", loginid);
                hs.setAttribute("email", email);
            response.sendRedirect("UserHome.jsp?msg=success");
            }else if(status.equalsIgnoreCase("waiting")){
                response.sendRedirect("UserLogin.jsp?msg=notactivated");
            }
            }else{
            response.sendRedirect("UserLogin.jsp?msg=failed");
            }
            
        }catch(Exception ex){
            System.out.println("Error at user Login"+ex.getMessage());
            response.sendRedirect("UserLogin.jsp?msg=notactivated");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
