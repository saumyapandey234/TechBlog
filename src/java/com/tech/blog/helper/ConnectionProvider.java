
package com.tech.blog.helper;
import java.sql.*;

public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection(){
        try{
            if(con==null){
                String url = System.getenv("DB_URL");
//                String url = '';
                Class.forName("com.mysql.cj.jdbc.Driver");
                con=DriverManager.getConnection(url);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
    
}
