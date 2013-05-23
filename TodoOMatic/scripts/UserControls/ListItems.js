var listItemsReady = function () {
    $.each($('.list-item-edit'), function (i, obj) {
        if (!($(obj).children('.list-item-edit-error')[0])) {
            $(obj).hide();
        }
    });
}

$(document).ready(listItemsReady);

//var hoverNeighborPrimary = function(button, hoverLeftNeighbor)
//{
//    button = $(button)
//    var neighbor;
//    if (hoverLeftNeighbor) {
//        button.prev().addClass("btn:hover btn-primary:hover");
//    }
//    else {
//        neighbor = button.next().addClass("btn:hover btn-primary:hover");
//    }
//}

/*
TODO convert all of these into one generalized function
*/
var showEditName = function (btnClicked) {
    $(btnClicked).parent().parent().children('.list-item-edit-name').slideToggle();
}

var showEditQty = function (btnClicked) {
    $(btnClicked).parent().parent().parent().parent().children('.list-item-edit-qty').slideToggle();
}