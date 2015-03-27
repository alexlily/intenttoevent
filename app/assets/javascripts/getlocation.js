window.MyApp = {}

MyApp.getLocation = function() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(MyApp.showPosition);
	} else {
		console.log("Geolocation is not supported by this browser.");
	}
}

MyApp.showPosition = function(position) {
	var x = jQuery("#myLocation");
	lat = position.coords.latitude;
	lon = position.coords.longitude;
	$.ajax({
		type:"POST",
		url:"/setlocation",
		dataType:"json",
		data:{latitude:lat,longitude:lon},
		success: function(){
			x.text("OK. Got your location: " + lat + lon);			
		},
		failure: function(){
			x.text("it ain't workin.");
		}
	})

	// $('input[type="submit"]').removeAttr('disabled');
	// jQuery("#submitButton").prop('value','OK. Go forth and not make decisions.');
}