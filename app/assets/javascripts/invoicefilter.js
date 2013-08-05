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

$(':not(#anything)').on('click', function (e) {
    $('.popover-link').each(function () {
        //the 'is' for buttons that trigger popups
        //the 'has' for icons and other elements within a button that triggers a popup
        if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
            $(this).popover('hide');
            return;
        }
    });
});
