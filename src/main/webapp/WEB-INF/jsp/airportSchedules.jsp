<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="css/schedules.css">
   <title>Dashboard</title>
</head>
<body>
   <div class="curvy1"></div>
   <div class="curvy2"></div>
   <div class="curvy0"></div>
   <ion-icon name="cloudy" id="c1" class="clouds"></ion-icon>
   <ion-icon name="cloudy" id="c2" class="clouds"></ion-icon>
   <ion-icon name="cloudy" id="c3" class="clouds"></ion-icon>
   <ion-icon name="cloudy" id="c4" class="clouds"></ion-icon>
   <ion-icon name="airplane" id="plane"></ion-icon>
   <!-- Navigation bar -->
   <header>
      <div class="navigation">
         <h1 class="logo">AirKite Navigator</h1>
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

   <!-- Body content -->
   <section class="mainScreen">
      <div class="space">
         <div class="spaceContent">
            <h3>Know Schedules</h3>
            <div class="line">
               <span class="lineSpan"><ion-icon name="airplane-sharp"></ion-icon></span>
               <div class="dash"></div>
               <span><ion-icon name="airplane-sharp"></ion-icon></span>
            </div>
            <h3>By Airport</h3>
            <a href="#dashboard"><ion-icon name="arrow-down-outline" id="flight"></ion-icon></a>
         </div>
      </div>
   </section>
   <section class="dashboardSection" id="dashboard">
      <div class="container">
         <h1 id="title1"><u>Airport Schedules</u></h1>
         <a id="toggle1" href="/flightSchedules#dashboard"> ◀  <u>Flight Schedules</u> </a>
         
         <form action="airportSchedules#dashboard" method="get">
            <div class="searchBar" id="searchBar1">
               <div class="airportContainer">
                  <input type="text" name="airport" id="airport" placeholder="Airport" autocomplete="off">
                  <ul id="charactersList2"></ul>
               </div>
               <a><button type="submit"><ion-icon name="paper-plane-outline"></ion-icon></button></a>
            </div>
         </form>
         
         <div class="boards1" id="boards1">
            <div class="boardHeading">
               <h3 class="dep">Departure</h3>
               <h3 class="arr">Arrival</h3>
            </div>
            <div class="boardContainer">
               <div class="leftBoard">
                  <table>
                     <thead>
                        <th>AIRLINE</th>
                        <th>FLIGHT</th>
                        <th>DESTINATION</th>
                        <th>TIME</th>
                        <th>STATUS</th>
                     </thead>
                     <tbody>
                     <c:forEach items="${depFlights}" var="flight">
                  	 <tr>
                     	<td><img src="https://daisycon.io/images/airline/?width=100&height=20&iata=${flight.airline}" alt="logo"></td>
                     	<td>${flight.flightID}</td>
                     	<td>${flight.arr}</td>
                     	<td><h5>${flight.depTime}</h5></td>
                     	<c:choose>
  							<c:when test="${flight.status == 'active'}">
								<td><font color="blue">${flight.status}</font></td>
  							</c:when>
  							<c:when test="${flight.status == 'landed'}">
								<td><font color="orange">${flight.status}</font></td>
  							</c:when>
  							<c:when test="${flight.status == 'cancelled'}">
								<td><font color="red">${flight.status}</font></td>
  							</c:when>

  							<c:otherwise>
								<td><font color="green">${flight.status}</font></td>
  							</c:otherwise>
						</c:choose>
                 	</tr>
                  	</c:forEach>
                     </tbody>
                  </table>
               </div>
               <div class="rightBoard">
                  <table>
                     <thead>
                        <th>AIRLINE</th>
                        <th>FLIGHT</th>
                        <th>ORIGIN</th>
                        <th>TIME</th>
                        <th>STATUS</th>
                     </thead>
                     <tbody>
                      <c:forEach items="${arrFlights}" var="flight">
                  	 	<tr>
                     	<td><img src="https://daisycon.io/images/airline/?width=100&height=20&iata=${flight.airline}" alt="logo"></td>
                     	<td>${flight.flightID}</td>
                     	<td>${flight.dep}</td>
                     	<td><h5>${flight.arrTime}</h5></td>
                     	<c:choose>
  							<c:when test="${flight.status == 'active'}">
								<td><font color="blue">${flight.status}</font></td>
  							</c:when>
  							<c:when test="${flight.status == 'landed'}">
								<td><font color="orange">${flight.status}</font></td>
  							</c:when>
  							<c:when test="${flight.status == 'cancelled'}">
								<td><font color="red">${flight.status}</font></td>
  							</c:when>

  							<c:otherwise>
								<td><font color="green">${flight.status}</font></td>
  							</c:otherwise>
						</c:choose>
                 	</tr>
                  	</c:forEach>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
      </div>
   </section>

   <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
   <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
   <script src="js/airportSchedules.js"></script>
</body>
</html>