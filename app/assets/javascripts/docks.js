jQuery(document).ready(function($) {
    jQuery("#freakingdockshowdotheywork input[type=checkbox]").click(function() {
        $("#error").html("");
        var boat_id = $(this).attr("id");
        if ($(this).hasClass("selected")) {
            unset_id(boat_id);
            $(this).removeClass("selected");
        } else {
            var onnistui = set_id(boat_id, this);
            if (onnistui) {
                $(this).addClass("selected");
            }
        }
    });
});

function set_id(id, olio) {
    var eka = $("#paikka1");
    var toka = $("#paikka2");
    console.log(eka.val());
    if (eka.val() === "") {
        eka.val(id);
    } else if (toka.val() === "") {
        toka.val(id);
    } else {
        $("#error").html("Vain kaksi venettä voi olla samanaikaisesti valittuna");
        $(olio).removeAttr("checked");
        return false;
    }
    return true;
}

function unset_id(id) {
    var eka = $("#paikka1");
    var toka = $("#paikka2");
    if (eka.val() === id) {
        eka.val("");
    } else if (toka.val() === id) {
        toka.val("");
    }
}
