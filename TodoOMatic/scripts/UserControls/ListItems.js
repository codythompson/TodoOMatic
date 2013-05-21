var listItemsReady = function () {
    $('.list-item-edit').hide();
}

$(document).ready(listItemsReady);

//var completedHover = function (hoveredEle, isLeftButton) {
//    hoveredEle = $(hoveredEle);
//    if (isLeftButton) {
//        hoveredEle.next().
//    }
//}

var showEditName = function (btnClicked) {
    $(btnClicked).parent().parent().children('.list-item-edit-name').slideToggle();
}