// Global object to hold shared state and functions
window.chatApp = window.chatApp || {};
var map = L.map('map').setView([40.4168, -3.7038], 13);

(function() {
var NGSI_entities = []

// Add your custom PBF tiles using Leaflet.VectorGrid
L.tileLayer('http://localhost:8080/styles/basic-preview/{z}/{x}/{y}.png', {
  maxZoom: 18
}).addTo(map);


window.chatApp.getPoIs = async function(coord=[]) {
  var query="";
  var url = 'http://localhost:1027/http://fiware-orion:1026/ngsi-ld/v1/entities?type=PoI';

  if(coord) {
    coord = await getZoomCoordinates();
  }

  // Constructing the coordinates string
  const coordinates = [[
    [coord[0], coord[1]],
    [coord[2], coord[3]],
    [coord[4], coord[5]],
    [coord[6], coord[7]],
    [coord[0], coord[1]]
  ]];

  // filter by GeoJSON polygon
  // see: https://www.etsi.org/deliver/etsi_gs/CIM/001_099/009/01.08.01_60/gs_cim009v010801p.pdf
  const coordinatesString = JSON.stringify(coordinates);
  query = `&georel=within&geometry=Polygon&coordinates=${encodeURIComponent(coordinatesString)}`;
  url = url + query;

  try {
    const response =
        await fetch(
              url,
              {
                method: 'GET',
                headers: {
                    'origin': '*'
                }
              })
    if (!response.ok) {
        throw new Error('Network response was not ok. Status: ' + response.status + ' ' + response.statusText);
    }
    NGSI_entities = await response.json();
    return NGSI_entities;
  } catch (error) {
    console.error('There has been a problem with your fetch operation:', error);
    document.getElementById('result').textContent = 'Error: ' + error.message;
  }
}

window.chatApp.updateMap = async function () {
  var coord = await getZoomCoordinates() || [];
  //console.log('--coord:', coord);
  window.chatApp.NGSI_entities = await window.chatApp.getPoIs(coord);
  window.chatApp.NGSI_entities.forEach(function(entity) {
    var location = entity.location.value.coordinates;
    var title = entity.title.value;
    var image = entity.image;
    console.log('title:', title);

    if(image) {
      var customIcon = L.icon({
        iconUrl: `./img/${image.value}`,
        iconSize: [50, 50],
        popupAnchor: [0, -25],
        className: 'custom-icon'
      });
  
      // Add a marker to the map in the location of the entity
      // this is reversed beceause the coordinates are in the format [longitude, latitude]
      // and Leaflet expects [latitude, longitude]
      // See: https://datatracker.ietf.org/doc/html/rfc7946
      L.marker([location[1], location[0]], { icon: customIcon }).addTo(map)
        .bindPopup(title + location);

    } else {
      L.marker([location[1], location[0]]).addTo(map)
      .bindPopup(title);
    }
  });
}


// Function to log the coordinates of the four corners of the map to the console
async function getZoomCoordinates () {
  var bounds = map.getBounds();
  var southWest = bounds.getSouthWest();
  var northEast = bounds.getNorthEast();
  var northWest = L.latLng(northEast.lat, southWest.lng);
  var southEast = L.latLng(southWest.lat, northEast.lng);

  var coordinates = [southWest.lng, southWest.lat, southEast.lng, southEast.lat, northEast.lng, northEast.lat, northWest.lng, northWest.lat];
  return coordinates;
}

// Log the initial corner coordinates
//getZoomCoordinates();

// log the corner coordinates whenever the map is moved

})();

window.chatApp.updateMap();
map.on('moveend', window.chatApp.updateMap);
