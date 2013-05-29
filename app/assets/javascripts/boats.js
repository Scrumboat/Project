function testi() {

	document.getElementById('boat_Leveys').value="100";

}

function taydenna() {
       document.getElementById('boat_Pituus').value="50";
	var e = document.getElementById('malli');
	var nimi = e.options[e.selectedIndex].text;
	document.getElementById('boat_ValmMalli').value=nimi;
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
