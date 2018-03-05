let firstDay;
const leftPagination = document.getElementById("left-pagination");
const rightPagination = document.getElementById("right-pagination");

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
      firstDay = firstDay - 1;
      updateDisplayDays(firstDay);
    });

    rightPagination.addEventListener("click", (event) => {
      firstDay = firstDay + 1;
      updateDisplayDays(firstDay);
    });
  }
});




// function addAvailability(date) {
//     fetch(`flats/${4}/availabilities/`, {
//     method: "POST",
//     headers: {
//       "Content-Type": "application/json",
//       credentials: 'same-origin'
//     },
//     body: JSON.stringify({ date: date })
//   })
//     .then(response => response.json())
//     .then((data) => {
//       console.log(data); // Look at local_names.default
//     });
// }
// }

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
    console.log("ok")
    // if (je suis active){
        //    JE DOIS AVOIR UN ID DANS L'HTML,
        //      soit fournit par ruby quand la page a été généré
        //      soit injecté en js parce qu'on vient de l'activer depuis le chargement de la page
        // je change le html pour le desactive (ou je le fais dans le retour de mon ajax)
        // removeAvailability(id chopé dans data-id)
    // }
    // else {
      // addAvailability(date, chopé dans data-dt)
      // j'ajoute une class active au l'élement cliqué:
      child = document.querySelectorAll(".availabilities-slot")[index];
      child.classList.add("availability");
    // }
  });
});





