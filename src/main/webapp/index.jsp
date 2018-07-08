<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>

  <head>
    <style>
       /* Set the size of the div element that contains the map */
      #map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
       }
    </style>
  </head>
  
<body>

<h3 align="center">Nearby Destinations</h3>

<section class="webdesigntuts-workshop">
	<form action="" method="">		    
		<input type="search" placeholder="Enter any location...">		    	
		<button>Locate</button>
	</form>
	<form action="/Home" method="get">		    	
		<button>History</button>
	</form>
	
</section>

<style>
@import url(https://fonts.googleapis.com/css?family=Cabin:400);

.webdesigntuts-workshop {
	background: #151515;
	height: 100%;
	position: absolute;
	text-align: center;
	width: 100%;
}

.webdesigntuts-workshop:before,
.webdesigntuts-workshop:after {
	content: '';
	display: block;	
	height: 1px;
	left: 50%;
	margin: 0 0 0 -400px;
	position: absolute;
	width: 800px;
}

.webdesigntuts-workshop:before {
	background: #444;
	background: linear-gradient(left, #151515, #444, #151515);
	top: 192px;
}

.webdesigntuts-workshop:after {
	background: #000;
	background: linear-gradient(left, #151515, #000, #151515);	
	top: 191px;
}

.webdesigntuts-workshop form {
	background: #111;
	background: linear-gradient(#1b1b1b, #111);
	border: 1px solid #000;
	border-radius: 5px;
	box-shadow: inset 0 0 0 1px #272727;
	display: inline-block;
	font-size: 0px;
	margin: 150px auto 0;
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
</style>


    <div id="map"></div>
    <script>
// Initialize and add the map
navigator.geolocation.getCurrentPosition(initMap);

function initMap(position) {
  // The location of Uluru
  var uluru = {lat: position.coords.latitude, lng: position.coords.longitude};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 10, center: uluru});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: uluru, map: map});
}
    </script>
     <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDUpNztopmXQeH5D-fhkhVRQ_jGyP7Gy7A&callback=initMap">
    </script>

</body>
</html>

