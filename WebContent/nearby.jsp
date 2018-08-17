<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.maphiber.MapImpl.Nearby" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <link rel = "stylesheet"
   type = "text/css"
   href = "poi.css" />
    <style>
       /* Set the size of the div element that contains the map */
      #map {
        height: 500px;  /* The height is 500 pixels */
        width: 100%;  /* The width is the width of the web page */
       }
    </style>
  </head>
  <body class="webdesigntuts-workshop">
<h3 align="center" >Map</h3>
<section>
	<%Double lat = (Double)request.getAttribute("lat"); %>	
	<%Double lng = (Double)request.getAttribute("lng"); %>
	<%String type = "shopping_mall"; %>

<form action="/maphiber/Nearby" method="post" >		    
		<input id = "name" type="text" placeholder="Enter any location..." name="name" autofocus>
		<input id = "submit" type="submit" value="Get the map!">
	    
</form>
<form action="/maphiber/PointOfInterest" method="post" >		    
		<input id = "lat" type="hidden" name="lat" value="<%=lat %>">	
		<input id = "lng" type="hidden" name="lng" value="<%=lng %>">
		<input id = "type" type="hidden" name="type" value="<%=type %>">
		<input id = "submit" type="submit" value="Get the list!">
	    
</form>
</section>
<div id="map"></div>

	
<!-- <div id="right-panel">
	<h2>Results</h2>
	<ul id="places"></ul>
	<button id="more">More results</button>
	</div> -->
<script>
//This example requires the Places library. Include the libraries=places
//parameter when you first load the API. For example:
//<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
/* navigator.geolocation.getCurrentPosition(initMap); */
function initMap(lat, lng) {
	var lat =<%= lat%>;
	var lng =<%= lng%>;
	var uluru = {
			lat : lat,
			lng : lng
		};
var map = new google.maps.Map(document.getElementById('map'), {
 center: uluru,
 zoom: 11
});
var input = document.getElementById('name');
var autocomplete = new google.maps.places.Autocomplete(input);
var marker = new google.maps.Marker({position: uluru, map: map});
var geocoder = new google.maps.Geocoder();
geocoder.geocode({ 'latLng': uluru }, function (results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
        if (results[1]) {
      	  document.getElementById('name').value =  results[0].formatted_address;
        }
    }
});
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
		var name = document.getElementById('name').value;
		geocoder.geocode({
			'name' : name
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDUpNztopmXQeH5D-fhkhVRQ_jGyP7Gy7A&libraries=places&callback=initMap" async defer></script>
</body>
</html>