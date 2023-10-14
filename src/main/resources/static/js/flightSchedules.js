const flight = document.getElementById('plane');
const c1 = document.getElementById('c1');

const charactersList = document.getElementById("charactersList");
const charactersList1 = document.getElementById("charactersList1");

const org = document.getElementById("origin");
const destination = document.getElementById("destination");

//Based upon the scrolling value the plane moves up.
window.addEventListener('scroll', () => {
   let value = window.scrollY;
   flight.style.left = value + 'px';
   flight.style.bottom = value + 'px';
})

function scrollDown() {
  window.scrollTo(0, 500);
}

//To hide the suggessions bar when the input box is empty of cleared
org.addEventListener("keyup", (e) => {
  const searchString = e.target.value;
  if (searchString != "") {
    charactersList.classList.remove("active");
  } else {
    charactersList.classList.add("active"); 
  }
});

destination.addEventListener("keyup", (e) => {
  const searchString = e.target.value;
  if (searchString != "") {
    charactersList1.classList.remove("active");
  } else {
    charactersList1.classList.add("active");
  }
});

$(document).ready(function () {
  $.ajaxSetup({ cache: false });
  $("#origin").keyup(function () {
    $("#charactersList").html("");
    var searchField = $("#origin").val();
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
            $("#charactersList").append(
              '<li class="list-group-item characters">' +
                "<h4>" +
                value.name +
                "</h4>" +
                '    <span class="text-muted">' +
                value.iata_code +
                "</span></li>"
            );
          }
        });
      }
    );
  });

  $("#charactersList").on("click", "li", function () {
    var click_text = $(this).text().split("    ");
    $("#origin").val($.trim(click_text[1]));
    $("#charactersList").html("");
  });
});

$(document).ready(function () {
  $.ajaxSetup({ cache: false });
  $("#destination").keyup(function () {
    $("#charactersList1").html("");
    var searchField = $("#destination").val();
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
            $("#charactersList1").append(
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

  $("#charactersList1").on("click", "li", function () {
    var click_text = $(this).text().split("     ");
    $("#destination").val($.trim(click_text[1]));
    $("#charactersList1").html("");
  });
});