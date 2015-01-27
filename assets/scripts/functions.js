$(document).ready(function(){
//Some Lovely Defaults I love to use:

//Disable Enter Key/Go Button/Done Button except on a TextArea
$(document).keypress(function(e) { if (e.keycode == 13 && !$(e.target).is("textarea")) { return false; } });



//Bind Touch Events
$("div").bind('touchend',function() { 
var touched = $("div").index(this); 
});

//By Default We're going to select All Models
$.ajax({
type: "GET",
url: "assets/scripts/all_models.js",
dataType: "script"
}); 

//the Option has changed:
$('#only_us').change(function(){
	if ($('#only_us').val() == "no"){
		//Get ALL Models
		$.ajax({
type: "GET",
url: "assets/scripts/all_models.js",
dataType: "script"
}); 
		alert ('The Utility will check for ALL Makes and Models');
		$('#year, #make, #model, #trim').val('');
		
		
	} else if ($('#only_us').val() == "yes"){
		//Get Only US Models
	   $.ajax({
type: "GET",
url: "assets/scripts/us_models.js",
dataType: "script"
}); 
		alert ('The Utility will check for US Makes and Models ONLY');
	    $('#year, #make, #model, #trim').val('');
	}
});


   
//End the Document.Ready Function	
});