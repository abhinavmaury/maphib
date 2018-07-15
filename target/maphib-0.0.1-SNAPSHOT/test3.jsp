<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<h3 align="center">Nearby Destinations</h3>
<section class="webdesigntuts-workshop">
	<form action="test3.jsp" method="get">		    
		<input id = "address" type="text" placeholder="Enter any location..." name="place">	
	    <input id= "submit" type="submit" value="Locate">	    	
	</form>
	<form action="history.jsp">		    	
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
	margin: 400px auto 0;
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
<%
		String place =request.getParameter("place");
if(place!=null){
	java.util.Date date = new java.util.Date();
	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
	String abc = sdf.format(date);
	Timestamp now = new Timestamp(new java.util.Date().getTime());
        try{
        	Connection con = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql:///maphib?useSSL=false", "root", "root");
            if(!con.isClosed()){
                System.out.println("Connected to fdsaMySQL");
            
                Statement stmt=con.createStatement();  
                
                
               ResultSet rs;
               PreparedStatement pst;
               pst=con.prepareStatement("insert into history(places, timestamp) VALUES (?, ?)");
               pst.setString(1,place);
               pst.setTimestamp(2, now);
               pst.executeUpdate();
               System.out.println("Place inserted "+place);
               System.out.println("Timestamp "+abc);
              //pst.setString(2,date);
              //pst.setString(3,time);
               
      }
            con.close();
        }catch(ClassNotFoundException c){
            System.out.println("Class was not found");
        }
        catch(Exception e){
            System.out.println(e);
        }
}
%>
	<div id="map"></div>

<script>

//This example requires the Places library. Include the libraries=places
//parameter when you first load the API. For example:
//<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
navigator.geolocation.getCurrentPosition(initMap);
function initMap(position) {
	var uluru = {
			lat : position.coords.latitude,
			lng : position.coords.longitude
		};
var map = new google.maps.Map(document.getElementById('map'), {
 center: uluru,
 zoom: 13
});
var input = document.getElementById('address');

var autocomplete = new google.maps.places.Autocomplete(input);

// Bind the map's bounds (viewport) property to the autocomplete object,
// so that the autocomplete requests use the current map bounds for the
// bounds option in the request.

// Set the data fields to return when the user selects a place.
autocomplete.setFields(
   ['address_components', 'geometry', 'icon', 'name']);

var infowindow = new google.maps.InfoWindow();
/* var infowindowContent = document.getElementById('infowindow-content');
infowindow.setContent(infowindowContent); */
var marker = new google.maps.Marker({
 map: map,
 position : uluru
});

autocomplete.addListener('place_changed', function() {
 infowindow.close();
 marker.setVisible(false);
 var place = autocomplete.getPlace();
 if (!place.geometry) {
   // User entered the name of a Place that was not suggested and
   // pressed the Enter key, or the Place Details request failed.
   window.alert("No details available for input: '" + place.name + "'");
   return;
 }

 // If the place has a geometry, then present it on a map.
 if (place.geometry.viewport) {
   map.fitBounds(place.geometry.viewport);
 } else {
   map.setCenter(place.geometry.location);
   map.setZoom(17);  // Why 17? Because it looks good.
 }
 marker.setPosition(place.geometry.location);
 marker.setVisible(true);	
});

var geocoder = new google.maps.Geocoder();

document.getElementById('submit').addEventListener('click', function() {
  geocodeAddress(geocoder, map);
});
}
	function geocodeAddress(geocoder, resultsMap) {
		var address = document.getElementById('address').value;
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status === 'OK') {
				resultsMap.setCenter(results[0].geometry.location);
				var marker = new google.maps.Marker({
					map : resultsMap,
					position : results[0].geometry.location
				});
			} else {
				alert('Geocode was not successful for the following reason: '
						+ status);
			}
		});
	}
</script>
<!-- Replace the value of the key parameter with your own API key. -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDUpNztopmXQeH5D-fhkhVRQ_jGyP7Gy7A&libraries=places&callback=initMap"
        async defer></script>
</body>
</html>