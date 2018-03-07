// JS côté PROPRIO
let firstDay;
const leftPagination = document.getElementById("left-pagination");
const rightPagination = document.getElementById("right-pagination");
const flatId = document.querySelector(".availabilities-slots").dataset.flat;
// console.log(flatId);

const updateDisplayDays = (firstDay) => {

  days = document.querySelectorAll(".availabilities-day");

  days.forEach(function(day, index){
    if (index >= firstDay && index <= firstDay + 4) {
      day.style.display = null;
    } else {
      day.style.display = "none";
    }
  });
  // mise à jour de l'état des boutons left et rightPagination
  if (firstDay === 0) {
    leftPagination.classList.add("navigationdisable");
  } else {
    leftPagination.classList.remove("navigationdisable");
  }

  if (firstDay === 9) {
    rightPagination.classList.add("navigationdisable");
  } else {
    rightPagination.classList.remove("navigationdisable");
  }
};


document.addEventListener('DOMContentLoaded', (event) => {
  // initialiser display au chargement de la page (à partir de today)
  if (document.querySelector(".calendar-owner")) {
    // initialiser plage jour = today --> today + 5
    firstDay = 0;
    updateDisplayDays(firstDay);

    leftPagination.addEventListener("click", (event) => {
      event.preventDefault();
      firstDay = firstDay - 1;
      updateDisplayDays(firstDay);
    });

    rightPagination.addEventListener("click", (event) => {
      event.preventDefault();
      firstDay = firstDay + 1;
      updateDisplayDays(firstDay);
    });

    // Tableau de h des availabilities de la DB associées à ce flat :
    const availabilitiesFlat = JSON.parse(document.querySelector(".availabilities-slots").dataset.bookings);
    // console.log(availabilitiesFlat);

    // On traite chaque availability récupérée pour assigner la classe CSS 'availability'
    // availabilitiesFlat.forEach(function(availability, index){
    //   console.log(availability.start_time);
    //   console.log(document.querySelector("[data-dt=`${availability.start_time}`]"));
    //   document.querySelector("[data-dt=`${availability.start_time}`]").classList.add("availability");
      // Et on ajoute directement l'ID de l'availability

    // });
  }
});




function updateAvailabilityHtml(element, booked, id){
  if(booked){
      element.classList.add("availability");
      element.dataset.availabilityId = id;
  }
  else{
    element.classList.remove("availability");
    element.dataset.availabilityId = null;
  }
}

function addAvailability(element) {
    date = element.dataset.dt;
    fetch(`/flats/${flatId}/availabilities/`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      'X-CSRF-Token': Rails.csrfToken()
    },
    credentials: 'same-origin',
    body: JSON.stringify({ availability: {start_time: date} })
  })
    .then(response => response.json())
    .then((data) => {
      updateAvailabilityHtml(element, true, data.id);
    });
}

function removeAvailability(element) {
    const id = element.dataset.availabilityId
    fetch(`availabilities/${id}/`, {
    method: "DELETE",
    headers: {
      "Content-Type": "application/json",
      'X-CSRF-Token': Rails.csrfToken()
    },
    credentials: 'same-origin',
  })
    .then((data) => {
      console.log(data.body);
      // on considere que tout c'est bien passé si on est ici.
      updateAvailabilityHtml(element, false);
    });
}


btnAvailabilities = document.querySelectorAll(".availability-proprio");
btnAvailabilities.forEach(function(availability, index){
  availability.addEventListener("click", (event) => {
    event.preventDefault();
    child = document.querySelectorAll(".availabilities-slot")[index];
    // if (je suis active){
    if (child.classList.contains("availability")) {
      // console.log(availabilityId);
      removeAvailability(child);

    } else {
      // requête AJAX pour create availability
      addAvailability(child);
      // j'ajoute une class active au l'élement cliqué:
    }
  });
});





