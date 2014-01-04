/**
 * Created by boebu on 12/3/13.
 */

$(".shopnav li").click(function(e) {
    e.stopPropagation();
    var obj = $(this);
    var parentLi = obj.parent('ul').parent('li');
    var ids = [obj.attr('rel')];
    obj.children("ul").toggle();
    while (parentLi.length) {
        ids.push(parentLi.attr('rel'));
        parentLi = parentLi.parent('ul').parent('li');
    }
    console.log("Ids to fetch: " + ids.join(', '));
});
