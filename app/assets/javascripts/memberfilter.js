function hideAll() {
  $(".toimi").hide();
  $(".lisenssi").hide();
  $(".posti").hide();
  $(".maa").hide();
  $(".laivuri").hide();
  $(".varasto").hide();
  $(".avain").hide();
  $(".huom").hide();
  $("#filtterit").hide();
}

function toggle(className, obj) {
    var $input = $(obj);
    if ($input.prop('checked')) $(className).show();
    else $(className).hide();
}
