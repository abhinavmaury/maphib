package com.maphiber.MapImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.maphiber.Dao.NearbyDAO;

import com.maphiber.Pojo.Near;

@WebServlet("/Nearby")
public class Nearby extends HttpServlet {

		private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
  	
		res.setContentType("text/html");
		 PrintWriter out = res.getWriter();
		String name = req.getParameter("name");

			
			Near near = NearbyDAO.namesJson(name);

			double lat = near.getLat();
			double lng = near.getLng();
			req.setAttribute("lat", lat);
			req.setAttribute("lng", lng);
			req.getRequestDispatcher("nearby.jsp").forward(req, res);
			 System.out.println("success");
			 out.close();
	}
}
