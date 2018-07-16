package com.maphib;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class HistoryDAO {
 
	public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/maphib", "root", "root");  
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  
	
	public static int save(Hist h){  
        int status=0;  
        Timestamp now = new Timestamp(new java.util.Date().getTime());
        try{  
            Connection con=HistoryDAO.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into history(places, timestamp) VALUES (?, ?)");  
            ps.setString(1,h.getPlace());  
            ps.setTimestamp(2, now);
            
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
	
	 public static List<Hist> getAllEmployees(){  
	        List<Hist> list=new ArrayList<Hist>();  
	          
	        try{  
	            Connection con=HistoryDAO.getConnection();  
	            PreparedStatement ps=con.prepareStatement("select * from history ORDER BY timestamp DESC");  
	            ResultSet rs=ps.executeQuery();  
	            while(rs.next()){  
	                Hist h=new Hist();  
	                h.setIdhistory(rs.getInt(1));
	                h.setPlace(rs.getString(2));
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return list;  
	    }  
 
}