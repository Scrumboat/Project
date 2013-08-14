function enabledisablenext() {
	    var boxeschecked = 0;
    for (var i = 1; i<= 5; i++) {
        if(document.getElementById("c" + i).checked == true){ 
        boxeschecked ++;
        }
    }
    if (boxeschecked == 2) {document.getElementById("button").disabled= true;}
    if (boxeschecked != 2) {document.getElementById("button").disabled= false;}

}