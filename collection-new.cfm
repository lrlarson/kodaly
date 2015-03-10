<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com-->
<!-- Last Published: Fri Aug 15 2014 20:07:30 GMT+0000 (UTC) -->
<html data-wf-site="53cd80265e9467273b6889b0" data-wf-page="53ee4154765d4a091a51e597">
<head>
  <meta charset="utf-8">
  <title>Collection (New) - Kodaly</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="generator" content="Webflow">
  <link rel="stylesheet" type="text/css" href="css/normalize.css">
  <link rel="stylesheet" type="text/css" href="css/webflow.css">
  <link rel="stylesheet" type="text/css" href="css/kodaly.webflow.css">
  <link rel="stylesheet" type="text/css" href="css/dropdown.css" />
  <link rel="stylesheet" type="text/css" href="js/AutoComplete/styles/AutoComplete.css" />
   <link rel="shortcut icon" type="image/x-icon" href="https://daks2k3a4ib2z.cloudfront.net/placeholder/favicon.ico">
  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script>
  <script>
    WebFont.load({
      google: {
        families: ["Droid Sans:400,700"]
      }
    });
  </script>
  <script type="text/javascript" src="https://use.typekit.net/djl2qnj.js"></script>
  <script type="text/javascript">
    try{Typekit.load();}catch(e){}
  </script>
  <script type="text/javascript" src="js/modernizr.js"></script>
  <!--- get all fixed data --->
   <cfscript>
kodalyData = CreateObject("Component","data/kodalyData");
kodalyData.init();
songCount = kodalyData.getCount();
regions = kodalyData.getRegions();
states = kodalyData.getStates();
ethnicities = kodalyData.getEthnicity();
songTypes = kodalyData.getSongTypes();
subjects = kodalyData.getSubjectHeading();
forms = kodalyData.getForms();
scales = kodalyData.getScales();
notes  = kodalyData.getNotes();
melodicElements = kodalyData.getMelodicElements();
rythmicElements = kodalyData.getRythmicElements();
meters = kodalyData.getMeters();
formType = kodalyData.getFormType();
toneSets = kodalyData.getToneSets();
gameTypes = kodalyData.getGameTypes();
melContexts = kodalyData.getMelodicContextsList();
motivesList = kodalyData.getMotiveList();
</cfscript>
  <script>
  	var totalCount;
	totalCount = <cfoutput>#songCount.totalNumberOfSongs#</cfoutput>
  </script>
</head>
<body>
  <div class="w-container main-wrapper">
    <div class="w-hidden-tiny top_bar"><a class="top_bar" href="http://www.hnu.edu/index.php">← &nbsp;Holy Names University</a>
    </div>
    <header class="w-hidden-tiny header-wrapper">
      <div class="w-container header">
        <div class="w-row">
          <div class="w-col w-col-3 w-col-small-3">
            <a class="w-inline-block" href="http://www.hnu.edu/index.php">
              <img class="w-hidden-tiny hnu_logo" src="images/hnu_logo.svg" width="260" alt="53cea74d63c0a8f8269a5ad6_hnu_logo.svg">
            </a>
          </div>
          <div class="w-col w-col-9 w-col-small-9">
            <a class="w-inline-block kodaly-header" href="index.html">
              <div class="kodaly-header-link">Kodály Center for Music Education</div>
              <div class="collection-title">The American Folk Song Collection</div>
            </a>
          </div>
        </div>
      </div>
    </header>
    <nav>
      <div class="w-nav navbar" data-collapse="tiny" data-animation="default" data-duration="400">
        <div class="w-hidden-main w-hidden-medium w-hidden-small mobile-header">
          <img src="images/logos_mobile.svg" width="268" alt="53ceec5963c0a8f8269a60e0_logos_mobile.svg">
        </div>
        <nav class="w-nav-menu nav-menu" role="navigation"><a class="w-nav-link nav-link" href="the-kodaly-vision.cfm">the kodály vision</a><a class="w-nav-link nav-link" href="the-kodaly-center.cfm">the kodály center</a><a class="w-nav-link nav-link" href="news.cfm">news</a><a class="w-nav-link nav-link" href="collection.html">search the collection</a>
        </nav>
        <div class="w-nav-button menu-button">
          <div class="w-icon-nav-menu"></div>
        </div>
      </div>
    </nav>
  </div>
  <div class="w-container search-header">
    <div class="w-clearfix search-title">
      <div class="search-title">Search the Collection</div>
    </div>
    <div class="search-results-count" id="countDisplay"><!---insert rendered here ---> </div>
    <script id="count-template" type="x-handlebars-template">
	{{{whatCountDisplay number}}}
 	</script>
   
    <div class="search-show-all" id="showAllDisplay"><!---insert rendered here ---> </div>
    <script id="all-template" type="x-handlebars-template">
	{{{showAllDisplay number}}}
	</script>
    </div>
  <div class="w-container main-content-search">
    <div class="w-row">
      <div class="w-col w-col-4 sidebar">
        <div class="search-wrapper">
          <a class="w-inline-block search-icon" href="#">
            <img src="images/icon_search.svg" width="30" alt="53d671d6ad790af81f1ed8d2_icon_search.svg">
          </a>
          <div>
              <input class="input" id="search" type="text" placeholder="Search by Title" name="Search" data-name="search" onClick="handleSearchChange()">
          </div>
        </div>
        
        <div class="w-clearfix refine-search"><a class="reset-button" href="#" onClick="reset();">Reset</a>
          <div>Refine Search</div>
        </div>
        <div class="filter-wrapper">
          <div class="w-embed">
          <span class="css3-metro-dropdown">
              <select name="selectEthnic" id="selectEthnic" onChange="handleSearchChange(event)">
                          <option selected value="-1">Origin</option>
                          <option value="-1">All Ethnicities</option>
                          <cfoutput query="ethnicities">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                        </select></span>
            <span class="css3-metro-dropdown">
              <select name="selectRegion" id="selectRegion" onChange="handleSearchChange(event)">
                          <option selected value="-1">Region</option>
                          <option value="-1">All Regions</option>
                         	<cfoutput query="regions">
                              <option value="#data#">#label#</option>
                            </cfoutput>	
                        </select></span>
            <span class="css3-metro-dropdown">  
              <select name="selectStates" id="selectStates" onChange="handleSearchChange(event)">
                          <option selected value="-1">State</option>
                          <option value="-1">All States</option>
                          <cfoutput query="states">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                        </select></span>
            <span class="css3-metro-dropdown">  
              <select name="selectSubject" id="selectSubject" onChange="handleSubjectChoice();handleSearchChange(event);">
                          <option selected value="-1">Subject</option>
                          <option value="-1">All Subjects</option>
                         
						  <cfoutput query="subjects">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                         
                        </select></span>
              <span class="css3-metro-dropdown" id="subTableRow">  
              <select name="selectSubSubject" id="selectSubSubject" onChange="handleSearchChange(event)"><!---really insert here>---></select>
                         <script id="subSubject-template" type="x-handlebars-template">
                          <option selected value="-1">Sub-Subject</option>
                          <option value="-1">All Sub-Subjects</option>
						  {{#each data}}
                          <option value="{{data}}">{{label}}</option>
						  {{/each}}
                          </script></span>           
            <span class="css3-metro-dropdown">
              <select name="selectSongType" id="selectSongType" onChange="handleSearchChange(event)">
                          <option selected value="-1">Song Type</option>
                          <option value="-1">All Song Types</option>
                          <cfoutput query="songTypes">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                        </select></span>
            <span class="css3-metro-dropdown">  
              <select name="selectGrades" id="selectGrades" onChange="handleSearchChange(event)">
                <option selected value="_none">School Grade Level</option>
                <option value="_none">Any Grade</option>
                <option value="Pre-K">Pre-Kindergarten</option>
                <option value="K">Kindergarten</option>
                <option value="1">First Grade</option>
                <option value="2">Second Grade</option>
                <option value="3">Third Grade</option>
                <option value="4">Fourth Grade</option>
                <option value="5">Fifth Grade</option>
                <option value="6">Sixth Grade</option>
                <option value="7">Seventh Grade</option>
                <option value="8">Eigth Grade</option>
                <option value="HS">High School</option>
                <option value="Older Beginner">Older Beginner</option>
              </select></span>
            <span class="css3-metro-dropdown">  
              <select name="selectNotes" id="selectNotes" onChange="handleSearchChange(event)">
                          <option selected value="-1">Tonal Center</option>
                          <option value="-1">All Tonal Centers</option>
                          <cfoutput query="notes">
                         <option value="#data#">#label#</option>
                          </cfoutput>
                          </select></span>
           <span class="css3-metro-dropdown">
              <select name="selectScale" id="selectScale" onChange="handleSearchChange(event)">
                          <option selected value="-1">Scale</option>
                          <option value="-1">All Scales</option>
                          <cfoutput query="scales">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                        </select></span>
            <span class="accordion">
              <span class="small-label">Tone Set</span>    
              <input type="text" class="tone-set"  id="toneSetData" placeholder="Begin Typing Toneset ..." name="toneSetData">
              <input type="submit" class="apply" name="submit" id="submit" value="Apply" onClick="handleSearchChange(event)">
             </span>
              <span class="css3-metro-dropdown">
             <select name="selectRange" id="selectRange" onChange="handleSearchChange(event)">
                          <option selected value="-1">Melodic Range</option>
                          <option value="-1">All Melodic Ranges</option>
                          <option value="1">Less than a M6th</option>
                           <option value="2">minor or Major 7th</option>
                           <option value="3">Octave or Greater</option>
                        </select></span>
            <span class="css3-metro-dropdown">  
              <select name="selectMelodicElements" id="selectMelodicElements" onChange="handleMelodicElementChoice();handleSearchChange(event)">
                          <option selected value="-1">Melodic Element</option>
                          <option value="-1">All Melodic Elements</option>
                          <cfoutput query="melodicElements">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                        </select></span>
             <span class="accordion" id="melodicContextArea">
                 <span class="small-label">Melodic Context</span>  
                  <input type="text" class="tone-set"  placeholder="Type Melodic Context..." id="melContextBox">
                  <input type="submit" class="apply" name="submit" id="submit" value="Apply" onClick="handleSearchChange(event)">
                  </span>
             <span class="accordion">
             <span class="small-label">Melodic Motive</span>      
              <input type="text" class="tone-set" id="motiveContextBox" placeholder="Type Melodic Motive">
              <input type="submit" class="apply" name="submit" id="submit" value="Apply" onClick="handleSearchChange(event)"> 
              </span>
             <span class="css3-metro-dropdown"> 
              <select name="selectRythmicElements" id="selectRythmicElements" onChange="handleSearchChange(event)">
                          <option selected value="-1">Rhythmic Element</option>
                          <option value="-1">All Rhythmic Elements</option>
                          <cfoutput query="rythmicElements">
                         <option value="#data#">#label#</option>
                          </cfoutput>
                        </select></span>
             <span class="css3-metro-dropdown">
              <select name="selectMeters" id="selectMeters" onChange="handleSearchChange(event)">
                          <option selected value="-1">Meter</option>
                          <option calue="-1">All Meter</option>
                          <cfoutput query="meters">
                         <option value="#data#">#label#</option>
                          </cfoutput>
                        </select></span>
             <span class="css3-metro-dropdown">
              <select name="selectForms" id="selectForms" onChange="handleSearchChange(event)">
                          <option selected value="-1">Form Type</option>
                          <option value="-1">All Form Types</option>
                          <cfoutput query="formType">
                          <option value="#data#">#label#</option>
                          </cfoutput>                        
                          </select></span>
            <span class="css3-metro-dropdown">
               <select name="selectFormAnalysis" id="selectFormAnalysis" onChange="handleSearchChange(event)">
                          <option selected value="-1">Formal Analysis</option>
                          <option value="-1">All Formal Analyses</option>
                          <cfoutput query="forms">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                        </select></span>
        <span class="css3-metro-dropdown">
             <select name="selectGameTypes" id="selectGameTypes" onChange="handleGameChoice();handleSearchChange(event);">
                          <option selected value="-1">GameType</option>
                          <option value="-1">All Game Types</option>
                          <cfoutput query="gameTypes">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                        </select></span>
         <span class="css3-metro-dropdown" id="subGameRow">
             <select name="selectSubGame" id="selectSubGame" onChange="handleSearchChange(event)"><!---really insert here>---></select>
                         <script id="subGame-template" type="x-handlebars-template">
                          <option selected value="-1">Sub-Game</option>
                          <option value="-1">All Sub-Games</option>
						  {{#each data}}
                          <option value="{{data}}">{{label}}</option>
						  {{/each}}
                          </script></span>                
                        
          </div>
        </div>
      </div>
      <div class="w-col w-col-8 column">
        <div class="w-embed w-hidden-tiny collection-index-large">
          <table class="collection-index" width="100%" border="0" cellpadding="10" cellspacing="3">
            <tbody id="titlesDisplay"><!---insert rendered here ---></tbody>
            <script id="titles-grid-template" type="x-handlebars-template">
              <tr height="80px" style="background-color: #b4b4af;">
                <td class="table-label">Title</td>
                <td width="12%" align="center" class="table-label">Recording</td>
                <td width="12%" align="center" class="table-label">Library of
                  <br>Congress</td>
                <td width="12%" align="center" class="table-label">Child
                  <br>Informant</td>
                <td width="12%" align="center" class="table-label">Game</td>
              </tr> 
			  {{#each data}}
				<tr>
					<td><a href="song.cfm?id={{id}}">{{title}}</a>
					</td>
					<td width="12%" align="center">&nbsp;
					{{{hasRecording recording_flag}}}</td>
					<td width="12%" align="center">&nbsp;
					{{{isLOC loc}}}</td>
					<td width="12%" align="center">&nbsp;
					{{{isChild child}}}</td>
					<td width="12%" align="center">&nbsp;
					{{{isGame game}}}</td>
				</tr>
      		  {{/each}}           
			  </script>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
    <div class="w-embed w-hidden-main w-hidden-medium w-hidden-small collection-index-small">
      <table class="collection-index" width="100%" border="0" cellpadding="10" cellspacing="3">
        <tbody id="mobileTitles"><!--- insert rendered here ---></tbody>
          <script id="titles-mobile" type="x-handlebars-template">
          <tr>
            <td class="table-label" style="background-color: #b4b4af;">Title</td>
          </tr>
          {{#each data}}
            <tr>
                <td><a href="song.cfm?id={{id}}">{{title}}</a>
                </td>
            </tr>
			{{/each}}
		  </script>
      </table>
    </div>
  <div>
    <div class="w-container footer">
      <div class="w-row">
        <div class="w-col w-col-8 w-col-small-8 w-clearfix">
          <a class="w-hidden-tiny w-inline-block footer-logo" href="http://www.hnu.edu/index.php">
            <img src="images/hnu_logo_stack.svg" width="100" alt="53cf24aaba039f772c45b0a6_hnu_logo_stack.svg">
          </a>
          <div class="footer-address">
            <p class="footer-p">Kodály Center for Music Education&nbsp;
              <br>3500 Mountain Boulevard&nbsp;
              <br>Oakland, CA 94619&nbsp;
              <br>510-436-1000</p>
          </div>
        </div>
        <div class="w-col w-col-4 w-col-small-4">
          <div class="social-media-wrapper">
            <a class="w-inline-block footer-social-media-icon" href="#">
              <img src="images/icon_facebook.svg" alt="Facebook" width="50">
            </a>
            <a class="w-inline-block footer-social-media-icon" href="#">
              <img src="images/icon_twitter.svg" alt="Twitter" width="50">
            </a>
            <a class="w-inline-block footer-social-media-icon" href="#">
              <img src="images/icon_youtube.svg" alt="YouTube" width="50">
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="w-container footer-bar">
      <div class="w-row">
        <div class="w-col w-col-7">
          <div>
            <div class="footer-funder">Made possible with support from The William and Flora Hewlett Foundation</div>
          </div>
        </div>
        <div class="w-col w-col-5"><a class="footer-bar-link" href="glossary.cfm">Glossary</a><a class="footer-bar-link" href="bibliography.cfm">Bibliography</a><a class="footer-bar-link" href="#">Join Mailing List</a>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript" src="js/webflow.js"></script>
  <script src="http:	//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
  <script src="js/AutoComplete/classes/AutoComplete.js"></script>
  <script src="js/typeAhead.js"></script>
  <script src="js/Handlebars.js"></script>
  <script src="js/jquery.serializecfjson-0.2.min.js"></script>
  <script type="text/javascript" src="js/kodaly.js"></script>
  <!--[if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
  <script>
  (function() {
            "use strict";
            
            // instantiate widget's object
            window.autocomplete = new AcidJs.AutoComplete({
                //skin: "Windows7", // {String} [optional] default: "Windows7"
                //appRoot: "path/to/widget/" {String} [optional] path to the AcidJs.AutoComplete folder, default: ""
                //search: "fuzzy" // {String} [optional] type of search "exact" exact match in the beginning of the entry or "fuzzy" - any match, default: "exact"
            });
            
            // tonesets
            window.autocomplete.enable({
                input: $("#toneSetData"), // {jQueryDomNode} [required] id of the input that will be enabled as autocompletable
                skin: "Windows7", // {String} [optional] default: "Windows7"
                sort: false, // {Boolean} [optional] sort array alphabetically, default: true
                //search: "fuzzy", // {String} [optional] type of search "exact" exact match in the beginning of the entry or "fuzzy" - any match, default: "exact"
                data: [
                    <cfoutput query="toneSets">
					"#toneSetID#",
					 </cfoutput>
					]
            });
			
			//contexts
			 window.autocomplete.enable({
                input: $("#melContextBox"), // {jQueryDomNode} [required] id of the input that will be enabled as autocompletable
                skin: "Windows7", // {String} [optional] default: "Windows7"
                sort: false, // {Boolean} [optional] sort array alphabetically, default: true
                //search: "fuzzy", // {String} [optional] type of search "exact" exact match in the beginning of the entry or "fuzzy" - any match, default: "exact"
                data: [
                    <cfoutput query="melContexts">
					"#melContext#",
					</cfoutput>

					]
            });
			
			//motives
			 window.autocomplete.enable({
                input: $("#motiveContextBox"), // {jQueryDomNode} [required] id of the input that will be enabled as autocompletable
                skin: "Windows7", // {String} [optional] default: "Windows7"
                sort: false, // {Boolean} [optional] sort array alphabetically, default: true
                //search: "fuzzy", // {String} [optional] type of search "exact" exact match in the beginning of the entry or "fuzzy" - any match, default: "exact"
                data: [
					<cfoutput query="motivesList">
					"#motive#",
					</cfoutput>

					]
            });
        })();    
        </script> 
  

  

			

  
  <script>
  $( document ).ready(function() {
	$( ".submitToSearch" ).click(function() {
			handleSearchChange();			
});
$("#search").keyup(function(event){
    		if(event.keyCode == 13){	
        	handleSearchChange();
			//$(".search-box").blur();
    }
});
	init();
	handleSearchChange();
});
</script>
</body>
</html>