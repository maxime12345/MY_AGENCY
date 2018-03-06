let firstDay;
const leftPagination = document.getElementById("left-pagination");
const rightPagination = document.getElementById("right-pagination");
const flatId = document.querySelector(".availabilities-slots").dataset.flat;
console.log(flatId);

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
  if (document.querySelector(".calendar")) {
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
    console.log(availabilitiesFlat);
    // const availabiliyStarTime = availabilitiesFlat
    availabilitiesFlat.forEach(function(availability, index){
      console.log(availability.start_time);

    });
  }
});




function addAvailability(date) {
  console.log(date);
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
      console.log(data); // Look at local_names.default
    });
}



// function removeAvailability(id) {
//     fetch(`availabilities/${id}/`, {
//     method: "DELETE",
//     headers: {
//       "Content-Type": "application/json",
//       credentials: 'same-origin'
//     }
//   })
//     .then(response => response.json())
//     .then((data) => {
//       console.log(data); // Look at local_names.default
//     });
// }
// }


btnAvailabilities = document.querySelectorAll(".availability-proprio");
btnAvailabilities.forEach(function(availability, index){
  availability.addEventListener("click", (event) => {
    event.preventDefault();
    console.log("ok")
    console.log(index);
    child = document.querySelectorAll(".availabilities-slot")[index];
    // if (je suis active){
    if (child.classList.contains("availability")) {
      //    JE DOIS AVOIR UN ID DANS L'HTML,
      // reqûete pour vérifier si availability existe pour ce flat_id et ce start_time
      //      soit fournit par ruby quand la page a été généré
      //      soit injecté en js parce qu'on vient de l'activer depuis le chargement de la page
      // requête AJAX pour create availability :
      // removeAvailability(id);
      // je change le html pour le desactive (ou je le fais dans le retour de mon ajax)
      child.classList.remove("availability");
        // removeAvailability(id chopé dans data-id)

    } else {
      // addAvailability(date, chopé dans data-dt)
      date = child.dataset.dt;
      // requête AJAX pour create availability
      addAvailability(date);
      // j'ajoute une class active au l'élement cliqué:
      child.classList.add("availability");
    }
  });
});





