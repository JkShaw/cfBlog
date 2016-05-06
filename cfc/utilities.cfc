<cfcomponent>
	<cffunction name="convertStringToASCII" output="false" returntype="String" hint="Converts string to asccii string" access="public">
		<cfargument name="stringToBeConverted" type="string" required="true" />
		<cfset var convertedString = '' />
		
		<cfloop from="1" to="#len(arguments.StringToBeConverted)#" index="i">
			<cfset convertedString &= '&##' & asc(mid(arguments.StringTobeConverted,i,1)) & ';' />
		</cfloop>	
		
		<cfreturn convertedString />
	</cffunction>	
</cfcomponent>