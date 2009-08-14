<cffunction name="contentForLayout" returntype="string" access="public" output="false" hint="Used inside a layout file to output the HTML created in the view.">
	<cfreturn request.wheels.contentForLayout>
</cffunction>

<cffunction name="includePartial" returntype="string" access="public" output="false" hint="Includes a specified file. Similar to using `cfinclude` but with the ability to cache the result and using Wheels specific file look-up. By default Wheels will look for the file in the current controller's view folder. To include a file relative from the `views` folder you can start the path supplied to `name` with a forward slash.">
	<cfargument name="name" type="any" required="true" hint="See documentation for `renderPartial`">
	<cfargument name="cache" type="any" required="false" default="" hint="See documentation for `renderPartial`">
	<cfargument name="layout" type="string" required="false" default="#application.wheels.includePartial.layout#" hint="See documentation for `renderPartial`">
	<cfargument name="spacer" type="string" required="false" default="" hint="HTML or string to place between partials when called using a query">
	<cfargument name="$partialType" type="string" required="false" default="include">
	<cfreturn $includeOrRenderPartial(argumentCollection=$dollarify(arguments, "name,cache,layout,spacer"))>
</cffunction>