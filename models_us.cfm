<cfset datasource = "vehicles_2012">
<cfif structKeyExists(form, "year") and structKeyExists(form, "make")>
<cfset model_year = #form.year#>
<cfset make = #form.make#>
<cfquery name="GetModels" datasource="#datasource#">
select model from vehicles_full where year ='#model_year#' and make='#make#' and sold_in_us='1' group by model ASC
</cfquery>

<cfoutput>
<option> -- YOUR MODEL --</option>
<cfloop query="GetModels">
<option value="#model#">#model#</option>
</cfloop>
</cfoutput>
</cfif>