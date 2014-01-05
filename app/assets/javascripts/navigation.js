// selection
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
    $(".shopnav li").removeClass('active');
    obj.addClass('active');
    $.get("/items/shoplist", {categories: ids}, function(data) {
        $("#items").html(data);
    });
});

//toggle
$(".shopnav .nav-toggle").click(function(event) {
    event.stopPropagation();
    var obj = $(this);
    obj.closest('li').children('ul').toggle();
    obj.toggleClass('foundicon-plus').toggleClass('foundicon-minus');
});