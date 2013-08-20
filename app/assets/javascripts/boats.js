function taydenna() {
	var e = document.getElementById('boat_valm_malli');
	var nimi = e.options[e.selectedIndex].text;
	document.getElementById('boat_valm_malli').value=nimi;

  if (!nimi || 0 === nimi.length) {
   document.getElementById('boat_Tyyppi').value="";
   document.getElementById('boat_pituus').value="";
   document.getElementById('boat_leveys').value="";
   document.getElementById('boat_syvyys').value="";
   document.getElementById('boat_uppouma').value="";
   document.getElementById('boat_korkeus').value="";
   return;
  }
	$.getJSON('/models/'+nimi+'.json', function(data) {
          $.each(data, function(key, val) {
                  if (document.getElementById('boat_'+key) != null) {
                          document.getElementById('boat_'+key).value = val;
                  }
          });
	});
}

//function changeUrl() {
//   value = document.getElementById('boat_laituri').value;
//   window.location = "http://localhost:3000/boats/new?laituri="+value
//}

//function changeDefaultValue(value) {
//    document.getElementById('boat_laituri').value = value;
//}
