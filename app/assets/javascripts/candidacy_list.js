function updateCandidacyStatus(element, status) {
    fetch(`/flats/${flatId}/candidacies/`, {
    method: "PATCH",
    headers: {
      "Content-Type": "application/json",
      'X-CSRF-Token': Rails.csrfToken()
    },
    credentials: 'same-origin',
    body: JSON.stringify({ candidacy_id: candidacyId, status: status })
  })
    .then(response => response.json())
    .then((data) => {
    });
}


btnConfirmCandidacy = document.querySelectorAll(".candidacy-confirmed-btn");
btnConfirmCandidacy.forEach(function(candidacy, index){
  candidacy.addEventListener("click", (event) => {
    event.preventDefault();
    child = document.querySelector(".candidacy-confirmed-btn-child");
    updateCandidacyStatus(child, "Dossier retenu");
  });
});

btnRefuseCandidacy = document.querySelectorAll(".candidacy-refused-btn");
btnRefuseCandidacy.forEach(function(candidacy, index){
  candidacy.addEventListener("click", (event) => {
    event.preventDefault();
    child = document.querySelector(".candidacy-refused-btn-child");
    updateCandidacyStatus(child, "Dossier archive");
  });
});



