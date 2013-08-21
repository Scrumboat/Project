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

function changeBerths() {

    var select = document.getElementById('boat_laituripaikka');

    while (select.options.length > 0) {
        select.remove(select.options.length - 1);
    }

    var e = document.getElementById('boat_laituri');
    var laituri_id = e.options[e.selectedIndex].value;

    var table = new Array();

    $.getJSON('/berths.json', function(data) {
        for (var i = 0; i < data.length; i++) {
            onkoDockOikea = false;
            onkoBoatOikea = false;
            $.each(data[i], function(key, val) {
                if (key == 'boat_id' && val == null) {
                    onkoBoatOikea = true;
                }
               if (key == 'dock_id' && val == laituri_id) {
                     onkoDockOikea = true;
               }
                if (onkoDockOikea == true && onkoBoatOikea == true && key == 'number') {
                    var opt = document.createElement('option');
                    opt.text = val;
                    opt.value = val;
                    select.add(opt, null);
                }
            });
    }
    });
}
