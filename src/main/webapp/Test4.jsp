<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.mapshib.PointOfInterest" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3 align="center" >Map</h3>
<section >
	<form action="/mapshib/PointOfInterest" method="post" >		    
		<input id = "lat" type="text" placeholder="Enter latitude..." name="lat" autofocus>	
		<input id = "lng" type="text" placeholder="Enter longitude..." name="lng" >
		<input id = "type" type="text" placeholder="Enter any location..." name="type">
	    <input id= "submit" type="submit" value="Get list!">
	</form>
	<form action="history.jsp">		    	
		<button>History</button>
	</form>

	
</section>
<table>
  <c:forEach items="${name}" var="name">
    <tr>
      <td><c:out value="${name}" /></td>
    </tr>
  </c:forEach>
</table>
    
</body>
</html>