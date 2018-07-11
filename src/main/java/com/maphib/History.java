package com.maphib;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
//import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * Servlet implementation class History
 */
//@WebServlet("/uploadServlet")
public class History extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public History() {
        super();
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		 res.setContentType("text/html");
		 int flag = 0;
	        String n;
	        
	        String place = req.getParameter("places");
	        
	        InputStream is = null;
	        
	        PrintWriter out = res.getWriter();
	        out.print("<html><body>");
	        out.print("<b>Servlet Started</b>");
	      
	        try{
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/maphib", "root", "root");
	            if(!con.isClosed()){
	                System.out.println("Connected to mmmMySQL");
	            
	                Statement stmt=con.createStatement();  
	                stmt.executeUpdate("create table if not exists history(idhistory int(10) NOT NULL AUTO_INCREMENT, places varchar(45), PRIMARY KEY(idhistory))");
	                String sql = "insert into history (places) VALUES (?)";
	                PreparedStatement pst = con.prepareStatement(sql);
	                pst.setString(1, place);
	                
	                int i = pst.executeUpdate();
	                if(i > 0){
	                        HttpSession session = req.getSession(true);
	                        session.setMaxInactiveInterval(300);
	                        res.sendRedirect("history.jsp");
	                }
	                else{
	                        RequestDispatcher rd = req.getRequestDispatcher("map.jsp");
				rd.include(req, res);
	                }
	                out.print("<p>Place successfully added.</p>");
	            }
	            con.close();
	        }catch(ClassNotFoundException c){
	            System.out.println(c);
	        }
	        catch(Exception e){
	            System.out.println(e);
	        }
	       out.print("</body></html>");
	}

}
