function hideAll() {
  $(".suorkas").hide();
  $(".annehyv").hide();
  $(".edelkau").hide();
  $(".talksak").hide();
  $(".katssak").hide();
  $(".vartsak").hide();
  $(".lasklis").hide();
}

function toggle(className, obj) {
    var $input = $(obj);
    if ($input.prop('checked')) $(className).show();
    else $(className).hide();
}
