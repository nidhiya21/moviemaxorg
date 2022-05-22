<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>jQuery Autocomplete Example</title>

	<link type="text/css" rel="stylesheet" href="jquery-autocomplete/jquery.autocomplete.css" />
	

	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-autocomplete/1.0.7/jquery.auto-complete.min.js"></script>
</head>

<body>
	<cfif structKeyExists(form, "btnSubmit")>
		<p>
			<cfoutput>You searched for #form.searchPersonText# and found ID #form.personId#</cfoutput>
		</p>
	</cfif>

	<p>
		Please type in the name of the person you are searching for.
		For example, try typing "sel", or "ja".
	</p>

	<form name="frmSearch" id="frmSearch" method="post">
		<input type="text" id="searchPersonText" name="searchPersonText" value="" />
		<input type="hidden" id="personId" name="personId" value="0" />

		<input type="submit" name="btnSubmit" id="btnSubmit" value="Submit" />
	</form>

	<script type="text/javascript">

		$(function() {

			var ExamplePage = function() {
				this.initialize = function() {
					/*
* Initialize the autocomplete. Will call ajax_searchPersons.cfm
* and pass the variable "q" as the query.
*/
					$("#searchPersonText").autocomplete("movies.cfc?searchMovie", {
						width: 300,
						multiple: false,
						formatItem: function(row) {
							return row[1];
						},
						formatResult: function(row) {
							return row[1];
						}
					});

					/*
* When an item is selected from the autocomplete
* dropdown, set the selected ID into the hidden field.
*/
					$("#searchPersonText").result(function(e, data, formatted) {
						$("#personId").val(data[0]);
					});

					/*
* When we blur off the text box we want to make sure
* something is selected. If we've cleared it out zero
* out the hidden field.
*/
					$("#searchPersonText").blur(function(e) {
						if ($("#searchPersonText").val() === "") {
							$("#personId").val("0");
						}
					});

					$("#searchPersonText").focus();
				};

				this.initialize();
			}();

		});

	</script>
</body>
</html>