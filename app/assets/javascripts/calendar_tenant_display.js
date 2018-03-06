// JS côté LOCATAIRE
let firstDayT;
const leftPaginationT = document.getElementById("left-pagination");
const rightPaginationT = document.getElementById("right-pagination");
const candidacyId = document.querySelector(".availabilities-slots").dataset.candidacyId;
// console.log(flatIdT);

const updateDisplayDaysT = (firstDayT) => {

  days = document.querySelectorAll(".availabilities-day");

  days.forEach(function(day, index){
    if (index >= firstDayT && index <= firstDayT + 4) {
      day.style.display = null;
    } else {
      day.style.display = "none";
    }
  });
  // mise à jour de l'état des boutons left et rightPaginationT
  if (firstDayT === 0) {
    leftPaginationT.classList.add("navigationdisable");
  } else {
    leftPaginationT.classList.remove("navigationdisable");
  }

  if (firstDayT === 9) {
    rightPaginationT.classList.add("navigationdisable");
  } else {
    rightPaginationT.classList.remove("navigationdisable");
  }
};


document.addEventListener('DOMContentLoaded', (event) => {
  // initialiser display au chargement de la page (à partir de today)
  if (document.querySelector(".calendar-tenant")) {
    // initialiser plage jour = today --> today + 5
    firstDayT = 0;
    updateDisplayDaysT(firstDayT);

    leftPaginationT.addEventListener("click", (event) => {
      event.preventDefault();
      firstDayT = firstDayT - 1;
      updateDisplayDaysT(firstDayT);
    });

    rightPaginationT.addEventListener("click", (event) => {
      event.preventDefault();
      firstDayT = firstDayT + 1;
      updateDisplayDaysT(firstDayT);
    });

    // Tableau de h des availabilities de la DB associées à ce flat :
    const availabilitiesFlat = JSON.parse(document.querySelector(".availabilities-slots").dataset.bookings);
    // console.log(availabilitiesFlat);

    // on récupère tous les liens des créneaux horaire
    links = document.querySelectorAll(".availability-tenant");
    // on boucle sur cette liste
    links.forEach(function(link, index){
      // si on trouve pas la classe 'availability' --> on add 'disabled'
      if (link.querySelector(".availabilities-slot").classList.contains("availability") === false) {
        link.classList.add("disabled");
      }
    })
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

function addBooking(element) {
    date = element.dataset.dt;
    // A REPRENDRE DEMAIN :
    fetch(`/candidacies/${candidacyId}/bookings/`, {
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

function removeBooking(element) {
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


btnAvailabilities = document.querySelectorAll(".availability-tenant");
btnAvailabilities.forEach(function(availability, index){
  availability.addEventListener("click", (event) => {
    event.preventDefault();
    child = document.querySelectorAll(".availabilities-slot")[index];
    // if (je suis active){
    if (child.classList.contains("booked")) {
      // console.log(availabilityId);
      removeBooking(child);

    } else {
      // requête AJAX pour create availability
      addBooking(child);
      // j'ajoute une class active au l'élement cliqué:
    }
  });
});





