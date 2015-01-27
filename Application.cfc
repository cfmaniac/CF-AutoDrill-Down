 <cfcomponent displayname="Application" hint="The Mojito Application.cfc" output="yes">
 <cfscript>
 //Sets up the THIS Scope
 this.name = "Vehicle Selector 2.0.0";
 this.subname ="";
 this.sessionManagement = true;
 this.loginStorage="session";
 this.sessionTimeout = createTimeSpan(0,0,60,0);
 //Sets Up All the Variables
 request.master.cfcPath = "core.components";
 request.master.name = #this.name#;
 request.master.subname = #this.subname#;
 

			
			
 //Set Application Variables - These are Global Regardless of Domain
 request.name = this.name;
 request.datasource = "Vehicles_2012";
 
 </cfscript>
 
	<cffunction name="onApplicationStart">
		<cfheader name="Expires" value="-1">
        <cfheader name="Pragma" value="no-cache">
        <cfheader name="cache-control" value="no-cache, no-store, must-revalidate">
        
            
         <cfreturn true> 
     
     
	</cffunction>

	<cffunction name="onSessionStart">
		<cfscript>
			//session.user = CreateObject('component','#request.master.cfcPath#.Mojito').SessionInit();
		</cfscript>
         <!---set cfid/cftoken as non-persistent cookies so session ends on browser close --->
        <cfif not IsDefined("Cookie.CFID")>
            <cflock scope="session" type="readonly" timeout="5">
                <cfcookie name="CFID" value="#session.CFID#">
                <cfcookie name="CFTOKEN" value="#session.CFTOKEN#">
                 <cfset session.SessionStartTime = Now() />
            </cflock>
        </cfif>
        
        <cfreturn />	
	</cffunction>
	
	<cffunction name="onRequestStart">
    
    
   
        <cfif isdefined('url.reinit') and url.reinit EQ "1">
        <cfset OnApplicationStart() />
        <cflocation addtoken="no" url="index.cfm">
        </cfif>
        
        <cfset session.RequestStartTime = Now() />
        <!---number of seconds until session times out--->
        <cfset session.timeoutLength = 30 />
        <cfreturn true />
		
        
		
	</cffunction>
	
	<cffunction name="onRequest">
		<cfargument name="thePage" type="string" required="true">
		
        <cfinclude template="#arguments.thePage#">
	</cffunction>
	
	<cffunction name="onRequestEnd">
		<cfif StructKeyExists(request, "relocate")>
			<script>window.location = '<cfoutput>#JSFormat(request.relocate)#</cfoutput>';</script>
		</cfif>
		<cfif isDefined("returnMessage")>
			<!--- TODO: Get rid of this annoying crap. Replace with a jQuery modal --->
			<script>alert("<cfoutput>#JSFormat(returnMessage)#</cfoutput>")</script>	
		</cfif>
	</cffunction>
    
   <cffunction name="onApplicationEnd" returnType="void" output="false">
   <cfargument name="applicationScope" required="true">

   </cffunction>

</cfcomponent>