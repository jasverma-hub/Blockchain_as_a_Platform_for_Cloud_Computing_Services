/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.clouds.db;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Ramu Maloth
 */
public class DBConnection {
    
    public static Connection con = null;    
    
    public static Connection getDBConnection(){    
        try {
            //DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/secureblckcloud","root","root");
            if(con!=null){
            return con;
            }
        } catch (Exception e) {
            System.out.println("Error at DBConnection "+e.getMessage());
        }
        return con;
    }
    
}
