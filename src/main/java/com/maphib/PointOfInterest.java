package com.maphib;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
	@WebServlet("/PointOfInterest")
public class PointOfInterest extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
  	
   	
		String latitude = req.getParameter("lat");
		String longitude = req.getParameter("lng");
		String loc = req.getParameter("loc");
		try {
			
			PoiDAO.namesJson(latitude,longitude,loc);
			 PrintWriter out = res.getWriter();
			 req.getRequestDispatcher("maphib/Test4.jsp");
		} catch (Exception e) {
			
			req.getRequestDispatcher("maphib/Test4.jsp");
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
			       }
}
	/*public static String readJsonFromUrl(String url) throws IOException, JSONException {
		  InputStream is = new URL(url).openStream();
		  try {
		    BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
		    String jsonText = readAll(rd);
		    JSONObject json = new JSONObject(jsonText);
		    return json;
		  } finally {
		    is.close();
		}
		}
		private static String readAll(Reader rd) throws IOException {
			  
			  
			  
		    StringBuilder sb = new StringBuilder();
		    int cp;
		    while ((cp = rd.read()) != -1) {
		      sb.append((char) cp);
		    }
		    return sb.toString();
		  }
}
*/




























/*import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdk.nashorn.internal.parser.JSONParser;
import java.net.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.io.*;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Iterator;



import org.json.*;
import org.json.simple.JSONObject;

import javax.persistence.Enumerated;
import javax.servlet.RequestDispatcher;

@WebServlet("/PointOfInterest")
public class PointOfInterest extends HttpServlet {
    public PointOfInterest() {
        super();
        // TODO Auto-generated constructor stub
    }

	*//**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String url  = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=delhi+point+of+interest&language=en&key=AIzaSyDUpNztopmXQeH5D-fhkhVRQ_jGyP7Gy7A";    	
	   	String responseData = getUrlContents(url);
	   	JSONParser parse = new JSONParser();
	   	JSONObject jobj;
	   	try {
	jobj = (JSONObject)parse.parse(responseData);
	Poi.save(jobj);
	response.sendRedirect("/Project1/index.jsp");


	} catch (org.json.simple.parser.ParseException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
	       }

	private String getUrlContents(String url) {
		// TODO Auto-generated method stub
		return null;
	}

}
*/