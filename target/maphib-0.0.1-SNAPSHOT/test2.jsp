<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style>
/* Always set the map height explicitly to define the size of the div
 * element that contains the map. */
#map {
  height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
  height: 100%;
  margin: 0;
  padding: 0;
}
#right-panel {
  font-family: 'Roboto','sans-serif';
  line-height: 30px;
  padding-left: 10px;
}

#right-panel select, #right-panel input {
  font-size: 15px;
}

#right-panel select {
  width: 100%;
}

#right-panel i {
  font-size: 12px;
}
#right-panel {
  font-family: Arial, Helvetica, sans-serif;
  position: absolute;
  right: 5px;
  top: 60%;
  margin-top: -195px;
  height: 330px;
  width: 200px;
  padding: 5px;
  z-index: 5;
  border: 1px solid #999;
  background: #fff;
}
h2 {
  font-size: 22px;
  margin: 0 0 5px 0;
}
ul {
  list-style-type: none;
  padding: 0;
  margin: 0;
  height: 271px;
  width: 200px;
  overflow-y: scroll;
}
li {
  background-color: #f1f1f1;
  padding: 10px;
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
}
li:nth-child(odd) {
  background-color: #fcfcfc;
}
#more {
  width: 100%;
  margin: 5px 0 0 0;
}
</style>


<div id="map"></div>
<div id="right-panel">
  <h2>Results</h2>
  <ul id="places"></ul>
  <button id="more">More results</button>
</div>

<div id="map"></div>
<script>
var map;
var infowindow;
navigator.geolocation.getCurrentPosition(initMap);
function initMap(position) {
  // The location of pyrmont
  var pyrmont = {lat: position.coords.latitude, lng: position.coords.longitude};

  map = new google.maps.Map(document.getElementById('map'), {
    center: pyrmont,
    zoom: 15
  });

  infowindow = new google.maps.InfoWindow();
  var service = new google.maps.places.PlacesService(map);
  service.nearbySearch({
    location: pyrmont,
    radius: 500,
    type: ['restaurant']
  }, callback);
}

function callback(results, status) {
  if (status === google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      createMarker(results[i]);
    }
  }
}



function createMarker(place) {
  var placeLoc = place.geometry.location;
  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location
  });

  google.maps.event.addListener(marker, 'click', function() {
    infowindow.setContent(place.name);
    infowindow.open(map, this);
  });
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDUpNztopmXQeH5D-fhkhVRQ_jGyP7Gy7A&libraries=places&callback=initMap" async defer></script>
</body>
</html>