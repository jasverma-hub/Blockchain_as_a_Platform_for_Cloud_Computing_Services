/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cbchain.utility;

import com.clouds.db.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Ramu Maloth
 */
public class CheckUserPurchase {
    private ResultSet rs= null;
    private PreparedStatement ps =null;
    
    public boolean checkBuyingStatus(int fileid,String username){
    boolean flag = false;
        try(Connection con = DBConnection.getDBConnection()) {
            String sqlQuery = "select count(*) from trnxdetails where fileid=? and loginuser=?";
            ps = con.prepareStatement(sqlQuery);
            ps.setInt(1, fileid);
            ps.setString(2, username);
            rs = ps.executeQuery();
            rs.next();
            int no = rs.getInt(1);
            if(no>0){
            flag =true;
            }else{
            flag = false;
            }
            
        } catch (Exception e) {
            System.out.println("Error at Checking Purchase Details");
        }
    return flag;
    }
    
}
