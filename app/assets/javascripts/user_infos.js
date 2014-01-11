
function getCitybyPLZ(plz) {
  //  $.getJSON("http://api.geo.admin.ch/main/wsgi/swisssearch/geocoding", {query: plz, format: "raw", no_geom:true},function(response) {
  //      $('#user_info_place').val(response.features[0].properties.ort_27);
  //  });
    var lang = "de";
    $.get("http://maps.googleapis.com/maps/api/geocode/json", {address:plz,sensor:false,region:"ch", language:lang}, function(response) {
        $('#user_info_place').val(response.results[0].address_components[1].long_name)
    });
}

$("#user_info_zip").blur(function() {
    getCitybyPLZ($(this).val());
})