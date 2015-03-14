<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">

  <title>Kodaly Center :: News</title>
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
kodalyData.init();
news = kodalyData.getNews();
</cfscript>
  
</head>
<body>
  <cfinclude template="header.cfm">
  
  <main class="w-container main-content">
  	<cfoutput query="news">
    <div class="news-item"><a name="#id#">
      <div class="h2">#newsItemHeadline#</div><br />
      <div class="date">#dateString#</div><br />
      <p>#newsItemCopy#</p>
    </div>
    </cfoutput>
  </main>

  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  <script type="text/javascript" src="js/kodaly.js"></script>
  <cfinclude template="footer.cfm">  
  <script type="text/javascript" src="js/webflow.js"></script>
  <!--[if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
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