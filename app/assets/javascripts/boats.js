function taydenna() {
	var e = document.getElementById('boat_ValmMalli');
	var nimi = e.options[e.selectedIndex].text;
	document.getElementById('boat_ValmMalli').value=nimi;

  if (!nimi || 0 === nimi.length) {
   document.getElementById('boat_Tyyppi').value="";
   document.getElementById('boat_Pituus').value="";
   document.getElementById('boat_Leveys').value="";
   document.getElementById('boat_Syvyys').value="";
   document.getElementById('boat_Uppouma').value="";
   document.getElementById('boat_Korkeus').value="";
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
