// var FIDDLE_MAP = 'f_style';

//function for placing a city on google maps
// function initialize() {

//   var featureOpts = [{
//     "featureType": "administrative",
//     "elementType": "labels.text.fill",
//     "stylers": [{
//       "color": "#444444"
//     }]
//   }, {
//     "featureType": "administrative.country",
//     "elementType": "geometry.stroke",
//     "stylers": [{
//       "visibility": "off"
//     }]
//   }, {
//     "featureType": "landscape",
//     "elementType": "all",
//     "stylers": [{
//       "color": "#f2f2f2"
//     }]
//   }, {
//     "featureType": "poi",
//     "elementType": "all",
//     "stylers": [{
//       "visibility": "off"
//     }]
//   }, {
//     "featureType": "road",
//     "elementType": "all",
//     "stylers": [{
//       "saturation": -100
//     }, {
//       "lightness": 45
//     }]
//   }, {
//     "featureType": "road.highway",
//     "elementType": "all",
//     "stylers": [{
//       "visibility": "simplified"
//     }]
//   }, {
//     "featureType": "road.arterial",
//     "elementType": "labels.icon",
//     "stylers": [{
//       "visibility": "off"
//     }]
//   }, {
//     "featureType": "transit",
//     "elementType": "all",
//     "stylers": [{
//       "visibility": "off"
//     }]
//   }, {
//     "featureType": "water",
//     "elementType": "all",
//     "stylers": [{
//       "color": "#e15454"
//     }, {
//       "visibility": "on"
//     }]
//   }];


//   var markers = [];
//   var map = new google.maps.Map(document.getElementById('map-canvas'), {
//     scrollwheel: false,
//     mapTypeControlOptions: {
//       mapTypeIds: [google.maps.MapTypeId.ROADMAP, FIDDLE_MAP]
//     },
//     mapTypeId: FIDDLE_MAP
//   });

//   var styledMapOptions = {
//     name: 'F Style'
//   };

//   var customMapType = new google.maps.StyledMapType(featureOpts, styledMapOptions);

//   map.mapTypes.set(FIDDLE_MAP, customMapType);

//   var defaultBounds = new google.maps.LatLngBounds(
//     new google.maps.LatLng(40.621404, -74.033231),
//     new google.maps.LatLng(40.752613, -73.632917));
//   map.fitBounds(defaultBounds);

//   // Create the search box and link it to the UI element.
//   var input = /** @type {HTMLInputElement} */
//     (
//       document.getElementById('pac-input'));
//   map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

//   var searchBox = new google.maps.places.SearchBox(
//     /** @type {HTMLInputElement} */
//     (input));

//   // Listen for the event fired when the user selects an item from the
//   // pick list. Retrieve the matching places for that item.
//   google.maps.event.addListener(searchBox, 'places_changed', function() {
//     var places = searchBox.getPlaces();

//     if (places.length == 0) {
//       return;
//     }
//     for (var i = 0, marker; marker = markers[i]; i++) {
//       marker.setMap(null);
//     }

//     // For each place, get the icon, place name, and location.
//     markers = [];
//     var bounds = new google.maps.LatLngBounds();
//     for (var i = 0, place; place = places[i]; i++) {
//       var image = {
//         url: place.icon,
//         size: new google.maps.Size(71, 71),
//         origin: new google.maps.Point(0, 0),
//         anchor: new google.maps.Point(17, 34),
//         scaledSize: new google.maps.Size(25, 25)
//       };

//       // Create a marker for each place.
//       var marker = new google.maps.Marker({
//         map: map,
//         icon: image,
//         content: place.name,
//         position: place.geometry.location,
//         anchorPoint: new google.maps.Point(-5, -35)
//       });

//       markers.push(marker);

//       var infoWindow = new google.maps.InfoWindow({
//         content: markers[i].content,
//       });

//       google.maps.event.addListener(marker, 'click', function(pointer, infoWindow) {
//         return function() {
//           infoWindow.open(map, pointer);
//         };
//       }(marker, infoWindow));

//       bounds.extend(place.geometry.location);
//     }

//     map.fitBounds(bounds);

//   });

//   // Bias the SearchBox results towards places that are within the bounds of the
//   // current map's viewport.
//   google.maps.event.addListener(map, 'bounds_changed', function() {
//     var bounds = map.getBounds();
//     searchBox.setBounds(bounds);
//   });
// }

      // This example displays an address form, using the autocomplete feature
      // of the Google Places API to help users fill in the information.

      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

