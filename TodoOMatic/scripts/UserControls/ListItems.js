var listItemsReady = function () {
    $('.list-item-edit').hide();
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

var showEditName = function (btnClicked) {
    $(btnClicked).parent().parent().children('.list-item-edit-name').slideToggle();
}