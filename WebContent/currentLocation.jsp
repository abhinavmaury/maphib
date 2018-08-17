<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel = "stylesheet"
   type = "text/css"
   href = "map.css" />
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
<section class="webdesigntuts-workshop">
	<form action="/maphiber/History" method="post" >		    
		<input id = "address" type="text" placeholder="Enter any location..." name="address" autofocus>	
	    <input id= "submit" type="submit" name="place" value="Store and go back!">	    	
	</form>
	<form action="/maphiber/History" method="post">		    	
		<input id= "submit" type="submit" name="place" value="History">	  
	</form>
	
</section>

	<div id="map"></div>
<div id="right-panel">
	<h2>Results</h2>
	<ul id="places"></ul>
	<button id="more">More results</button>
</div>

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
 zoom: 10
});
// Create the places service.
var service = new google.maps.places.PlacesService(map);
var getNextPage = null;
var moreButton = document.getElementById('more');
moreButton.onclick = function() {
  moreButton.disabled = true;
  if (getNextPage) getNextPage();
};
// Perform a nearby search.
service.nearbySearch(
    {location: uluru, radius: 111500, type: ['restaurant']},
    function(results, status, pagination) {
      if (status !== 'OK') return;
      createMarkers(results);
      moreButton.disabled = !pagination.hasNextPage;
      getNextPage = pagination.hasNextPage && function() {
        pagination.nextPage();
      };
    });
var input = document.getElementById('address');
var autocomplete = new google.maps.places.Autocomplete(input);
var marker = new google.maps.Marker({position: uluru, map: map});
var geocoder = new google.maps.Geocoder();
geocoder.geocode({ 'latLng': uluru }, function (results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
        if (results[1]) {
      	  document.getElementById('address').value =  results[0].formatted_address;
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
function createMarkers(places) {
	var bounds = new google.maps.LatLngBounds();
	var placesList = document.getElementById('places');
	  
	for (var i = 0, place; place = places[i]; i++) {
	  var image = {
	    url: place.icon,
	    size: new google.maps.Size(71, 71),
	    origin: new google.maps.Point(0, 0),
	    anchor: new google.maps.Point(17, 34),
	    scaledSize: new google.maps.Size(25, 25)
	  };
	    
	  var marker = new google.maps.Marker({
	    map: map,
	    icon: image,
	    title: place.name,
	    position: place.geometry.location
	  });
	    
	  var li = document.createElement('li');
	  li.textContent = place.name;
	  placesList.appendChild(li);
	    
	  bounds.extend(place.geometry.location);
	}
 map.fitBounds(bounds);
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDUpNztopmXQeH5D-fhkhVRQ_jGyP7Gy7A&libraries=places&callback=initMap" async defer></script>
</body>
</html>