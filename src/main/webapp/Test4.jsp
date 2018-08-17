<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.maphib.PointOfInterest" %>
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
<body class="webdesigntuts-workshop">
<h3 align="center" id = "header">List</h3>
<section class="webdesigntuts-workshop">
	 
	<form action="history.jsp">		    	
		<button>History</button>
	</form>

	
</section>
<form>
<div style="overflow-x:auto;">
<table border="2">
<tr>
<th>Names</th>
</tr>
  <c:forEach items="${name}" var="name">
    <tr>
      <td><c:out value="${name}" /></td>
    </tr>
  </c:forEach>
</table>
</div>
</form>
<style>
  @import url(https://fonts.googleapis.com/css?family=Cabin:400);
.webdesigntuts-workshop {
	background: #151515;
	height: 100%;
	position: absolute;
	text-align: center;
	width: 100%;
	font-family: 'Cabin';
}
.webdesigntuts-workshop h3 { 
	position: sticky;
    display: block;
    font-size: 2em;
    margin-top: 0.67em;
    margin-bottom: 0.67em;
    margin-left: 0;
    margin-right: 0;
    font-weight: bold;
    color: white;
    top: 15px;
}
 .webdesigntuts-workshop form {
	background: rgba(219,219,219,1);
	background: -moz-linear-gradient(left, rgba(219,219,219,1) 0%, rgba(254,254,254,1) 0%, rgba(226,226,226,1) 93%, rgba(226,226,226,1) 100%);
	background: -webkit-gradient(left top, right top, color-stop(0%, rgba(219,219,219,1)), color-stop(0%, rgba(254,254,254,1)), color-stop(93%, rgba(226,226,226,1)), color-stop(100%, rgba(226,226,226,1)));
	background: -webkit-linear-gradient(left, rgba(219,219,219,1) 0%, rgba(254,254,254,1) 0%, rgba(226,226,226,1) 93%, rgba(226,226,226,1) 100%);
	background: -o-linear-gradient(left, rgba(219,219,219,1) 0%, rgba(254,254,254,1) 0%, rgba(226,226,226,1) 93%, rgba(226,226,226,1) 100%);
	background: -ms-linear-gradient(left, rgba(219,219,219,1) 0%, rgba(254,254,254,1) 0%, rgba(226,226,226,1) 93%, rgba(226,226,226,1) 100%);
	background: linear-gradient(to right, rgba(219,219,219,1) 0%, rgba(254,254,254,1) 0%, rgba(226,226,226,1) 93%, rgba(226,226,226,1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#dbdbdb', endColorstr='#e2e2e2', GradientType=1 );
	border: 1px solid #000;
	border-radius: 5px;
	box-shadow: inset 0 0 0 1px #272727;
	/* display: inline-block; */
	font-size: 15px;
	padding: 20px;
	position: relative;
	z-index: 1;
}
 .webdesigntuts-workshop input {
	background: #222;	
	background: linear-gradient(#333, #222);	
	border: 1px solid #444;
	border-radius: 5px 0 0 5px;
	box-shadow: 0 2px 0 #000;
	color: #888;
	display: block;
	float: left;
	font-family: 'Cabin', helvetica, arial, sans-serif;
	font-size: 13px;
	font-weight: 400;
	height: 40px;
	margin: 0;
	padding: 0 10px;
	text-shadow: 0 -1px 0 #000;
	width: 200px;
}
.ie .webdesigntuts-workshop input {
	line-height: 40px;
}
.webdesigntuts-workshop input::-webkit-input-placeholder {
   color: #888;
}
.webdesigntuts-workshop input:-moz-placeholder {
   color: #888;
}
.webdesigntuts-workshop input:focus {
	animation: glow 800ms ease-out infinite alternate;
	background: #222922;
	background: linear-gradient(#333933, #222922);
	border-color: #393;
	box-shadow: 0 0 5px rgba(0,255,0,.2), inset 0 0 5px rgba(0,255,0,.1), 0 2px 0 #000;
	color: #efe;
	outline: none;
}
.webdesigntuts-workshop input:focus::-webkit-input-placeholder { 
	color: #efe;
}
.webdesigntuts-workshop input:focus:-moz-placeholder {
	color: #efe;
}
.webdesigntuts-workshop button {
	background: #222;
	background: linear-gradient(#333, #222);
	box-sizing: border-box;
	border: 1px solid #444;
	border-left-color: #000;
	border-radius: 5px 5px 5px 5px;
	box-shadow: 0 2px 0 #000;
	color: #fff;
	display: block;
	float: left;
	font-family: 'Cabin', helvetica, arial, sans-serif;
	font-size: 13px;
	font-weight: 400;
	height: 40px;
	line-height: 40px;
	margin: 0;
	padding: 0;
	position: relative;
	text-shadow: 0 -1px 0 #000;
	width: 80px;
}	
.webdesigntuts-workshop button:hover,
.webdesigntuts-workshop button:focus {
	background: #292929;
	background: linear-gradient(#393939, #292929);
	color: #5f5;
	outline: none;
}
.webdesigntuts-workshop button:active {
	background: #292929;
	background: linear-gradient(#393939, #292929);
	box-shadow: 0 1px 0 #000, inset 1px 0 1px #222;
	top: 1px;
}
@keyframes glow {
    0% {
		border-color: #393;
		box-shadow: 0 0 5px rgba(0,255,0,.2), inset 0 0 5px rgba(0,255,0,.1), 0 2px 0 #000;
    }	
    100% {
		border-color: #6f6;
		box-shadow: 0 0 20px rgba(0,255,0,.6), inset 0 0 10px rgba(0,255,0,.4), 0 2px 0 #000;
    }
}
table {
    border-collapse: collapse;
    width: 100%;
}
th, td {
    text-align: center;  
    padding: 8px;
}
tr:nth-child(even){background-color: #f2f2f2}
th {
    background-color: #4CAF50;
    color: white;
}
tr:hover {background-color:#F7CBC2;}
</style>
<script>
var head = document.getElementById('header');
Stickyfill.add(head);
</script>
</body>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.maphib.PointOfInterest" %>
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