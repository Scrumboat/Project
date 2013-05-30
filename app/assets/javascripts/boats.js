function taydenna() {
  //     document.getElementById('boat_Pituus').value="50";
	var e = document.getElementById('malli');
	var nimi = e.options[e.selectedIndex].text;
	document.getElementById('boat_ValmMalli').value=nimi;

  if (!nimi || 0 === nimi.length) {
   document.getElementById('boat_Pituus').value="";
   document.getElementById('boat_Leveys').value="";
   document.getElementById('boat_Syvyys').value="";
   document.getElementById('boat_Uppouma').value="";
   document.getElementById('boat_Korkeus').value="";
   return;
  }
	$.getJSON('/mallis/'+nimi+'.json', function(data) {
          $.each(data, function(key, val) {
                  if (document.getElementById('boat_'+key) != null) {
                          document.getElementById('boat_'+key).value = val;
                  }
          });
          
          //var obj = JSON.parse(data);
          //document.getElementById('boat_Syvyys').value=obj.Syvyys;
	});
}
