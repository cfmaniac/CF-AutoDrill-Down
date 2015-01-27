<!DOCTYPE html>
<html>
<head>
	<title>Vehicle Data Selector</title>	
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />    
	<meta name="keywords" content=""></meta>
	<meta name="description" content=""></meta>
	<meta http-equiv="imagetoolbar" content="no" />
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="assets/styles/vehicles.css" media="all" />
    <!--[if IE]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->    
</head>
<body>

<div id="container">

	<header>
    
    	<hgroup>
    		<h1>Vehicle List Selector<sup>2.0.0</sup></h1>    
        	
        </hgroup>
        
        <nav>
        <cfquery name="GetYears" datasource="#request.datasource#">
        select year from vehicles_full group by year DESC
        </cfquery>
        <li>This Updated Version of my Vehicle Selector includes a larger, more detailed database. It also includes the option to select only US Makes and Models</li>
        </nav>
        
    </header>
   
    <div class="cols">
        
        <section class="first col">
        	<form action="#" id="cardbform" method="post" accept-charset="utf-8"> 
            <header>
            	<h3>Select your Vehicle</h3>
            </header>
            <p>Year: <select name="year" id="year" size="1"> 
                        <option value="">-- All Years --</option> 
                    <cfoutput>
                    <cfloop query="getYears">
                    <option value="#year#">#year#</option>
                    </cfloop>
                    </cfoutput>
                    </select> </p>
            <p>Make: <select name="make" id="make" size="1"> 
                        
                    </select> </p>   
            <p>Model:  <select name="model" id="model" size="1"> 
                        
                    </select> </p> 
                    <p>Trim: <select name="trim" id="trim" size="1"> 
                       
                    </select> </p> 
             <p>Show only US Makes and Models: <select name="only_us" id="only_us">
             <option value="no">No</option>
             <option value="yes">Yes</option>
             </select></p>  
            </form>
        </section>
        
        <section class="col">
        	
            <header>
            	<h3>Vehicle Information</h3>
            </header>
            
            <p id="results"></p>
            <p id="vehicle_info"></p>
           
            
        </section>
        
     </div>
     
     
        
	<footer>
    	<p>This Experiment Brought to you by WebDevSourcerer.com; Database of vehciles Compiled for many varied sources. &copy; 2012 WebDevsourcerer.com</p>
	</footer>

</div>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.1.min.js"></script>
<script src="assets/scripts/functions.js"></script>
</body>
</html>