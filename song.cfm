    <!DOCTYPE html>
    <html>
    <head>
    <cfparam name="ID" default="453"> 
      <meta charset="UTF-8">
      <title>Kod&aacute;ly Center for Music Education - Song</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">
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
       
  <cfscript>
  kodalyData = CreateObject("Component","data/kodaly");
  songDetails = kodalyData.getSongDetails(#ID#);
  rythymicContext = kodalyData.getRythmicContextsForSong(#ID#);
  songTypes = kodalyData.getSongTypesForSong(#ID#);
  games = kodalyData.getGamesForSong(#ID#);
  figures = kodalyData.getFiguresForSong(#ID#);
  partWork = kodalyData.getPartWorkForSong(#ID#);
  subjects = kodalyData.getSubjectsForSong(#ID#);
  motives = kodalyData.getMotivesForSong(#ID#);
  melodicElements = kodalyData.getMelodicContextsForSongWeb(#ID#);
  </cfscript>
    </head>
    <body>
  <cfinclude template="header.cfm">
       <cfoutput>
      <div class="w-container">
        <div class="song-title-wrapper">
          <div class="song-title">#songDetails.Title#</div>
          <div class="w-hidden-small w-hidden-tiny utility-icons">
          
          
          <!--- AUDIO ---->
          <cfif songDetails.Recording_Flag EQ 1>
          <a class="utility-button listen" href="javascript:handleAudioClick()" id="audioSwitch">Listen</a>
          <audio   id="audioPlayer">
            <source src="audio/#songDetails.Notation_File_Name#.mp3">
            <source src="audio/#songDetails.Notation_File_Name#.ogg">
      <p>Your browser does not support the audio element </p>
      </audio>
            </cfif>
             <!--- /AUDIO ---->
            
          <a class="utility-button song-analysis" href="##analysis">Analysis</a>
          <a class="a2a_dd utility-button share" href="http://www.addtoany.com/share_save">Share</a>
          </div>
        </div>
        <div class="w-hidden-main w-hidden-medium w-clearfix utility-icons-mobile">
        <!--- AUDIO mobile ---->
        
        
        
        <cfif songDetails.Recording_Flag EQ 1>
          <a class="utility-button-mobile listen" href="javascript:handleMobileAudioClick()" id="audioSwitchMobile"></a>
          <audio   id="audioPlayerMobile">
            <source src="audio/#songDetails.Notation_File_Name#.mp3">
            <source src="audio/#songDetails.Notation_File_Name#.ogg">
      <p>Your browser does not support the audio element </p>
      </audio>
           </cfif>
           
           
           
          <!--- /AUDIO mobile---->
          <a class="utility-button-mobile song-analysis" href="##analysis"></a>
          <a class="a2a_dd utility-button-mobile share" href="http://www.addtoany.com/share_save"></a>
        </div>
      </div>
         
      <div class="w-container score">
        <div class="score-wrapper">
       <!---
         <iframe id="viewer" src = "/kodaly-final/ViewerJS/##../Scores/#songDetails.Notation_File_Name#.pdf" width='100%' height='820' allowfullscreen webkitallowfullscreen></iframe>
    --->

  
        <iframe id="viewer" src = "/ViewerJS/##../Scores/#songDetails.Notation_File_Name#.pdf" width='100%' height='820' allowfullscreen webkitallowfullscreen></iframe>

        </div>
  
      </div>
   
      <div class="w-container song-analysis-wrapper" ><a name="analysis"></a>
        <div class="w-row">
          <div class="w-col w-col-8">
            <div class="w-embed"><span class="song-analysis-table-heading">Song Analysis</span>
              <table class="song-analysis" width="100%" border="0" cellpadding="0" cellspacing="0">
                <tbody>
                  <tr>
                    <td valign="top"><span class="song-analysis-table-label">Grade Level</span><br>
                    #songDetails.Grade_String#</td>
                    <td valign="top"><span class="song-analysis-table-label">Tonal Center</span><br>
                    #songDetails.Note#</td>
                  </tr>
                  <tr>
                    <td width="50%" valign="middle"><span class="song-analysis-table-label">Scale</span><br>
                    #songDetails.Scale#</td>
                    <td valign="top"><span class="song-analysis-table-label">Range</span><br>
                    #songDetails.Range#</td>
                  </tr>
                  <tr>
                    <td width="50%" valign="middle"><span class="song-analysis-table-label">Tone Set</span><br>
                    #songDetails.toneSetID#</td>
                    <td valign="top"><span class="song-analysis-table-label">Melodic Motive(s)</span><br>
                    <cfloop query="motives">#motive#<br></cfloop></td>
                  </tr>
                  <tr>
                    <td valign="top"><span class="song-analysis-table-label">Melodic Elements</span><br>
                    <cfloop query="melodicElements">
                    #melodicElement#
                    <cfif #MPreparation# EQ 1>
                    <abbr title="Preparation" rel="tooltip"><img src="images/icon_preparation.svg" width="30" alt="Preparation"/></abbr>
                    </cfif>
                     <cfif #MMiddlePractice# EQ 1>
                       <abbr title="Practice" rel="tooltip"><img src="images/icon_practice.svg" width="30" alt="Practice"/></abbr>
                    </cfif>
                    <cfif #MearlyPractice# EQ 1>
                    <abbr title="Tuning" rel="tooltip"><img src="images/icon_tuning.svg" width="30" alt="Tuning"/></abbr></td>
                    </cfif>
                    <br>
                    </cfloop>
                     
                    <td valign="top"><span class="song-analysis-table-label">Melodic Context</span><br>
                    <cfloop query="melodicElements">
                    #contextName#<br></td>
                    </cfloop>
                  </tr>
                  <tr>
                    <td valign="top"><span class="song-analysis-table-label">Rhythmic Element(s)</span><br>
                    <cfloop query="rythymicContext">#rythmName#
                    <cfif RPreparation EQ 1>
                      <abbr title="Preparation" rel="tooltip"><img src="images/icon_preparation.svg" width="30" alt="Preparation"/></abbr>
                    </cfif>
                    <cfif rMiddle EQ 1>
                   <abbr title="Practice" rel="tooltip"><img src="images/icon_practice.svg" width="30" alt="Practice"/></abbr>
                    </cfif>
                    <cfif rEarly EQ 1>
                    <abbr title="Tuning" rel="tooltip"><img src="images/icon_tuning.svg" width="30" alt="Tuning"/></abbr>
                    </cfif>
                    <br />
                    </cfloop></td>
                    
                    
                    <td valign="top"><span class="song-analysis-table-label">&nbsp;</span><br>
                    &nbsp;</td>
                  </tr>
                  <tr>
                    <td valign="top"><span class="song-analysis-table-label">Starting Pitch</span><br>
                    <cfif #songDetails.Starting_Pitch# NEQ '_none'>
                #songDetails.Starting_Pitch#
                </cfif></td>
                    <td valign="top"><span class="song-analysis-table-label">Partwork</span><br>
                      <cfloop query="partWork">#partWorkName#&nbsp;-&nbsp;#Part_Work_Context_String#<br /></cfloop></td>
                  </tr>
                  <tr>
                    <td valign="top"><span class="song-analysis-table-label">Form Analysis</span><br>
#songDetails.formAnalysisStr#</td>
                     <td valign="top"><span class="song-analysis-table-label">Form Type</span><br>
                    <cfif songDetails.Form_Type NEQ "_None">
                    #songDetails.Form_Type#</cfif></td>
                  </tr>
                  </tr>
                   <tr>
                   
                </tbody>
              </table>
            </div>
          </div>
          <div class="w-col w-col-4">
            <div class="w-embed"><span class="song-analysis-table-heading">Rhythm Set</span>
                       <table class="rhythm-set" width="100%" border="0" cellpadding="0" cellspacing="0">
            <tbody>
              <cfif songDetails.ta EQ 1>
              <tr>
                <td width="50%">ta</td>
                <td><img src="notes/ta.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.ti_ti EQ 1>
              <tr>
                <td width="50%">ti-ti</td>
                <td><img src="notes/ti-ti.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.ta_a EQ 1>
              <tr>
                <td width="50%">ta-a</td>
                <td><img src="notes/ta-a.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.ti_ta_ti EQ 1>
              <tr>
                <td width="25%">syn-co-pa</td>
                <td><img src="notes/syn-co-pa.png" class="notes"></td>
              </tr>
              </cfif>
               <cfif songDetails.ti EQ 1>
              <tr>
                <td width="50%">ti</td>
                <td><img src="notes/ti.png" class="notes"></td>
              </tr>
              </cfif>
               <cfif songDetails.ti_tiri EQ 1>
              <tr>
                <td width="50%">ti-tiri</td>
                <td><img src="notes/ti-tiri.png" class="notes"></td>
              </tr>
              </cfif>
               <cfif songDetails.ti_tim_ri EQ 1>
              <tr>
                <td width="50%">ti-tim-ri</td>
                <td><img src="notes/ti-tim-ri.png" class="notes"></td>
              </tr>
              </cfif>
               <cfif songDetails.ti_ti_ti EQ 1>
              <tr>
                <td width="25%">ti-ti-ti</td>
                <td><img src="notes/ti-ti-ti.png" class="notes"></td>
              </tr>
              </cfif>
               <cfif songDetails.ti_tai EQ 1>
               <tr>
                <td width="50%">ti-tai</td>
                <td><img src="notes/ti-tai.png" class="notes"></td>
              </tr>
              </cfif>
              
              <cfif songDetails.ti_ta EQ 1>
              <tr>
                <td width="50%">ti-ta</td>
                <td><img src="notes/ti-ta.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.tri_o_la EQ 1>
              <tr>
                <td width="50%">tri-o-la</td>
                <td><img src="notes/tri-o-la.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.tiri_tiri EQ 1>
               <tr>
                <td width="50%">tiri-tiri</td>
                <td><img src="notes/tiri-tiri.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.tiri_ti EQ 1>
              <tr>
                <td width="50%">tiri-ti</td>
                <td><img src="notes/tiri-ti.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.tim EQ 1>
               <tr>
                <td width="50%">tim</td>
                <td><img src="notes/tim.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.tim_ri EQ 1>
              <tr>
                <td width="50%">tim-ri</td>
                <td><img src="notes/tim-ri.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.tim_ri_ti EQ 1>
               <tr>
                <td width="50%">tim-ri-ti</td>
                <td><img src="notes/tim-ri-ti.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.tim_ri_ti EQ 1>
              <tr>
                <td width="50%">tim-ri-ti</td>
                <td><img src="notes/tim-ri-ti.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.tai EQ 1>
              <tr>
                <td width="50%">tai</td>
                <td><img src="notes/tai.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.tai_ti EQ 1>
              <tr>
                <td width="25%">tam-ti</td>
                <td><img src="notes/tai-ti.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.ti_tai EQ 1>
              <tr>
                <td width="50%"> ti-tam</td>
                <td><img src="notes/ti-tai.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.ti_ta EQ 1>
              <tr>
                <td width="50%">ti-ta</td>
                <td><img src="notes/ti-ta.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.ta EQ 1>
              <tr>
                <td width="50%">ta</td>
                <td><img src="notes/ta.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.ta_ti EQ 1>
              <tr>
                <td width="25%">ta-ti</td>
                <td><img src="notes/ta-ti.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.ta_a EQ 1>
              <tr>
                <td width="50%">ta-a</td>
                <td><img src="notes/ta-a.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.ta_a_a EQ 1>
              <tr>
                <td width="50%">ta-a-a</td>
                <td><img src="notes/ta-a-a.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.ta_a_a_a EQ 1>
              <tr>
                <td width="50%">ta-a-a-a</td>
                <td><img src="notes/ta-a-a-a.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.ri EQ 1>
              <tr>
                <td width="25%">ri</td>
                <td><img src="notes/ri.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.ri_tim EQ 1>
                <tr>
                <td width="50%">ri-tim</td>
                <td><img src="notes/ri-tim.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.ri_tim_ri EQ 1>
              <tr>
                <td width="50%">ri-tim-ri</td>
                <td><img src="notes/ri-tim-ri.png" class="notes"></td>
              </tr>
              </cfif>
             
              <cfif songDetails.tie EQ 1>
              <tr>
                <td width="50%">tie</td>
                <td><img src="notes/tie.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.rest EQ 1>
              <tr>
                <td width="25%">rest</td>
                <td><img src="notes/rest.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.eighth_rest EQ 1>
              <tr>
                <td width="25%">eighth rest</td>
                <td><img src="notes/eigth rest.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.whole_rest EQ 1>
              <tr>
                <td width="25%">whole rest</td>
                <td><img src="notes/whole rest.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.anac EQ 1>
               <tr>
                <td width="25%">anacrusis</td>
                <td><img src="notes/anacrusis.png" class="notes"></td>
              </tr>
              </cfif>
              <cfif songDetails.other_other EQ 1>
              <tr>
                <td width="25%">other</td>
                <td><img src="notes/other.png" class="notes"></td>
              </tr>
              </cfif>
            </tbody>
          </table>
            </div>
          </div>
        </div>
      </div>
      <div class="w-container song-details">
        <div class="w-row">
          <div class="w-col w-col-4">
           <p class="song-detail-p"><span class="song-detail-subheading">Source</span>
          <br>#songDetails.Publication#
          <br>
          <br>
          <span class="song-detail-subheading">Informant/Performer</span>
          <br>#songDetails.informant#
          <br>
          <br><span class="song-detail-subheading">State</span>
          <br><cfif songDetails.State NEQ "_None">#songDetails.State#</cfif>
          <br>
          <br>
          <span class="song-detail-subheading">Region</span>
          <br><cfif songDetails.Region NEQ "_None">#songDetails.Region#</cfif>
          <br>
          <br>
          <span class="song-detail-subheading">Origin</span>
          <br><cfif songDetails.Ethnicity NEQ "_None">#songDetails.Ethnicity#</cfif></p>
          </div>
          <div class="w-col w-col-4">
            <p class="song-detail-p"><span class="song-detail-subheading">Song Type(s)</span>
              <br><cfloop query="songTypes">#songType#<br></cfloop>
              <br>
              <br>
              <span class="song-detail-subheading">Game Types</span>
              <br>
            <cfloop query="games">
                <cfif gameType NEQ "_None">
                #gameType#<br>
                </cfif>
                </cfloop>
              <br>
              <br><span class="song-detail-subheading">Sub-Game Types</span>
              <br>
                <cfloop query="games">
                <cfif subGameType NEQ "_None">
                #subGameType#<br>
                </cfif>
                </cfloop>
              <br>
               <br><span class="song-detail-subheading">Sub-Game Types</span>
              <br>
                 <br><span class="song-detail-subheading">Figures</span>
              <br>
                <cfloop query="Figures">
                <cfif figure NEQ "_None">
                #figure#<br>
                </cfif>
                </cfloop>
              <br>
              <br>
            </p>
          </div>
          <div class="w-col w-col-4">
            <p class="song-detail-p"><span class="song-detail-subheading">Subject(s)</span><br>
              <cfloop query="subjects">
              <cfif subjectHeading NEQ "_None">
              #subjectHeading#<br>
              </cfif>
              </cfloop> <br>
              <br>
              <span class="song-detail-subheading">
              Sub Subject</span>
              
              <br>
             <cfloop query="subjects">
              <cfif subSubjectHeading NEQ "_None">
              #subSubjectHeading#<br>
              </cfif>
              </cfloop> <br>
              </p>
             <p class="song-detail-p"><span class="song-detail-subheading">Alternate Titles
              </span>
              <br>#songDetails.Alt_Title_1#
              <br>#songDetails.Alt_Title_2#
            </p> 
            <p class="song-detail-p"><span class="song-detail-subheading">General Comments
              </span>
              <br>#songDetails.Comments#
            </p>
          </div>
        </div>
      </div>
      </cfoutput>
      <div class="w-container song-pre-footer"><a class="white-link" href="collection.cfm">View All Titles in the Collection</a>
      </div>
 
      <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
      <script type="text/javascript" src="js/webflow.js"></script>
       <script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
       <script src="js/jquery.serializecfjson-0.2.min.js"></script>
       <script src="js/AutoComplete/classes/AutoComplete.js"></script>
  <script src="js/typeAhead.js"></script>
  <script src="js/Handlebars.js"></script>
  <script type="text/javascript" src="js/kodaly.js"></script>
      <!--[if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
       <!-- begin footer -->
      <cfinclude template="footer.cfm">
       <!-- end footer -->
       <script>
  $( document ).ready(function() {
  thisPlayer = document.getElementsByTagName("audio")[0];
  if (thisPlayer){
  thisPlayer.addEventListener('ended', handleEndOfAudio);
  $('#audioPlayer').hide();
  $('#audioPlayerMobile').hide();
  }
});
</script>

<cfoutput>
<script type="text/javascript">
var a2a_config = a2a_config || {};
a2a_config.linkname = '#songDetails.Title#';
a2a_config.linkurl = 'http://kodaly.hnu.edu?id=#ID#';
a2a_config.num_services = 10;
a2a_config.show_title = 1;
a2a_config.show_title= true;
a2a_config.delay= 0;
</script>
</cfoutput>

<script type="text/javascript" src="//static.addtoany.com/menu/page.js"></script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-8181123-3', 'auto');
  ga('send', 'pageview');

</script>
    </body>
    </html>