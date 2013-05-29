function testi() {

	document.getElementById('boat_Leveys').value="100";

}

function taydenna() {
       document.getElementById('boat_Pituus').value="50";
	var e = document.getElementById('malli');
	var nimi = e.options[e.selectedIndex].text;
	document.getElementById('boat_ValmMalli').value=nimi;
	alert('/mallis/'+nimi+'.json');
	$.getJSON('/mallis/'+nimi+'.json', function(data) {
                obj = $.parseJSON(""+data);
		document.getElementById('boat_Syvyys').value=obj.Syvyys;
	});
	
}
