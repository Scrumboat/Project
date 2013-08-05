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

$(function () {
    $("#1").popover({placement: 'top', title: 'HaaHoo!', content: 'Laskun tiedot tähän.'});
});