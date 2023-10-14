<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<% response.setHeader("Cache-Control", "max-age=86400, must-revalidate"); %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Display a map</title>
  <script src="https://cdn.maptiler.com/maplibre-gl-js/v2.4.0/maplibre-gl.js"></script>
  <link href="https://cdn.maptiler.com/maplibre-gl-js/v2.4.0/maplibre-gl.css" rel="stylesheet" />
  <link rel="stylesheet" href="css/map.css">
</head>
<body>
  <!-- Header contents -->
   <header>
      <div class="navigation">
        <div class="logoLive">
          <h1 class="logo">AirKite Navigator</h1>
          <div class="liveContainer">
            <img class="live" src="/images/live.jpeg" alt="live">
            <p>Live</p>
          </div>
        </div>
         <div class="nav-contents">
            <ul>
               <li><a href="/">Home</a></li>
               <li><a href="/map">Map</a></li>
               <li><a href="/flightSchedules">Schedules</a></li>
               <li><a href="/about">About</a></li>
            </ul>
         </div>
      </div>
   </header>
  <div id="map">
    <div id="card" class="active">
      <div class="cardContents">
        <div class="close-icon">
          <span class="cls-icon">
            <button id="close-icon"><ion-icon name="close-outline"></ion-icon></button>
          </span>
        </div>

        <!-- head -->
        <div class="head">
          <div id="id_icon_iata" class="img-content"></div>
          <div class="plane-names">
            <h2 id="id_airline"></h2>
            <h3 id="id_f_iata"></h3>
          </div>
        </div>

        <!-- origin-destination -->
        <div class="org-dest">
          <div class="org">
            <h5 id="id_origin"></h5>
            <h1 id="id_origin_code"></h1>
            <h5 id="id_departure_time"></h5>
          </div>
          <div class="org-dest-logo">
            <img src="./images/flight-path.png" alt="flightpath">
          </div>
          <div class="dest">
            <h5 id="id_destination"></h5>
            <h1 id="id_destination_code"></h1>
            <h5 id="id_arrival_time"></h5>
          </div>
        </div>

        <div class="card-container">
          <!-- speed-altitude -->
          <div class="speed-altitude">
            <div class="s-a-head">
              <ion-icon class="speed-icon" name="speedometer-outline"></ion-icon>
              <h2>Speed & Altitude</h2>
            </div>
            <div class="s-a-contents">
              <div class="hs">
                <h3>H-Speed:&ensp;</h3> <p id="id_speed" style="font-weight: bold;"></p>
              </div>
              <div class="vs">
                <h3>V-Speed:&ensp;</h3> <p id="id_vspeed" style="font-weight: bold;"></p>
              </div>
              <div class="al">
                <h3>Altitude:&ensp;</h3> <p id="id_altitude" style="font-weight: bold;"></p>
              </div>
            </div>
          </div>

          <!-- direction -->
          <div class="direction">
            <div class="d-head">
              <ion-icon class="dir-icon" name="compass-outline"></ion-icon>
              <h2>Direction & Status</h2>
            </div>
            <div class="d-contents">
              <div class="dir">
                <h3>Direction:&ensp;</h3> <p id="id_direction" style="font-weight: bold;"></p>
              </div>
              <div class="sts">
                <h3>Status:&ensp;</h3> <p id="id_status" style="font-weight: bold;"></p>
              </div>
              <div class="duration">
                <h3>Duration:&ensp;</h3> <p id="id_duration" style="font-weight: bold;"></p>
              </div>
            </div>
          </div>

          <!-- latitude & longitude -->
          <div class="lat-long">
            <div class="ll-head">
              <ion-icon class="ll-icon" name="globe-outline"></ion-icon>
              <h2>Latitude & Longitude</h2>
            </div>
            <div class="d-contents">
              <div class="long">
                <h3>Longitude:&ensp;</h3> <p id="id_longitude" style="font-weight: bold;"></p>
              </div>
              <div class="lat">
                <h3>Latitude:&ensp;</h3> <p id="id_latitude" style="font-weight: bold;"></p>
              </div>
              <div class="squa">
                <h3>Squawk:&ensp;</h3> <p id="id_squawk" style="font-weight: bold;"></p>
              </div>
            </div>
          </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script
    src="https://api.tiles.mapbox.com/mapbox.js/plugins/turf/v2.0.0/turf.min.js"
    charset="utf-8"></script>
  <script>

    const card = document.getElementById("card");
    const close_icon = document.getElementById("close-icon");
    
    //Creating empty object for marker properties.
    const geojson = {
      'type': 'FeatureCollection',
      'features': []
    };

    //Creation of map
    const key = 'MPTXvKHskAzZTasuqjks';
    const map = new maplibregl.Map({
      container: 'map',
      style: 'https://api.maptiler.com/maps/hybrid/style.json?key='+key,
      center: [16.62662018, 49.2125578],
      zoom: 1,
      minZoom: 1.4
    });

    //Looping through the array to get the values.
   	<c:forEach items="${flights}" var="flight">
   		<c:if test="${flight.flight_iata != null}">
			geojson.features.push(passer(${flight.lng}, ${flight.lat}, ${flight.dir}, '${flight.flight_iata}'));
		</c:if>
    </c:forEach>
    
    //Passer function updates the values into geojson object.
    function passer(longitude, latitude, rotate, flight_iata) {
      return (
        {
          'type': 'Feature',
          'properties': {
            'iconSize': [38, 38],
            'flight_iata': flight_iata
          },
          'geometry': {
            'type': 'Point',
            'coordinates': [longitude, latitude],
            'rotation': rotate
          }
        }
      )
    }
    
    //Adding object to geojson object.
    geojson.features.forEach((marker) => {
      // Creating a DOM element for the marker.
      var el = document.createElement('div');
      el.className = 'marker'
      el.style.width = marker.properties.iconSize[0] + 'px';
      el.style.height = marker.properties.iconSize[1] + 'px';
      
      // Adding marker to map.
      var markerIcon = new maplibregl.Marker(el)
      .setLngLat(marker.geometry.coordinates)
      .addTo(map);
      markerIcon.setRotation(marker.geometry.rotation);
      
      //Click function implementation on flight icon.
      el.addEventListener('click', function () {
          var code = marker.properties.flight_iata;
          markerIcon.setPopup(new maplibregl.Popup().setHTML(code));
          ajaxLoader(code);
          card.classList.remove("active");
      });
    });

    //Close button function for card.
    close_icon.addEventListener('click', () => {
      card.classList.add("active");
    })

    //Ajax method to load the contents into the card
    function ajaxLoader(code) {
      const xhr = new XMLHttpRequest();
      xhr.open('GET', 'https://airlabs.co/api/v9/flight?flight_iata='+code+'&api_key=20a50d8f-5625-4936-a784-53b1603ed7b4');
      xhr.responseType = 'json';
      xhr.onload = function() {
        if (xhr.status === 200) {
          const data = xhr.response;

          //Head
		  const iata = data.response.airline_iata;
		  document.getElementById("id_icon_iata").innerHTML = '<img class="icon-logo" src="https://daisycon.io/images/airline/?width=130&height=70&iata=' + iata + '" alt="logo">';
          document.getElementById("id_airline").innerText = data.response.airline_name;
          document.getElementById("id_f_iata").innerText = data.response.flight_iata;

          //Origin
          document.getElementById("id_origin").innerText = data.response.dep_city;
          document.getElementById("id_origin_code").innerText = data.response.dep_iata;
          var dep_time = data.response.dep_time;
          dep_time = dep_time.substr(11, 15);
          document.getElementById("id_departure_time").innerText = dep_time;
          
          //Destination
          document.getElementById("id_destination").innerText = data.response.arr_city;
          document.getElementById("id_destination_code").innerText = data.response.arr_iata;
          var arr_time = data.response.arr_time;
          arr_time = arr_time.substr(11, 15);
          document.getElementById("id_arrival_time").innerText = arr_time;
        
          //Speed
          var speed = document.getElementById("id_speed");
          if(data.response.speed == undefined) {
            speed.innerText = 'N/A';
          } else {
            speed.innerText = data.response.speed + " km";
          }
          
          var v_speed =  document.getElementById("id_vspeed");
          if(data.response.v_speed == undefined) {
            v_speed.innerText = 'N/A';
          } else {
            v_speed.innerText = data.response.v_speed + " km";
          }
          
          var altitude =  document.getElementById("id_altitude");
          if(data.response.alt == undefined) {
            altitude.innerText == 'N/A';
          } else {
            altitude.innerText = data.response.alt;
          }
          
          //Direction 
          var direction = document.getElementById("id_direction");
          if(data.response.dir == undefined) {
            direction.innerText == 'N/A';
          } else {
            direction.innerText = data.response.dir + "°";
          }

          var status = document.getElementById("id_status");
          if(data.response.status == undefined) {
            status.innerText = 'N/A';
          } else {
            status.style.color = "green";
            status.innerText = data.response.status;
          }
          
          var duration = document.getElementById("id_duration");
          if(data.response.duration == undefined) {
            duration.innerText = 'N/A';
          } else {
            duration.innerText = data.response.duration + " mins";
          }
          
          //Longitude & Latitude 
          var lng = document.getElementById("id_longitude");
          if(data.response.lng == undefined) {
            lng.innerText = 'N/A';
          } else {
            lng.innerText = data.response.lng;
          }

          var lat = document.getElementById("id_latitude");
          if(data.response.lat == undefined) {
            lat.innerText = 'N/A';
          } else {
            lat.innerText = data.response.lat;
          }

          var squawk = document.getElementById("id_squawk");
          if(data.response.squawk == undefined) {
            squawk.innerText = 'N/A';
          } else {
            squawk.innerText = data.response.squawk;
          }
        
        } else {
          console.log('Unable to load JSON data');
        }
      };
      xhr.send();
    }
  </script>
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>