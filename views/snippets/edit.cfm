<script type="text/javascript">
  $(document).ready(function(){
  	$('#snippet-content').markItUp(mySettings);
  });
</script>

<div class="page-properties">
  <button id="viewSite" class="ui-button ui-state-default ui-corner-all" onclick="window.location('/admin/snippets/new');">New Snippet</button>
  <button id="viewSite" class="ui-button ui-state-default ui-corner-all" onclick="window.open('/');">View Site</button>
</div>

<h1>Edit Snippet</h1>

<cfoutput>
			
	#errorMessagesFor("snippet")#
	
	#startFormTag(route="update_snippet_path", key=params.key, class="form")#
		
		#includePartial('form')#
				
		#submitTag(class="ui-button ui-state-default ui-corner-all", value="Update Snippet &rarr;")# or #linkTo(text="Cancel", route="snippets_path")#
				
	#endFormTag()#
	
	<cfif snippet.updatedByID is NOT "">
	  #includePartial(name='/shared/last_update', updatedByID=snippet.updatedByID, updatedAt=snippet.updatedAt)#
	</cfif>
</cfoutput>