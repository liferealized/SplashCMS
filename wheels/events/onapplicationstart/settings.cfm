<cfscript>
	// rewrite settings based on web server rewrite capabilites
	if (Right(cgi.script_name, 12) == "/rewrite.cfm")
		application.wheels.URLRewriting = "On";
	else if (Len(cgi.path_info))
		application.wheels.URLRewriting = "Partial";
	else
		application.wheels.URLRewriting = "Off";
	
	// set datasource name to same as the folder the app resides in
	application.wheels.dataSourceName = LCase(ListLast(this.rootDir, Right(this.rootDir, 1)));
	application.wheels.dataSourceUserName = "";
	application.wheels.dataSourcePassword = "";

	// settings that depend on the environment
	application.wheels.cacheDatabaseSchema = false;
	application.wheels.cacheFileChecking = false;
	application.wheels.cacheImages = false;
	application.wheels.cacheModelInitialization = false;
	application.wheels.cacheControllerInitialization = false;
	application.wheels.cacheRoutes = false;
	application.wheels.cacheActions = false;
	application.wheels.cachePages = false;
	application.wheels.cachePartials = false;
	application.wheels.cacheQueries = false;
	application.wheels.showDebugInformation = true;
	application.wheels.showErrorInformation = true;
	application.wheels.sendEmailOnError = false;
	application.wheels.errorEmailAddress = "";

	// override settings for specific environments
	if (application.wheels.environment != "design")
	{
		application.wheels.cacheDatabaseSchema = true;
		application.wheels.cacheFileChecking = true;
		application.wheels.cacheImages = true;
		application.wheels.cacheModelInitialization = true;
		application.wheels.cacheControllerInitialization = true;
		application.wheels.cacheRoutes = true;
	}
	if (application.wheels.environment != "design" && application.wheels.environment != "development")
	{
		application.wheels.cacheActions = true;
		application.wheels.cachePages = true;
		application.wheels.cachePartials = true;
		application.wheels.cacheQueries = true;
		application.wheels.showDebugInformation = false;
	}
	if (application.wheels.environment == "production")
	{
		application.wheels.showErrorInformation = false;
		if (cgi.server_name Contains ".")
		{
			application.wheels.sendEmailOnError = true;
			application.wheels.errorEmailAddress = "webmaster@" & Reverse(ListGetAt(Reverse(cgi.server_name), 2,".")) & "." & Reverse(ListGetAt(Reverse(cgi.server_name), 1, "."));
		}
	}

	// miscellaneous settings
	application.wheels.tableNamePrefix = "";
	application.wheels.obfuscateURLs = false;
	application.wheels.reloadPassword = "";
	application.wheels.softDeleteProperty = "deletedAt";
	application.wheels.timeStampOnCreateProperty = "createdAt";
	application.wheels.timeStampOnUpdateProperty = "updatedAt";
	application.wheels.ipExceptions = "";
	application.wheels.overwritePlugins = true;
	application.wheels.loadIncompatiblePlugins = true;
	
	// caching settings
	application.wheels.maximumItemsToCache = 5000;
	application.wheels.cacheCullPercentage = 10;
	application.wheels.cacheCullInterval = 5;
	application.wheels.defaultCacheTime = 60;

	// function defaults
	application.wheels.average = {distinct=false};
	application.wheels.belongsTo = {dependent=true};
	application.wheels.buttonTo = {onlyPath=true, host="", protocol="", port=0, text="", confirm="", image="", disable=""};
	application.wheels.caches = {time=60};
	application.wheels.checkBox = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", errorElement="span", checkedValue=1, unCheckedValue=0};
	application.wheels.checkBoxTag = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", value=1};
	application.wheels.create = {parameterize=true, defaults=true};
	application.wheels.dateSelect = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", errorElement="span", includeBlank=false, order="month,day,year", separator=" ", startYear=Year(Now())-5, endYear=Year(Now())+5, monthDisplay="names"};
	application.wheels.dateSelectTags = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", includeBlank=false, order="month,day,year", separator=" ", startYear=Year(Now())-5, endYear=Year(Now())+5, monthDisplay="names"};
	application.wheels.dateTimeSelect = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", errorElement="span", includeBlank=false, dateOrder="month,day,year", dateSeparator=" ", startYear=Year(Now())-5, endYear=Year(Now())+5, monthDisplay="names", timeOrder="hour,minute,second", timeSeparator=":", minuteStep=1, separator=" - "};
	application.wheels.dateTimeSelectTags = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", includeBlank=false, dateOrder="month,day,year", dateSeparator=" ", startYear=Year(Now())-5, endYear=Year(Now())+5, monthDisplay="names", timeOrder="hour,minute,second", timeSeparator=":", minuteStep=1, separator=" - "};
	application.wheels.daySelectTag = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", includeBlank=false};
	application.wheels.delete = {parameterize=true};
	application.wheels.deleteAll = {parameterize=true, instantiate=false};
	application.wheels.distanceOfTimeInWords = {includeSeconds=false};
	application.wheels.errorMessageOn = {prependText="", appendText="", wrapperElement="span", class="error-message"};
	application.wheels.errorMessagesFor = {class="error-messages", showDuplicates=true};
	application.wheels.exists = {reload=false, parameterize=true};
	application.wheels.fileField = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", errorElement="span"};
	application.wheels.fileFieldTag = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel=""};
	application.wheels.findAll = {reload=false, parameterize=true, perPage=10, order=""};
	application.wheels.findByKey = {reload=false, parameterize=true};
	application.wheels.findOne = {reload=false, parameterize=true};
	application.wheels.hasMany = {dependent=false};
	application.wheels.hasOne = {dependent=false};
	application.wheels.hiddenField = {};
	application.wheels.hourSelectTag = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", includeBlank=false};
	application.wheels.imageTag = {};
	application.wheels.includePartial = {layout=""};
	application.wheels.javaScriptIncludeTag = {type="text/javascript"};
	application.wheels.linkTo = {onlyPath=true, host="", protocol="", port=0};
	application.wheels.mailTo = {encode=false};
	application.wheels.minuteSelectTag = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", includeBlank=false, minuteStep=1};
	application.wheels.monthSelectTag = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", includeBlank=false, monthDisplay="names"};
	application.wheels.new = {defaults=false};
	application.wheels.paginationLinks = {windowSize=2, alwaysShowAnchors=true, anchorDivider=" ... ", linkToCurrentPage=false, prepend="", append="", prependToPage="", prependOnFirst=true, appendToPage="", appendOnLast=true, classForCurrent="", name="page", showSinglePage=false};
	application.wheels.passwordField = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", errorElement="span"};
	application.wheels.passwordFieldTag = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel=""};
	application.wheels.radioButton = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", errorElement="span"};
	application.wheels.radioButtonTag = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel=""};
	application.wheels.redirectTo = {onlyPath=true, host="", protocol="", port=0, addToken=false, statusCode=302};
	application.wheels.renderPage = {layout=true};
	application.wheels.renderPageToString = {layout=true};
	application.wheels.renderPartial = {layout=""};
	application.wheels.save = {parameterize=true, defaults=true};
	application.wheels.secondSelectTag = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", includeBlank=false};
	application.wheels.select = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", errorElement="span", includeBlank=false, valueField="", textField=""};
	application.wheels.selectTag = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", includeBlank=false, multiple=false, valueField="", textField=""};
	application.wheels.sendEmail = {layout=false, detectMultipart=true};
	application.wheels.sendFile = {disposition="attachment"};
	application.wheels.startFormTag = {onlyPath=true, host="", protocol="", port=0, method="post", multipart=false, spamProtection=false};
	application.wheels.styleSheetLinkTag = {type="text/css", media="all"};
	application.wheels.submitTag = {value="Save changes", image="", disable=""};
	application.wheels.sum = {distinct=false};
	application.wheels.textArea = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", errorElement="span"};
	application.wheels.textAreaTag = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel=""};
	application.wheels.textField = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", errorElement="span"};
	application.wheels.textFieldTag = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel=""};
	application.wheels.timeAgoInWords = {includeSeconds=false};
	application.wheels.timeSelect = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", errorElement="span", includeBlank=false, order="hour,minute,second", separator=":", minuteStep=1};
	application.wheels.timeSelectTags = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", includeBlank=false, order="hour,minute,second", separator=":", minuteStep=1};
	application.wheels.timeUntilInWords = {includeSeconds=false};
	application.wheels.update = {parameterize=true};
	application.wheels.updateAll = {parameterize=true, instantiate=false};
	application.wheels.URLFor = {onlyPath=true, host="", protocol="", port=0};
	application.wheels.validatesConfirmationOf = {message="[property] should match confirmation"};
	application.wheels.validatesExclusionOf = {message="[property] is reserved", allowBlank=false};
	application.wheels.validatesFormatOf = {message="[property] is invalid", allowBlank=false};
	application.wheels.validatesInclusionOf = {message="[property] is not included in the list", allowBlank=false};
	application.wheels.validatesLengthOf = {message="[property] is the wrong length", allowBlank=false, exactly=0, maximum=0, minimum=0, within=""};
	application.wheels.validatesNumericalityOf = {message="[property] is not a number", allowBlank=false, onlyInteger=false};
	application.wheels.validatesPresenceOf = {message="[property] can't be empty"};
	application.wheels.validatesUniquenessOf = {message="[property] has already been taken"};
	application.wheels.verifies = {handler=""};
	application.wheels.yearSelectTag = {label="", wrapLabel=true, prepend="", append="", prependToLabel="", appendToLabel="", includeBlank=false, startYear=Year(Now())-5, endYear=Year(Now())+5};

	// set a flag to indicate that all settings have been loaded
	application.wheels.initialized = true;
</cfscript>