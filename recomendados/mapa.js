function iniciarMap(){
    var coord ={lat:31.6316157,lng:-106.3712372};
    var map = new google.maps.Map(document.getElementById('map'),{
        zoom: 18,
        center:coord
    });
        var marker = new google.maps.Marker({
        position : coord,
        map:map
         });
 }

