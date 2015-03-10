<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Kodaly Center -- Collection</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="css/normalize.css">
  <link rel="stylesheet" type="text/css" href="css/webflow.css">
  <link rel="stylesheet" type="text/css" href="css/kodaly.webflow.css">
  <link rel="stylesheet" type="text/css" href="css/dropdown.css" />
  <link rel="stylesheet" type="text/css" href="js/AutoComplete/styles/AutoComplete.css" />
  <link rel="stylesheet" type="text/css" href="css/typeahead.css" />
   
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
  <cfinclude template="header.cfm">
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
          <a class="w-inline-block search-icon" href="javascript:handleSearchChange()">
            <img src="images/icon_search.svg" width="30" alt="53d671d6ad790af81f1ed8d2_icon_search.svg">
          </a>
          <div>
              <input class="input" id="search" type="text" placeholder="Search by Title" name="Search" data-name="search" onClick="handleSearchChange()">
          </div>
        </div>
        
        <div class="w-clearfix refine-search"><a class="reset-button" href="javascript:reset()">Reset</a>
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
              <abbr title="Origin &#8211; the cultural/historical source of a song, which may or may not be same as the cultural or ethnic origin of the informant." rel="tooltip"><img src="images/icon_tooltip.svg" width="20px"></abbr>
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
              <span class="css3-metro-dropdown" id="subTableRow" style="display: none;">  
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
             <abbr title="Song Type &#8211; classification of songs by function, e.g., work songs, lullabies, etc." rel="tooltip"><img src="images/icon_tooltip.svg" width="20px"></abbr>
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
              <abbr title="Tonal Center &#8211; the tonic of the song; usually the final note." rel="tooltip"><img src="images/icon_tooltip.svg" width="20px"></abbr>
           <span class="css3-metro-dropdown">
              <select name="selectScale" id="selectScale" onChange="handleSearchChange(event)">
                          <option selected value="-1">Scale</option>
                          <option value="-1">All Scales</option>
                          <cfoutput query="scales">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                        </select></span>
              <abbr title="Scale Type &#8211; classification of scales by number and relationship of pitches, and tonal center, e.g., do pentatonic, mixolydian, harmonic minor, etc." rel="tooltip"><img src="images/icon_tooltip.svg" width="20px"></abbr><br>
            
              <span class="accordion" id="the-basics2">
              <span class="small-label">Tone Set</span>
              <input type="text" class="tone-set typeahead"  id="toneSetData" placeholder="Type Toneset ..." name="toneSetData">
              <input type="submit" class="apply" name="submit" id="submit" value="Apply" onClick="handleSearchChange(event)">
             </span>
              <abbr title="Tone Set &#8211; the notes that appear in a song, listed from lowest to highest, with the tonal center indicated." rel="tooltip"><img src="images/icon_tooltip.svg" width="20px"></abbr>
              <span class="css3-metro-dropdown">
             <select name="selectRange" id="selectRange" onChange="handleSearchChange(event)">
                          <option selected value="-1">Melodic Range</option>
                          <option value="-1">All Melodic Ranges</option>
                          <option value="1">Less than a M6th</option>
                           <option value="2">minor or Major 7th</option>
                           <option value="3">Octave or Greater</option>
                        </select></span>
            <span class="css3-metro-dropdown" >  
              <select name="selectMelodicElements" id="selectMelodicElements" onChange="handleMelodicElementChoice();handleSearchChange(event)" >
                          <option selected value="-1">Melodic Element</option>
                          <option value="-1">All Melodic Elements</option>
                          <cfoutput query="melodicElements">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                        </select></span>
              <abbr title="Melodic Element &#8211; The most recently introduced note. Notes are introduced sequentially (starting with so-mi, or mi-re-do) so that children can hear, read and write with confidence." rel="tooltip"><img src="images/icon_tooltip.svg" width="20px"></abbr>        
                 <span class="css3-metro-dropdown" id="melContextRow" style="display: none;">
             <select name="selectMelContext" id="selectMelContext" onChange="handleSearchChange(event)"><!---really insert here>---></select>
                         <script id="melContext-template" type="x-handlebars-template">
                          <option selected value="-1">Melodic Context</option>
                          <option value="-1">All Contexts</option>
						  {{#each data}}
                          <option value="{{data}}">{{label}}</option>
						  {{/each}}
                          </script></span>   
            
            <!--- old motive box 
             <span class="accordion">
             <span class="small-label">Melodic Motive</span>      
              <input type="text" class="tone-set" id="motiveContextBoxOLD" placeholder="Type Melodic Motive">
              <input type="submit" class="apply" name="submit" id="submit" value="Apply" onClick="handleSearchChange(event)"> 
              </span>
			  
			  --->
              <span class="accordion" id="the-basics">
             <span class="small-label">Melodic Motive</span>      
              <input type="text" class="tone-set typeahead" id="motiveContextBox" placeholder="Type Melodic Motive">
              <input type="submit" class="apply" name="submit" id="submit" value="Apply" onClick="handleSearchChange(event)"> 
              </span>
               <abbr title="Melodic Motive &#8211; this represents the pitches sounding on each beat within a motive. It does not represent rhythm, e.g., d.d.d.d could be a whole note, two half notes, all 16th notes, etc." rel="tooltip"><img src="images/icon_tooltip.svg" width="20px"></abbr>
             <span class="css3-metro-dropdown"> 
              <select name="selectRythmicElements" id="selectRythmicElements" onChange="handleSearchChange(event)">
                          <option selected value="-1">Rhythmic Element</option>
                          <option value="-1">All Rhythmic Elements</option>
                          <cfoutput query="rythmicElements">
                         <option value="#data#">#label#</option>
                          </cfoutput>
                        </select></span>
              <abbr title="Rhythmic Element &#8211; the most recently introduced rhythm. Rhythms are introduced sequentially (starting with ta, ti-ti and rest) so that children can hear, read and write with confidence." rel="tooltip"><img src="images/icon_tooltip.svg" width="20px"></abbr>
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
              <abbr title="Form Type &#8211; classification of songs according to structure, e.g., verse-chorus, call-response, cumulative." rel="tooltip"><img src="images/icon_tooltip.svg" width="20px"></abbr>
            <span class="css3-metro-dropdown">
               <select name="selectFormAnalysis" id="selectFormAnalysis" onChange="handleSearchChange(event)">
                          <option selected value="-1">Formal Analysis</option>
                          <option value="-1">All Formal Analyses</option>
                          <cfoutput query="forms">
                          <option value="#data#">#label#</option>
                          </cfoutput>
                        </select></span>
              <abbr title="Formal Analysis &#8211; a description of the relationship between melodic phrases in the song, which shows their similarity and difference, e.g., AABA." rel="tooltip"><img src="images/icon_tooltip.svg" width="20px"></abbr>
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
				{{else}}
				<tr>
				<td width = "100%">
				<span class="no-results">No songs in the collection meet all the criteria</span> 	
				</td>
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
 
  

  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript" src="js/webflow.js"></script>
  <script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
  <script src="js/AutoComplete/classes/AutoComplete.js"></script>
  <script src="js/typeAhead.js"></script>
  <script src="js/Handlebars.js"></script>
  <script src="js/typeahead.bundle.js"></script>
  <script src="js/jquery.serializecfjson-0.2.min.js"></script>
  <script type="text/javascript" src="js/kodaly.js"></script>
  <!--[if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->

	 <!-- begin footer -->
<cfinclude template="footer.cfm">

    <!-- end footer -->


		<script>
		var motives = [
		<cfoutput query="motivesList">
					"#motive#",
		</cfoutput>
		];
		
		$('#the-basics .typeahead').typeahead({
		  hint: true,
		  highlight: true,
		  minLength: 1
		},
		{
		  name: 'motives',
		  displayKey: 'value',
		  source: substringMatcher(motives)
		});
		
		var toneSets = 
		[
                    <cfoutput query="toneSets">
					"#toneSetID#",
					 </cfoutput>
					
		];
		
		
		$('#the-basics2 .typeahead').typeahead({
		  hint: true,
		  highlight: true,
		  minLength: 1
		},
		{
		  name: 'toneSets',
		  displayKey: 'value',
		  source: substringMatcher(toneSets)
		});
		
		</script>
  

			

  
  <script>
  $( document ).ready(function() {
	$( ".submitToSearch" ).click(function() {
			handleSearchChange();			
});
$("#search").keyup(function(event){
			alert('keyup');
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