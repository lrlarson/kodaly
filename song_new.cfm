    <!DOCTYPE html>
    <html data-wf-site="53cd80265e9467273b6889b0">
    <head>
    <cfparam name="ID" default="455"> 
      <meta charset="utf-8">
      <title>Kodály Center for Music Education - Song</title>
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
  </cfscript>
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
            <nav class="w-nav-menu nav-menu" role="navigation"><a class="w-nav-link nav-link" href="the-kodaly-vision.cfm">the kodály vision</a><a class="w-nav-link nav-link" href="the-kodaly-center.cfm">the kodály center</a><a class="w-nav-link nav-link" href="news.html">news</a><a class="w-nav-link nav-link" href="collection.cfm">search the collection</a>
            </nav>
            <div class="w-nav-button menu-button">
              <div class="w-icon-nav-menu"></div>
            </div>
          </div>
        </nav>
      </div>
       <cfoutput>
      <div class="w-container">
        <div class="song-title-wrapper">
          <div class="song-title">#songDetails.Title#</div>
          <div class="w-hidden-small w-hidden-tiny utility-icons"><a class="utility-button listen" href="##">Listen</a><a class="utility-button song-analysis" href="##">Analysis</a><a class="utility-button share" href="##">Share</a>
          </div>
        </div>
        <div class="w-hidden-main w-hidden-medium w-clearfix utility-icons-mobile">
          <a class="utility-button-mobile listen" href="##"></a>
          <a class="utility-button-mobile song-analysis" href="##"></a>
          <a class="utility-button-mobile share" href="##"></a>
        </div>
      </div>
         
      <div class="w-container score">
        <div class="score-wrapper">
         <iframe id="viewer" src = "/kodaly-final/ViewerJS/##../Scores/alabama1.pdf" width='100%' height='820' allowfullscreen webkitallowfullscreen></iframe>
         <!---
        <iframe id="viewer" src = "/ViewerJS/#../Scores/alabama1.pdf" width='100%' height='820' allowfullscreen webkitallowfullscreen></iframe>
        </div>
		--->
      </div>
   
      <div class="w-container song-analysis-wrapper">
        <div class="w-row">
          <div class="w-col w-col-8">
            <div class="w-embed"><span class="song-analysis-table-heading">Song Analysis</span>
              <table class="song-analysis" width="100%" border="0" cellpadding="0" cellspacing="0">
                <tbody>
                  <tr>
                    <td valign="middle"><span class="song-analysis-table-label">Grade Level</span><br>
                    #songDetails.Grade_String#</td>
                    <td valign="middle"><span class="song-analysis-table-label">Tonal Center</span><br>
                    #songDetails.Note#</td>
                  </tr>
                  <tr>
                    <td width="50%" valign="middle"><span class="song-analysis-table-label">Scale</span><br>
                    #songDetails.Scale#</td>
                    <td valign="middle"><span class="song-analysis-table-label">Range</span><br>
                    #songDetails.Range#</td>
                  </tr>
                  <tr>
                    <td width="50%" valign="middle"><span class="song-analysis-table-label">Tone Set</span><br>
                    #songDetails.toneSetID#</td>
                    <td valign="middle"><span class="song-analysis-table-label">Melodic Motive(s)</span><br>
                    <cfloop query="motives">#motive#<br></cfloop></td>
                  </tr>
                  <tr>
                    <td valign="middle"><span class="song-analysis-table-label">Melodic Elements</span><br>
                    <a class="tooltips-2" href="##"><img src="images/icon_preparation.svg" width="30" alt="Preparation"/><span><strong>Preparation</strong></span></a><a class="tooltips-2" href="##"><img src="images/icon_practice.svg" width="30" alt="Practice"/><span><strong>Practice</strong></span></a><a class="tooltips-2" href="##"><img src="images/icon_tuning.svg" width="30" alt="Tuning"/><span><strong>Tuning</strong></span></a></td>
                    <td valign="middle"><span class="song-analysis-table-label">Melodic Context</span><br>Mi-So</td>
                  </tr>
                  <tr>
                    <td valign="middle"><span class="song-analysis-table-label">Rhythmic Element(s)</span><br>
                    <cfloop query="rythymicContext">#rythmName#
                    <cfif RPreparation EQ 1>
                      <a class="tooltips-2" href="##"><img src="images/icon_preparation.svg" width="30" alt="Preparation"/><span><strong>Preparation</strong></span></a>
                    </cfif>
                    <cfif rMiddle EQ 1>
                   <a class="tooltips-2" href="##"> <img src="images/icon_tuning.svg" width="30" alt="Tuning"/><span><strong>Tuning</strong></span></a>
                    </cfif>
                    <cfif rEarly EQ 1>
                    <a class="tooltips-2" href="##"><img src="images/icon_practice.svg" width="30" alt="Practice"/><span><strong>Practice</strong></span></a>
                    </cfif>
                    <br />
                    </cfloop></td>
                    
                    
                    <td valign="middle"><span class="song-analysis-table-label">Form Type</span><br>
                    <cfif songDetails.Form_Type NEQ "_None">
                    #songDetails.Form_Type#</cfif></td>
                  </tr>
                  <tr>
                    <td valign="middle"><span class="song-analysis-table-label">Starting Pitch</span><br>
                    <cfif #songDetails.Starting_Pitch# NEQ '_none'>
                #songDetails.Starting_Pitch#
                </cfif></td>
                    <td valign="middle"><span class="song-analysis-table-label">Partwork</span><br>
											<cfloop query="partWork">#partWorkName#&nbsp;-&nbsp;#Part_Work_Context_String#<br /></cfloop></td>
                  </tr>
                  <tr>
                    <td valign="middle"><span class="song-analysis-table-label">Form Analysis</span><br>
#songDetails.formAnalysisStr#</td>
                     <td valign="middle"><span class="song-analysis-table-label"></span><br>
&nbsp;</td>
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
              <tr>
                <td width="50%">ta</td>
                <td><img src="notes/ta.png" class="notes"></td>
              </tr>
              <tr>
                <td width="50%">ti-ti</td>
                <td><img src="notes/ti-ti.png" class="notes"></td>
              </tr>
              <tr>
                <td width="50%">ta-a</td>
                <td><img src="notes/ta-a.png" class="notes"></td>
              </tr>
              <tr>
                <td width="25%">syn-co-pa</td>
                <td><img src="notes/syn-co-pa.png" class="notes"></td>
              </tr>
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
          <br>#songDetails.Source#
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
            <p class="song-detail-p"><span class="song-detail-subheading">General Comments
              </span>
              <br>#songDetails.Comments#</p>
          </div>
        </div>
      </div>
      </cfoutput>
      <div class="w-container song-pre-footer"><a class="white-link" href="##">View All Titles in the Collection</a>
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
                <a class="w-inline-block footer-social-media-icon" href="##">
                  <img src="images/icon_facebook.svg" alt="Facebook" width="50">
                </a>
                <a class="w-inline-block footer-social-media-icon" href="##">
                  <img src="images/icon_twitter.svg" alt="Twitter" width="50">
                </a>
                <a class="w-inline-block footer-social-media-icon" href="##">
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
            <div class="w-col w-col-5"><a class="footer-bar-link" href="glossary.cfm">Glossary</a><a class="footer-bar-link" href="bibliography.cfm">Bibliography</a><a class="footer-bar-link" href="##">Join Mailing List</a>
            </div>
          </div>
        </div>
      </div>
      <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
      <script type="text/javascript" src="js/webflow.js"></script>
      <!--[if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
    </body>
    </html>