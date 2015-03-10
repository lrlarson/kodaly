<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>jQuery UI Autocomplete - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <cfscript>
  	kodalyData = CreateObject("Component","data/kodalyData");
	kodalyData.init();
    toneSets = kodalyData.getToneSets();
  </cfscript>

  <script>
  $(function() {
    var availableToneSets = [
	<cfoutput query="toneSets">
	"#toneSetID#",
	</cfoutput>
      
    ];
    $( "#toneSets" ).autocomplete({
      source: availableToneSets
    });
  });
  </script>

</head>
<body>

  <label for="tags">Tags: </label>
  <input id="toneSets">

 
 
</body>
</html>