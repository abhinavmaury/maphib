package com.maphib;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			req.getRequestDispatcher("test5.jsp").forward(req, res);
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