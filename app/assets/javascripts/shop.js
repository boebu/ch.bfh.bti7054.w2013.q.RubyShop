$(".language").click(function() {
   //alert($(this).text());
   $.post("/set_lang", {lang: $(this).text()}, function() {
       location.reload();
   });

});