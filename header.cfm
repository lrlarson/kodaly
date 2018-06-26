<div class="w-container main-wrapper">
    <div class="w-hidden-tiny top_bar"><a class="top_bar" href="http://www.hnu.edu/index.php">&#8592; &nbsp;Holy Names University</a>
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
              <div class="kodaly-header-link">Kod&aacute;ly Center</div>
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
        <nav class="w-nav-menu nav-menu" role="navigation">
        <cfif find("the-kodaly-vision",#cgi.SCRIPT_NAME#) GT 0>
        <a class="w-nav-link nav-link w--current" href="the-kodaly-vision.cfm" id="vision">The Kod&aacute;ly Vision</a>
        <cfelse>
        <a class="w-nav-link nav-link" href="the-kodaly-vision.cfm" id="vision">The Kod&aacute;ly Vision</a>
        </cfif>
        <cfif find("the-kodaly-center.cfm",#cgi.SCRIPT_NAME#) GT 0>
        <a class="w-nav-link nav-link w--current" href="the-kodaly-center.cfm" id="center">The Kod&aacute;ly Center</a>
        <cfelse>
        <a class="w-nav-link nav-link" href="the-kodaly-center.cfm" id="center">The Kod&aacute;ly Center</a>
        </cfif>
        <cfif find("news.cfm",#cgi.SCRIPT_NAME#) GT 0>
        <a class="w-nav-link nav-link w--current" href="news.cfm" id="news">News</a>
        <cfelse>
        <a class="w-nav-link nav-link" href="news.cfm" id="news">News</a>
        </cfif>
        
        <cfif find("curriculum.cfm",#cgi.SCRIPT_NAME#) GT 0>
        <a class="w-nav-link nav-link w--current" href="curriculum.cfm" id="news">Resources</a>
        <cfelse>
        <a class="w-nav-link nav-link" href="curriculum.cfm" id="news">Resources</a>
        </cfif>
        
        <cfif (find("collection.cfm",#cgi.SCRIPT_NAME#) GT 0) OR (#find("song.cfm",cgi.SCRIPT_NAME)# GT 0)>
        <a class="w-nav-link nav-link w--current" href="collection.cfm" >Search the Collection</a>
        <cfelse>
        <a class="w-nav-link nav-link" href="collection.cfm" >Search the Collection</a>
        </cfif>

      <cfif (find("collection.cfm",#cgi.SCRIPT_NAME#) GT 0) OR (#find("song.cfm",cgi.SCRIPT_NAME)# GT 0)>
              <a class="w-nav-link nav-link w--current" href="https://www.hnu.edu/about/programs-centers/kodaly-center/give-kodaly-center" >Donate</a>
      <cfelse>
              <a class="w-nav-link nav-link" href="https://www.hnu.edu/about/programs-centers/kodaly-center/give-kodaly-center" >Donate</a>
      </cfif>
        
    	<!--
        <a class="w-nav-link nav-link" href="Resources.cfm" id="search">curriculum </a>
     -->
        </nav>
        <div class="w-nav-button menu-button">
          <div class="w-icon-nav-menu"></div>
        </div>
      </div>
    </nav>
  </div>

