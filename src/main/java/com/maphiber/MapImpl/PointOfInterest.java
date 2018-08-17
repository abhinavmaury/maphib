package com.maphiber.MapImpl; 
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.maphiber.Dao.PoiDAO;

import com.maphiber.Pojo.Location;
import com.maphiber.Pojo.Poi;
	@WebServlet("/PointOfInterest")
public class PointOfInterest extends HttpServlet {

		private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
  	
		res.setContentType("text/html");
		 PrintWriter out = res.getWriter();
		String latitude = req.getParameter("lat");
		String longitude = req.getParameter("lng");
		String type = req.getParameter("type");

			
			Poi  poi = PoiDAO.namesJson(latitude,longitude,type);
			Map<String, Location> name = poi.getName();
			req.setAttribute("name", name);
			req.getRequestDispatcher("pointOfInterest.jsp").forward(req, res);
			 System.out.println("success");
			 out.close();
	}
	}