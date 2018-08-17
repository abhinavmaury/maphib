package com.maphiber.Dao;

import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session; 
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata; 
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration; 

import com.maphiber.Pojo.Hist; 

public class HistoryDAO {
	public static int save(Hist h){  
		int status =0;
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();  
	    Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();  

		
	    SessionFactory factory = meta.getSessionFactoryBuilder().build();  
	    Session session = factory.openSession();  
	    Transaction t = session.beginTransaction();   

		try {
			session.save(h);
			status = 1;
			 t.commit(); 
			 session.close();
		} catch(HibernateException exception){
		     System.out.println("Problem creating session factory");
		     exception.printStackTrace();
		}
		 return status;
	    
    }
	
	 public static List<Hist> getAllHistory(){  

		 Session session=new Configuration().configure("hibernate.cfg.xml")  
                 .buildSessionFactory().openSession();  
	        
	          Query query = session.createQuery("from Hist ORDER BY date DESC");
	          List<Hist> list=query.list();
	          System.out.println("in history dao");
	          System.out.println(list.toString());
	          
	        return list;  
	    }  
}









































/*package com.maphiber.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.maphiber.Pojo.Hist;

public class HistoryDAO {
 
	public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mysql://localhost:33060/maphib", "root", "root");  
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }
	
	public static int save(Hist h){  
        int status=0;  
        Timestamp now = new Timestamp(new java.util.Date().getTime());
        String statement = "insert into history(places, timestamp) VALUES (?, ?)";
        try{  
            Connection con=HistoryDAO.getConnection();  
            PreparedStatement ps=con.prepareStatement(statement);  
            ps.setString(1,h.getPlace());  
            ps.setTimestamp(2, now);
            
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
	
	 public static List<Hist> getAllHistory(){  
	        List<Hist> list=new ArrayList<Hist>();  
	          String statement = "select * from history ORDER BY timestamp DESC";
	        try{  
	            Connection con=HistoryDAO.getConnection();  
	            PreparedStatement ps=con.prepareStatement(statement);  
	            ResultSet rs=ps.executeQuery();  
	            while(rs.next()){  
	                Hist h=new Hist();  
	                h.setIdhistory(rs.getInt(1));
	                h.setPlace(rs.getString(2));
	            }  
	            con.close();  
	        }catch(Exception e){
	        	System.out.println("Error accessing from database! ");
	        	e.printStackTrace();
	        	}  
	          
	        return list;  
	    }  
 
}*/