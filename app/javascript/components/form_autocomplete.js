function updateFields(data) {

  const date = data.publication_date.split(" ")[0].split("/")

  document.getElementById('flat_name').value = data.name;
  document.getElementById('flat_address').value = data.address;
  document.getElementById('flat_price').value = data.price;
  document.getElementById('flat_description').value = data.description;
  document.getElementById('flat_publication_date_1i').value = parseInt(date[2], 10);
  document.getElementById('flat_publication_date_2i').value = parseInt(date[1], 10);
  document.getElementById('flat_publication_date_3i').value = parseInt(date[0], 10);
  document.getElementById('flat_surface').value = data.surface;
  document.getElementById('flat_nb_rooms').value = data.nb_rooms;
  // document.getElementById('flat_visit_capacity').value = data.visit_capacity;
}

function form_autocomplete() {
  var url_input = document.getElementById('flat_ad_url')

  var button_scrap = document.getElementById('scrap')
  if (button_scrap !== null) {
    button_scrap.addEventListener("click", function() {

      const url = "/flats/extract_from_lbc?url=https://www.leboncoin.fr/locations/1395070692.htm?ca=22_s"

      fetch(url, {
        credentials: 'same-origin'
      })
        .then(response => response.json())
        .then(updateFields);
    });
  }
}

export { form_autocomplete };
