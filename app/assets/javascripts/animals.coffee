# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $(document).on("ready", function() {
#   L.mapbox.accessToken = 'pk.eyJ1Ijoiam9zdWV0b3JyZXNmMiIsImEiOiJjbDh3bDhvcXcwYWU2M29vYTIzeXV5c3hlIn0.KBJxuzXQCIIAU8Cg3RaRBA';
#   var map = L.mapbox.map('map', 'mapbox://styles/mapbox/light-v10', { zoomControl: false })
#   .setView([39.739, -104.990], 12);

#   map.featureLayer.on("ready", function(e) {
#     getAnimals(map);
#   });
# });

# function getAnimals(map) {
#   var $loading_wheel = $("#spinning-wheel")
#   $loading_wheel.show();
#   $.ajax({
#     dataType: 'text',
#     url: '/animals.json',
#     success:function(animals) {
#       $loading_wheel.hide();
#       var geojson = $.parseJSON(animals);
#       map.featureLayer.setGeoJSON({
#         type: "FeatureCollection",
#         features: geojson
#       });
#       addAnimalPopups(map);
#     },
#     error:function() {
#       $loading_wheel.hide();
#       alert("Could not load the events");
#     }
#   });
# }

# function addAnimalPopups(map) {
#   map.featureLayer.on("layeradd", function(e){
#     var marker = e.layer;
#     var properties = marker.feature.properties;
#     var popupContent = '<div class="marker-popup">' + '<h3>' + properties.breed + '</h3>' +
#                        '<h4>' + properties.location + '</h4>' + '</div>';
#     marker.bindPopup(popupContent, {closeButton: false, minWidth: 300});
#   });
# }














# initialize the map on the 'map' div
# with the given map ID, center, and zoom
#map = L.mapbox.map('map', 'your-map-id').setView([45.52086, -122.679523], 14)


# get JSON object
# on success, parse it and
# hand it over to MapBox for mapping
# $.ajax
#   dataType: 'text'
#   url: '/animals.json'
#   success: (data) ->
#     geojson = $.parseJSON(data)
#     map.featureLayer.setGeoJSON(geojson)

# # add custom popups to each marker
# map.featureLayer.on 'layeradd', (e) ->
#   marker = e.layer
#   properties = marker.feature.properties

#   # create custom popup
#   popupContent =  '<div class="popup">' +
#                     '<h3>' + properties.name + '</h3>' +
#                     '<p>' + properties.address + '</p>' +
#                   '</div>'

#   # http://leafletjs.com/reference.html#popup
#   marker.bindPopup popupContent,
#     closeButton: false
#     minWidth: 320

# # handles a sidebar happy hour click
# $('article li').click (e) ->
#   current = $(this)
#   currentlyClickedName = current.find('h2').text()

#   # opens/closes popup for currently clicked happy hour
#   map.featureLayer.eachLayer (marker) ->
#     if marker.feature.properties.name is currentlyClickedName
#       id = layer._leaflet_id
#       map._layers[id].openPopup()
