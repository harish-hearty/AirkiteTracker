<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="css/style.css">
   <title>AirKite Tracker</title>
</head>
<body>
   <!-- Header contents -->
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

   <!-- Home body contents -->
   <section class="container-home sections" id="home">
      <h1 class="welcome">Welcome</h1>
      <h2 class="para">Use AirKite Tracker to explore the flights around the globe</h2>
      <a href="/map" class="explore-btn">Explore</a>
   </section>
   
   <video src="/videos/bg-video.mp4" autoplay muted loop></video>
   
   <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
   <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
   <script src="js/script.js"></script>
</body>
</html>