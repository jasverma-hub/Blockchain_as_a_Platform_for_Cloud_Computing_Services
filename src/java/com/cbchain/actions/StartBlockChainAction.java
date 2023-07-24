/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cbchain.actions;

import com.cbchain.blcks.Block;
import com.cbchain.blcks.StartNode;
import com.clouds.db.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ramu Maloth
 */
public class StartBlockChainAction extends HttpServlet {

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
        
        // Transaction Details 
        String loginuser = request.getParameter("loginuser").trim();
        int fileId = Integer.parseInt(request.getParameter("cloudfileid").trim());
        String mobile = request.getParameter("mobile").trim();
        String email = request.getParameter("email").trim();
        String nameoncard = request.getParameter("nameoncard").trim();
        float price = Float.parseFloat(request.getParameter("totalamount").trim());
        
        String cardnumber = request.getParameter("cardnumber").trim();
        String cvv = request.getParameter("cvv").trim();
        String cardexpiry = request.getParameter("cardexpiry").trim();
        String blkplatform = request.getParameter("blkplatform").trim();
        
        String msg= loginuser+" sending "+price+ " to "+blkplatform;
        
        //StartBlockTransactionUtil sbu = new StartBlockTransactionUtil();        
        //sbu.startProcess(Float.parseFloat(totalamount));
        PreparedStatement ps = null;
        try(Connection con = DBConnection.getDBConnection()){
            
            String trnxQuery = "insert into trnxdetails(loginuser,fileid,nameoncard,price,cardnumber,cvv,cardexpiry,blkplatform) values(?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(trnxQuery);
            ps.setString(1, loginuser);
            ps.setInt(2,fileId);
            ps.setString(3, nameoncard);
            ps.setFloat(4, price);
            ps.setString(5, cardnumber);
            ps.setString(6, cvv);
            ps.setString(7, cardexpiry);
            ps.setString(8, blkplatform);
            ps.executeUpdate();
            StartNode sn = new StartNode();
        ArrayList<Block> blockchain = sn.startProcess(msg);
       
        
        int size = blockchain.size();
        Block b = null;
        if(size==1){
         b = blockchain.get(0);
        }else{
         b = blockchain.get(blockchain.size() - 1);
        }
        String sqlBlk = "insert into blockchain(loginuser,currenthash,previoushash,data,trnstimestamp,nonce) values(?,?,?,?,?,?)";
        PreparedStatement ps1 = con.prepareStatement(sqlBlk);
        ps1.setString(1, loginuser);
        ps1.setString(2, b.getHash());
        ps1.setString(3, b.getPreviousHash());
        ps1.setString(4, b.getData());
        ps1.setLong(5, b.getTimeStamp());
        ps1.setInt(6, b.getNonce());
        ps1.executeUpdate();
        request.setAttribute("block", blockchain);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/UserTransactionDetails.jsp");
		rd.forward(request, response);
        }catch(Exception ex){
            System.out.println("Exception at Trabsactions "+ex.getMessage());
            ex.printStackTrace();
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
