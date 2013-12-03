/**
 * Created by boebu on 12/3/13.
 */

$("li").click(function(e) {
    $(this).siblings("ul").toggle();
});
