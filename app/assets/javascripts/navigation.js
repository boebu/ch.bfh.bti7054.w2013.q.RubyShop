/**
 * Created by boebu on 12/3/13.
 */

$(".shopnav li").click(function(e) {
    e.stopPropagation();
    var obj = $(this);
    var ids = [obj.attr('rel')];
    var fetchChildrenIds = function(parentLi) {
        var childrenLi = parentLi.children('ul').children('li');
        if (childrenLi.length) {
            ids.push(childrenLi.attr('rel'));
            fetchChildrenIds(childrenLi);
        }
    };
    fetchChildrenIds(obj);
    obj.children("ul").toggle();
    $.get("/items/shoplist", {categories: ids}, function(data) {
        $("#items").html(data);
    });
});
