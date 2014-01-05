$(".language").click(function (event) {
    event.preventDefault();
    $.post("/set_lang", {lang: $(this).text()}, function () {
        location.reload();
    });

});