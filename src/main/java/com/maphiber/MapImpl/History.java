package com.maphiber.MapImpl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.maphiber.Dao.HistoryDAO;

import com.maphiber.Pojo.Hist;

import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

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
		System.out.println("i'm in history...................");
		 String place = req.getParameter("address");
		 Calendar calendar = Calendar.getInstance();
		 java.sql.Timestamp date = new java.sql.Timestamp(calendar.getTime().getTime());
	        Hist h = new Hist(place, date);
	     String action = req.getParameter("place");
		if ("Store and go back!".equals(action.trim())) {
			
			int status = HistoryDAO.save(h);

			if (status > 0) {

				req.getRequestDispatcher("index.html").include(req, res);

			}
		} else if ("History".equals(action)) {
			System.out.println("Heyyyy..........");
			List<Hist> history = HistoryDAO.getAllHistory();
			history.stream().forEach(System.out::println);
			req.setAttribute("History", history);
			req.getRequestDispatcher("history.jsp").forward(req, res);

		}
	}

}