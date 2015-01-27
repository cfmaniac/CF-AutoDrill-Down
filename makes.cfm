<cfset datasource = "vehicles_2012">
<cfif structKeyExists(form, "year")>
<cfset model_year = #form.year#>

<cfquery name="GetMakes" datasource="#datasource#">
select make as make from vehicles_full where year ='#model_year#' group by make ASC
</cfquery>


<cfoutput>
<option> -- YOUR MAKE --</option>
<cfloop query="GetMakes">
<option value="#make#">#make#</option>
</cfloop>
</cfoutput>
</cfif>