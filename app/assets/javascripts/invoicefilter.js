function hideAll() {
  $(".suorkas").hide();
  $(".annehyv").hide();
  $(".edelkau").hide();
  $(".talksak").hide();
  $(".katssak").hide();
  $(".vartsak").hide();
  $(".lasklis").hide();
  $(".muutmak").hide();
  $(".ensrekm").hide();
  $("#filtterit").hide();
}

function toggle(className, obj) {
    var $input = $(obj);
    if ($input.prop('checked')) $(className).show();
    else $(className).hide();
}

function generateViite() {
  var jno = document.getElementById('invoice_jno').value.toString();
  var response = $("#member_data_in_json").html();
  var fixattu = JSON.parse(response.replace(/&quot;/g,'"'));


 // var fixattux = [442100001,442100002,442100003,214900001,214900002,222200001]
 // jno = jno + "00001"
 // var viitenumero = jno.valueOf()
 // if ($.inArray(viitenumero, fixattux)) == -1) {
 //   document.getElementById('invoice_suorituksetIlmanViitetta').value=fixattu;
 // }

  //if (Date.month betweem january and june) {
  //} else {
   // }




  //var members_in_json = $.getJSON("#member_data_in_json").html();

  //var members_in_json = JSON.parse($("#member_data_in_json").html());

  //JSON.parse(response.body)
  //var parsedJSON = eval('('+response+')');
  //var parsedJSON = JSON.parse(response);
  //var parsedJSON = $.parseJSON(response);

  //var obj = jQuery.parseJSON(response);
  //alert( obj.name === "John" );

  alert('ERROR');
  //document.getElementById('invoice_suorituksetIlmanViitetta').value=jno;





  //document.getElementById('invoice_viitenumero').value=parsedJSON[1];

  //var members_in_json = JSON.parse($("member_data_in_json").html());
  //var obj = jQuery.parseJSON(parsedJSON);
  //var parsedJSON = $.parseJSON(response);
}
