 $("#make").html('<option value="">-- All Makes --</option>');
    $("#model").html('<option value="">-- All Models --</option>');
	$("#trim").html('<option value="">-- All Trims --</option>');
    
	var $resultsoutput = $('#results');
    $('#year').change(function getmakes(){
        var year = $("#year").val();
	    
        $.ajax({
               url: "makes_us.cfm",
               global: false,
               type: "POST",
               async: false,
               dataType: "html",
               data: "year="+year, //the name of the $_POST variable and its value
               success: function (response) //'response' is the output provided
                           {
                           $("#make").html(response);
                        /*$(".first").attr({selected: ' selected'});*/
                        
                       }
              });
              return false
    });
    
    $('#make').change(function getmodels(){
        var year = $("#year").val();
        var make = $("#make").val();
        $.ajax({
               url: "models_us.cfm",
               global: false,
               type: "POST",
               async: false,
               dataType: "html",
               data: "year="+ year+"&make="+make, //the name of the $_POST variable and its value
               success: function (response) //'response' is the output provided
                           {
                         //counts the number of dynamically generated options
                        var dynamic_options = $("*").index( $('.dynamic')[0] );
                        //removes previously dynamically generated options if they exists (not equal to 0)
                        if (dynamic_options != (-1)) $(".dynamic").remove();
                        $("#model").html(response);
                        $(".first").attr({selected: ' selected'});                        
                       }
              });
              return false
    });
    $('#model').change(function getstyles(){
        var year = $("#year").val();
        var make = $("#make").val();
        var model = $("#model").val();
        $.ajax({
               url: "trims_us.cfm",
               global: false,
               type: "POST",
               async: false,
               dataType: "html",
               data: "year="+ year+"&make="+make+"&model="+ model, //the name of the $_POST variable and its value
               success: function (response) //'response' is the output provided
                           {
                        //counts the number of dynamically generated options
                        var dynamic_options = $("*").index( $('.dynamic')[0] );
                        //removes previously dynamically generated options if they exists (not equal to 0)
                        if (dynamic_options != (-1)) $(".dynamic").remove();
                        $("#trim").html(response);
                        $(".first").attr({selected: ' selected'});
                        
                       }
              });
              return false
			  
			 
    });     
	
	

    
    $('form#cardbform select').change(function(){
        if (!$(this).val()){ 
            $resultsoutput.html(''); 
            return; 
        }
        
		var content = "<b>You Selected a:</b> " 
            + $('#year').val() + ' '
            + $('#make').val() + ' '
            + $('#model').val() + ' '
            + $('#trim').val() + ' ';
        $resultsoutput.html(content); 
	    $.ajax({
               url: "vehicle_info.cfm",
               global: false,
               type: "GET",
               async: false,
               dataType: "html",
               data: "year="+ $('#year').val()+"&make="+$('#make').val()+"&model="+$('#model').val()+"&vtrim="+$('#trim').val(), //the name of the $_POST variable and its value
               success: function (response) //'response' is the output provided
                           {
                        $("#vehicle_info").html(response);
                        
                       }
              });
              return false
    });
	
	