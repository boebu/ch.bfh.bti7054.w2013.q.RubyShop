/**
 * Gets city by zip code
 * @param int zip
 */
function getCityByZip(zip) {
    //  $.getJSON("http://api.geo.admin.ch/main/wsgi/swisssearch/geocoding", {query: zip, format: "raw", no_geom:true},function(response) {
    //      $('#user_info_place').val(response.features[0].properties.ort_27);
    //  });
    var lang = "de";
    $.get("http://maps.googleapis.com/maps/api/geocode/json", {address: zip, sensor: false, region: "ch", language: lang}, function (response) {
        if (response.results.length) {
            $('#user_info_place').val(response.results[0].address_components[1].long_name);
        }
    });
}

$("#user_info_zip").blur(function () {
    getCityByZip($(this).val());
})