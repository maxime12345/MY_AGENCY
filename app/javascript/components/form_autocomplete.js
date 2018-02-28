function form_autocomplete() {
  var url_input = document.getElementById('flat_ad_url')
  var button_scrap = document.getElementById('scrap')
  if (button_scrap !== null) {
    button_scrap.addEventListener("click", function() {
      document.getElementById('flat_name').value = "seb's flat";
      document.getElementById('flat_address').value = "2 rue de la République 69001 Lyon";
      document.getElementById('flat_price').value = "1000";
      document.getElementById('flat_description').value = "Very nice flat";
      document.getElementById('flat_publication_date_1i').value = "2018";
      document.getElementById('flat_publication_date_2i').value = "1";
      document.getElementById('flat_publication_date_3i').value = "2";
      document.getElementById('flat_surface').value = "25";
      document.getElementById('flat_nb_rooms').value = "2";
      document.getElementById('flat_visit_capacity').value = "3";
    });
  }
}

export { form_autocomplete };
