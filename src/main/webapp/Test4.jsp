<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.maphib.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3 align="center" >Map</h3>
<section >
	<form action="/maphib/PointOfInterest" method="post" >		    
		<input id = "lat" type="text" placeholder="Enter latitude..." name="lat" autofocus>	
		<input id = "lng" type="text" placeholder="Enter longitude..." name="lng" >
		<input id = "loc" type="text" placeholder="Enter any location..." name="loc" autofocus>
	    <input id= "lng" type="submit" value="Store and go back!">	    	
	</form>
	<form action="history.jsp">		    	
		<button>History</button>
	</form>
	
</section>
<%-- <%= com.maphib.PoiDAO.namesJson("28.6279490", "77.2786200", "shopping_mall") %> --%>
<%-- <%
    names.forEach(System.out::println); %> --%>
</body>
</html>




<%-- <% PoiDAO.namesJson(); %>

 <% List<String> names = new ArrayList<String>();
   for (int i = 0; i < names.size(); i++){
	out.print(names.get(i));
   }
    %>  --%>