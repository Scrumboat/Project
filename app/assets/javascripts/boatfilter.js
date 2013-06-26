function hideAll() {
  $(".tyyppi").hide();
  $(".reknro").hide();
  $(".valmmalli").hide();
  $(".pituus").hide();
  $(".leveys").hide();
  $(".syvyys").hide();
  $(".korkeus").hide();
  $(".teho").hide();
  $(".vuosimalli").hide();
  $(".huomautukset").hide();
  $(".katsastus").hide();
}

function toggle(className, obj) {
    var $input = $(obj);
    if ($input.prop('checked')) $(className).show();
    else $(className).hide();
}
