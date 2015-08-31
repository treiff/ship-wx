// Initialize gmaps
function initialize() {
  var myLatLng = {lat: -25.363, lng: 131.044};
  var mapCanvas = document.getElementById('map');
  var mapOptions = {
    center: new google.maps.LatLng(44.5403, -78.5463),
    zoom: 3,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }

  var map = new google.maps.Map(mapCanvas, mapOptions)

// Fetch and loop through JSON data.
  $.getJSON( "/ships.json", function( data ) {
    var items = [];
    $.each( data, function( key, val ) {
        var latLng = new google.maps.LatLng(val.lat, val.long);
        // Build the marker
        var marker = new google.maps.Marker({
          position: latLng,
          map: map,
        });
        marker.setMap(map);
    });
  });

}
google.maps.event.addDomListener(window, 'load', initialize);
