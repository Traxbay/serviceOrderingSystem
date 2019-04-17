var map, infoWindow, currentLocation, requestQuery, place;
var nearbyRestaurants = [];
var eachRestaurant = {};
var node;
var textNode;
var resultsLength;
var service;

function initMap(){
  map = new google.maps.Map(document.getElementById('map'), {
    center: {
      lat: -34.424,
      lng: 160.345
    },
    zoom: 20
  });

  infoWindow = new google.maps.InfoWindow;
  getLocation();
}

function getLocation(){
  if(navigator.geolocation){
    navigator.geolocation.getCurrentPosition(function(position) {
      currentLocation = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      mLocation = currentLocation.lat + currentLocation.lng;
      console.log(currentLocation.lat + ", " + currentLocation.lng);
      var marker = new google.maps.Marker({
        position: currentLocation,
        map: map,
        icon: "http://maps.google.com/mapfiles/ms/micons/blue.png"

      });

      infoWindow.setPosition(currentLocation);
      infoWindow.setContent("Your Location ! ");
      infoWindow.open(map);
      map.panTo(currentLocation);
      getNearByPlaces(currentLocation);
    }, function(){
      console.log("calling handlelocationeroor(true)");
      handleLocationError(true, infoWindow, map.getCenter());
    });
  }else {
    console.log("calling handleLocationError(false)");
    handleLocationError(false, infoWindow, map.getCenter());
  }
}


function getNearByPlaces(currentLocation){
  console.log("getNearByPlaces:" + currentLocation.lat + ", " + currentLocation.lng);
  request = {
    location: currentLocation,
    radius: '500',
    query: 'restaurant'
  };
   service = new google.maps.places.PlacesService(map);
   service.textSearch(request, callback);
}


function callback(results, status){
  if (status == google.maps.places.PlacesServiceStatus.OK){
    console.log("callback received " + results.length + " results" );
    resultsLength = results.length;
    for (var i=0; i<resultsLength; i++){
      nearbyRestaurants[i] = results[i];
      console.log(nearbyRestaurants[i].name);
    }
  }else{
    console.log("callback status : " + status);
  }
}

function handleLocationError(browserHasGeolocation, infoWindow, currentLocation){
  infoWindow.setPosition(currentLocation);
  infoWindow.setContent(browserHasGeolocation ? 'Error: the geolocation service failed ! ' : 'Error, your browser does not support geolocation');
  infoWindow.open(map);
}
