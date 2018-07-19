package com.mapshib;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
	@WebServlet("/PointOfInterest")
public class PointOfInterest extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
  	
		res.setContentType("text/html");
		 PrintWriter out = res.getWriter();
		String latitude = req.getParameter("lat");
		String longitude = req.getParameter("lng");
		String type = req.getParameter("type");

			
			Poi  poi = PoiDAO.namesJson(latitude,longitude,type);
//			Poi poi = new Poi();
			List<String> name = poi.getName();
			req.setAttribute("name", name);
			req.getRequestDispatcher("Test4.jsp").forward(req, res);
			 System.out.println("success");
			 out.close();
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