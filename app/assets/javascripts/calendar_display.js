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


document.addEventListener('DOMContentLoaded', (ev) => {
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
