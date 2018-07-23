package com.maphib;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;  
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * Servlet implementation class History
 */
@WebServlet("/History")
public class History extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public History() {
        super();
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		 String place = req.getParameter("place");
	        new Timestamp(new java.util.Date().getTime());
	        
	        Hist h = new Hist();
	        h.setPlace(place);
	        
	        PrintWriter out = res.getWriter();
	        int status = HistoryDAO.save(h);  
	        if(status>0){  
	            
	            req.getRequestDispatcher("index.html").include(req, res);  
	        }else{  
	        	req.getRequestDispatcher("history.jsp").include(req, res); 
	        }  
	        out.close();  
	}

}