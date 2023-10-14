const flight = document.getElementById("plane");
const c1 = document.getElementById("c1");

const charactersList2 = document.getElementById("charactersList2");

const airport = document.getElementById("airport");

//Based upon the scrolling value the plane moves up.
window.addEventListener("scroll", () => {
  let value = window.scrollY;
  flight.style.left = value + "px";
  flight.style.bottom = value + "px";
});

//To hide the suggessions bar when the input box is empty of cleared
airport.addEventListener("keyup", (e) => {
  const searchString = e.target.value;
  if (searchString != "") {
    charactersList2.classList.remove("active");
  } else {
    charactersList2.classList.add("active");
  }
});

$(document).ready(function () {
  $.ajaxSetup({ cache: false });
  $("#airport").keyup(function () {
    $("#charactersList2").html("");
    //  $("#state").val("");
    var searchField = $("#airport").val();
    var expression = new RegExp(searchField, "i");
    $.getJSON(
      "https://raw.githubusercontent.com/algolia/datasets/master/airports/airports.json",
      function (data) {
        $.each(data, function (key, value) {
          if (
            value.name.search(expression) != -1 ||
            value.country.search(expression) != -1 ||
            value.city.search(expression) != -1 ||
            value.iata_code.search(expression) != -1
          ) {
            $("#charactersList2").append(
              '<li class="list-group-item characters">' +
                "<h3>" +
                value.name +
                "</h3>" +
                '     <span class="text-muted">' +
                value.iata_code +
                "</span></li>"
            );
          }
        });
      }
    );
  });

  $("#charactersList2").on("click", "li", function () {
    var click_text = $(this).text().split("     ");
    $("#airport").val($.trim(click_text[1]));
    $("#charactersList2").html("");
  });
});
