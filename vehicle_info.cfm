<cfset datasource = "vehicles_2012">
<cfif structKeyExists(url, "year") and structKeyExists(url, "make") and structKeyExists(url, "model")>
<cfset year = #url.year#>
<cfset make = #url.make#>
<cfset model= #url.model#>
<cfset vtrim = #url.vtrim#>

<cfquery name="GetInfo" datasource="#datasource#">
select * from vehicles_full where year='#year#' and make='#make#' and model='#model#' and trim='#vtrim#'
</cfquery>

<cfoutput query="GetInfo">
<strong>Engine & Drivetrain</strong><br />
Engine Type: #engine_type#<br />
Cylinders: #engine_num_cyl#<br />
Fuel Type: #engine_fuel#<br />
Compression Ratio: #engine_compression#<br />
Horspower: #engine_power_ps#<br />
Torque: #engine_torque_nm#<br />
DriveTrain Type: #drive_type#<br />
Displacement: #engine_cc# (CC) / #NumberFormat((engine_cc * 0.0610237438368 * 100) / 100, "0.00")# (CI)<br />

<hr />
<strong>Dimensions</strong>
Body Style: #body_style#<br />
Engine Placement: #engine_position#<br />
Length: #length_mm# (mm) / #NumberFormat((length_mm /25.4 * 100) / 100, "0.00")# (in)<br />
Width: #width_mm# (mm) / #NumberFormat((width_mm /25.4 * 100) / 100, "0.00")# (in)<br />
Height: #height_mm# (mm) / #NumberFormat((height_mm /25.4 * 100) / 100, "0.00")# (in)<br />
Doors: #doors#<br />
Seats: #seats#<br />
Wheelbase: #wheelbase_mm# (mm) / #NumberFormat((wheelbase_mm /25.4 * 100) / 100, "0.00")# (in)<br />
Fuel Capacity: #model_fuel_cap_l# (L) / #NumberFormat((model_fuel_cap_l /3.8 * 100) / 100, "0.00")# (US GAL)<br />
</cfoutput>
</cfif>