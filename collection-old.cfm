<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com-->
<!-- Last Published: Mon Jul 28 2014 23:57:37 GMT+0000 (UTC) -->
<html data-wf-site="53cd80265e9467273b6889b0">
<head>
  <meta charset="utf-8">
  <title>Kodály Center for Music Education :: Collection</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="generator" content="Webflow">
  <link rel="stylesheet" type="text/css" href="css/normalize.css">
  <link rel="stylesheet" type="text/css" href="css/webflow.css">
  <link rel="stylesheet" type="text/css" href="css/kodaly.webflow.css">
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
  <link rel="shortcut icon" type="image/x-icon" href="https://daks2k3a4ib2z.cloudfront.net/placeholder/favicon.ico">
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
            <a class="w-inline-block kodaly-header" href="index.cfm">
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
        <nav class="w-nav-menu nav-menu" role="navigation"><a class="w-nav-link nav-link" href="the-kodaly-vision.cfm">the kodály vision</a><a class="w-nav-link nav-link" href="the-kodaly-center.cfm">the kodály center</a><a class="w-nav-link nav-link" href="news.cfm">news</a><a class="w-nav-link nav-link" href="collection.cfm">search the collection</a>
        </nav>
        <div class="w-nav-button menu-button">
          <div class="w-icon-nav-menu"></div>
        </div>
      </div>
    </nav>
  </div>
  <div class="w-container search-bar-wrapper">
    <div>
      <div>
          <input class="w-input advanced-search-bar" id="search" type="text" placeholder="Search by Title or Alternate Title" name="Search" data-name="Search" onClick="handleSearchChange()">
      </div>
    </div>
  </div>
  <div class="w-container">
    <div>
      <div class="advanced-search-filters">
        <div class="w-row">
          <div class="w-col w-col-4">
            <div class="w-embed">
              <table class="advanced-search" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                  <tr>
                    <td>
                      <label>
                        <select name="selectRegion" id="selectRegion" onChange="handleSearchChange(event)">
                          <option selected value="-1">Region</option>
                          <option value="-1">All Regions</option>
                         	<cfoutput query="regions">
                              <option value="#data#">#label#</option>
                            </cfoutput>	
                        </select>
                      </label>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <label>
                        <select name="selectStates" id="selectStates" onChange="handleSearchChange(event)">
                          <option selected value="-1">State</option>
                          <option value="-1">All States</option>
                          <cfoutput query="states">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                        </select>
                      </label>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <label>
                        <select name="selectEthnic" id="selectEthnic" onChange="handleSearchChange(event)">
                          <option selected value="-1">Origin</option>
                          <option value="-1">All Ethnicities</option>
                          <cfoutput query="ethnicities">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                        </select>
                      </label>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <label>
                        <select name="selectSongType" id="selectSongType" onChange="handleSearchChange(event)">
                          <option selected value="-1">Song Type</option>
                          <option value="-1">All Song Types</option>
                          <cfoutput query="songTypes">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                        </select>
                      </label>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <label>
                        <select name="selectSubject" id="selectSubject" onChange="handleSubjectChoice();handleSearchChange(event);">
                          <option selected value="-1">Subject</option>
                          <option value="-1">All Subjects</option>
                         
						  <cfoutput query="subjects">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                         
                        </select>
                      </label>
                    </td>
                  </tr>
                   <tr id="subTableRow">
                    <td>
                      <label id="subSubjectLabel">
                        <select name="selectSubSubject" id="selectSubSubject" onChange="handleSearchChange(event)"><!---really insert here>---></select>
                         <script id="subSubject-template" type="x-handlebars-template">
                          <option selected value="-1">Sub-Subject</option>
                          <option value="-1">All Sub-Subjects</option>
						  {{#each data}}
                          <option value="{{data}}">{{label}}</option>
						  {{/each}}
                          </script>
                        
                      </label>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <label id="gradesLabel">
                        <select name="selectGrades" id="selectGrades" onChange="handleSearchChange(event)">
                          <option selected value="-1">Grades</option>
                          <option value="-1">All Grades</option>
                          <option value="1">Pre-K and K</option>
                          <option value="2">1st and 2nd</option>
                          <option value="3">3rd through 5th</option>
                           <option value="4">Middle School</option>
                           <option value="5">High School</option>
                          <option value="6">Adult</option>
                         </select>
                      </label>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="w-col w-col-4">
            <div class="w-embed">
              <table class="advanced-search" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                  <tr>
                    <td>
                      <label>
                        <select name="selectForms" id="selectForms" onChange="handleSearchChange(event)">
                          <option selected value="-1">Form Type</option>
                          <option value="-1">All Form Types</option>
                          <cfoutput query="formType">
                          <option value="#data#">#label#</option>
                          </cfoutput>                        
                          </select>
                      </label>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <label>
                        <select name="selectScale" id="selectScale" onChange="handleSearchChange(event)">
                          <option selected value="-1">Scale</option>
                          <option value="-1">All Scales</option>
                          <cfoutput query="scales">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                        </select>
                      </label>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <label>
                        <select name="selectRange" id="selectRange" onChange="handleSearchChange(event)">
                          <option selected value="-1">Melodic Range</option>
                          <option value="-1">All Melodic Ranges</option>
                          <option value="1">Less than a M6th</option>
                           <option value="2">Less than an Octave</option>
                           <option value="3">Greater than an Octave</option>
                        </select>
                      </label>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <label>
                        <select name="selectNotes" id="selectNotes" onChange="handleSearchChange(event)">
                          <option selected value="-1">Tonal Center</option>
                          <option value="-1">All Tonal Centers</option>
                          <cfoutput query="notes">
                         <option value="#data#">#label#</option>
                          </cfoutput>
                      </label>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <label>
                        <select name="selectMelodicElements" id="selectMelodicElements" onChange="handleSearchChange(event)">
                          <option selected value="-1">Melodic Element</option>
                          <option value="-1">All Melodic Elements</option>
                          <cfoutput query="melodicElements">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                        </select>
                      </label>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <label>
                        <select name="selectGameTypes" id="selectGameTypes" onChange="handleGameChoice();handleSearchChange(event);">
                          <option selected value="-1">GameType</option>
                          <option value="-1">All Game Types</option>
                          <cfoutput query="gameTypes">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                        </select>
                      </label>
                    </td>
                  </tr>
                  <tr id="subGameRow">
                    <td>
                      <label id="subGameLabel">
                        <select name="selectSubGame" id="selectSubGame" onChange="handleSearchChange(event)"><!---really insert here>---></select>
                         <script id="subGame-template" type="x-handlebars-template">
                          <option selected value="-1">Sub-Game</option>
                          <option value="-1">All Sub-Games</option>
						  {{#each data}}
                          <option value="{{data}}">{{label}}</option>
						  {{/each}}
                          </script>
                      </label>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="w-col w-col-4">
            <div class="w-embed">
              <table class="advanced-search" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                  <tr>
                    <td>
                      <label>
                        <select name="selectRythmicElements" id="selectRythmicElements" onChange="handleSearchChange(event)">
                          <option selected value="-1">Rhythmic Element</option>
                          <option value="-1">All Rhythmic Elements</option>
                          <cfoutput query="rythmicElements">
                         <option value="#data#">#label#</option>
                          </cfoutput>
                        </select>
                      </label>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <label>
                        <select name="selectMeters" id="selectMeters" onChange="handleSearchChange(event)">
                          <option selected value="-1">Meter</option>
                          <option calue="-1">All Meter</option>
                          <cfoutput query="meters">
                         <option value="#data#">#label#</option>
                          </cfoutput>
                        </select>
                      </label>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <label>
                        <select name="selectFormAnalysis" id="selectFormAnalysis" onChange="handleSearchChange(event)">
                          <option selected value="-1">Formal Analysis</option>
                          <option value="-1">All Formal Analyses</option>
                          <cfoutput query="forms">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                        </select>
                      </label>
                    </td>
                  </tr>
                  <tr>
                    <td>
                    
                      <div id="toneSetSearch">
                          <input class="typeahead" type="text" placeholder="Tone Set (Enter String)" id="toneSetBox">
                          <input type="submit" name="submit" class="submitToSearch" value="Submit">
                        </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                    
                      <div id="motiveSetSearch">
                          <input class="typeahead" type="text" placeholder="Melodic Motive (String)" id="motiveBox">
                           <input type="submit" name="submitMotive" class="submitToSearch" value="Submit">
                        </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <!---
                      <input type="reset" name="reset" id="reset" value="Reset">
					  --->
                      <div id="contextSetSearch">
                          <input class="typeahead" type="text" placeholder="Melodic Context (String)" id="contextBox">
                           <input type="submit" name="submitContext" class="submitToSearch" value="Submit">
                        </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="w-container collection-index-total" id="countDisplay"><!---insert rendered here ---> </div>
    <script id="count-template" type="x-handlebars-template">
	{{{whatCountDisplay number}}}
    
 	</script>
  <main class="w-container main-content advanced-search-table">
    <div class="w-embed w-hidden-tiny collection-index-large">
      <table class="collection-index" width="100%" border="0" cellpadding="10" cellspacing="3">
        <tbody id="titlesDisplay"><!---insert rendered here ---></tbody>
		<script id="titles-grid-template" type="x-handlebars-template">
        <tr>
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
      </table>
    </div>
    <div class="w-embed w-hidden-main w-hidden-medium w-hidden-small collection-index-small">
      <table class="collection-index" width="100%" border="0" cellpadding="10" cellspacing="3">
        <tbody id="mobileTitles"><!--- insert rendered here ---></tbody>
			<script id="titles-mobile" type="x-handlebars-template">
            <tr>
                <td class="table-label">Title</td>
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
  </main>
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
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script src="http:	//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
  <script src="js/typeAhead.js"></script>
  <script src="js/Handlebars.js"></script>
  <script src="js/jquery.serializecfjson-0.2.min.js"></script>
  <script type="text/javascript" src="js/webflow.js"></script>
  <script type="text/javascript" src="js/kodaly.js"></script>
  
  
  
  <script>
 var toneSets = [
 <cfoutput query="toneSets">
"#toneSetID#",
 </cfoutput>
];
var contexts = [
<cfoutput query="melContexts">
"#melContext#",
</cfoutput>
];
var motives = [
<cfoutput query="motivesList">
"#motive#",
</cfoutput>
];
 
 
 
$('#toneSetSearch .typeahead').typeahead({
  hint: true,
  highlight: true,
  minLength: 1
},
{
  name: 'tones',
  displayKey: 'value',
  source: substringMatcher(toneSets)
});
//////
$('#contextSetSearch .typeahead').typeahead({
  hint: true,
  highlight: true,
  minLength: 1
},
{
  name: 'melC',
  displayKey: 'value',
  source: substringMatcher(contexts)
});
//////


$('#motiveSetSearch .typeahead').typeahead({
  hint: true,
  highlight: true,
  minLength: 1
},
{
  name: 'mot',
  displayKey: 'value',
  source: substringMatcher(motives)
});

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
  <!--[if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
</body>
</html>