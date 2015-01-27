<cfset datasource = "vehicles_2012">
<cfif structKeyExists(form, "year") and structKeyExists(form, "make") and structKeyExists(form, "model")>
<cfset year = #form.year#>
<cfset make = #form.make#>
<cfset model= #form.model#>
<cfquery name="GetTrims" datasource="#datasource#">
select trim from vehicles_full where year='#year#' and make='#make#' and model='#model#' and sold_in_us='1' GROUP BY trim
</cfquery>

<cfoutput>
<option> -- YOUR TRIM --</option>
<cfloop query="GetTrims">
<option value="#trim#">#trim#</option>
</cfloop>
</cfoutput>
</cfif>