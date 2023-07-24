/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cbchain.actions;

import com.clouds.db.DBConnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Ramu Maloth
 */
@MultipartConfig
public class AdminUploadAction extends HttpServlet {

       @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fileusername = request.getParameter("filename");
        String filetype = request.getParameter("filetype");
        String category = request.getParameter("category");
        Part part = request.getPart("file");
        InputStream is = part.getInputStream();
        long size = part.getSize();
        float []price = {150.5f,248.2f,358.6f,340f,680f,785f,950f,964f,452f,214f,114f,364f,587f,965f,741f,521f,471f,480f,891f,365f,541f,851f,1500f};
        int rnd = new Random().nextInt(price.length);
        String originalFilename = part.getSubmittedFileName();
        PreparedStatement ps = null;
           try(Connection con = DBConnection.getDBConnection()) {
               String sqlQuery = "insert into cloudfiles(filename,filetype,category,filezie,originalname,filedata,cdate,price) values(?,?,?,?,?,?,?,?)";
               java.sql.Date cDate = new java.sql.Date(new java.util.Date().getTime());
               //String c_date = cDate.toString();
               ps = con.prepareStatement(sqlQuery);
               ps.setString(1, fileusername);
               ps.setString(2, filetype);
               ps.setString(3, category);
               ps.setLong(4, size);
               ps.setString(5, originalFilename);
               ps.setBinaryStream(6, is);
               ps.setDate(7, cDate);
               ps.setFloat(8, price[rnd]);
               ps.executeUpdate();
               response.sendRedirect("AdminUploadData.jsp?msg=success");
               
           } catch (Exception e) {
               System.out.println("Error at uploading File "+e.getMessage());
           }
   
        
        
        
        
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
