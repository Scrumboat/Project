function hideAll() {
  $(".toimi").hide();
  $(".lisenssi").hide();
  $(".posti").hide();
  $(".maa").hide();
  $(".laivuri").hide();
  $(".varasto").hide();
  $(".avain").hide();
  $(".huom").hide();
  $(".hyvitys").hide();
  $("#filtterit").hide();
}

function toggle(className, obj) {
    var $input = $(obj);
    if ($input.prop('checked')) $(className).show();
    else $(className).hide();
}

function generateIndexNumber() {
    var jno = document.getElementById('member_jno').value.toString();
    while (jno.length < 5) {
        jno = "0" + jno;
    }
    // Lasketaan checksum:
    var sum = 7 * jno.charAt(4);
    sum = sum + 3 * jno.charAt(3);
    sum = sum + 1 * jno.charAt(2);
    sum = sum + 7 * jno.charAt(1);
    sum = sum + 3 * jno.charAt(0);

    var miinustettava = sum;
    while (true) {
       miinustettava++;
       if (miinustettava % 10 == 0) {
        break;
       }
    }
    var checksum = miinustettava - sum;
    if (checksum == 10) {
        checksum = 0;
    }
    alert(checksum);
    var viitenumero = jno + (checksum.toString());
    
    document.getElementById('member_viitenumero').value=viitenumero;
    
}
