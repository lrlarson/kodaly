<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Kodály Center  — The American Folk Song Collection</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/normalize.css">
    <link rel="stylesheet" type="text/css" href="css/webflow.css">
    <link rel="stylesheet" type="text/css" href="css/kodaly.webflow.css">
    <link rel="stylesheet" type="text/css" href="owl-carousel/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="owl-carousel/owl.theme.css">
    <link rel="stylesheet" type="text/css" href="css/jquery.custombox.css">
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
        try {
            Typekit.load();
        } catch (e) {}
    </script>
    <script type="text/javascript" src="js/modernizr.js"></script>
    <cfscript>
        kodalyData = CreateObject("Component","data/kodaly"); kodalyData.init(); news = kodalyData.getNewsSummary(); images = kodalyData.getHeroImages();
    </cfscript>


</head>

<body>
   <cfinclude template="header.cfm">
    <main class="w-container hero-wrapper">
        <div class="w-clearfix homepage-main-button"><a class="button search-collection" href="collection.cfm">Search the Collection</a><a class="button" href="collection.cfm">View All Titles in Collection</a>
        </div>

        <div class="hero-carousel">
            <cfoutput>
                <ul class="rslides">
                    <cfloop query="images">
                        <li>
                            <img class="lazy" src="images/hero/#fileName#" width="940" height="300" />
                        </li>
                    </cfloop>
                   
                </ul>
            </cfoutput>
        </div>

        </div>
    </main>
    <div class="w-container boxes-wrapper">
        <div class="w-row">
            <div class="w-col w-col-4 w-col-stack">
                <a class="w-inline-block content-box vision" href="the-kodaly-vision.cfm">
                    <div>
                        <div class="box-title">
                            <div>The Kodály Vision</div>
                        </div>
                    </div>
                    <p class="homepage-box-text">
                        <br>
                        <br>Learn about Zoltán Kodály, his history, philosophy, and its application in the classroom.</p>
                </a>
            </div>
            <div class="w-col w-col-4 w-col-stack">
                <a class="w-inline-block content-box center" href="the-kodaly-center.cfm">
                    <div class="box-title">
                        <div>The Kodály Center</div>
                    </div>
                </a>
            </div>
            <div class="w-col w-col-4 w-col-stack">
                <div class="content-box">
                    <div class="news-content-nav">
                        <!---
            <a class="w-inline-block news-content-arrow disabled" href="#">
            
              <img src="images/icon_arrow_left.svg" alt="53d00041a5282d255c61facb_icon_arrow_left.svg">
			  --->
                        </a>
                        <!---
            <a class="w-inline-block news-content-arrow" href="#">
            
              <img src="images/icon_arrow_right.svg" alt="53d0002e8cbeccf130a3ee8d_icon_arrow_right.svg">
			  --->
                        </a>
                    </div>
                    <div class="box-title">
                        <div>News</div>
                    </div>
                    <div class="news-content-wrapper" id="owlWrapper">
                        <cfoutput query="news">
                            <div class="news-item-homepage">
                                <a href="news.cfm###id#">
                                    <h1 class="news-content-h1">#newsItemHeadline#</h1>
                                    <p class="news-content-p">#newsTeaser#.
                                        <br>
                                        <br><strong>Read More</strong>
                                    </p>
                                </a>
                            </div>
                        </cfoutput>
                    </div>
                    <!--- end of news content owl wrapper--->
                </div>
            </div>
        </div>
    </div>
    
    


    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/webflow.js"></script>
    <script type="text/javascript" src="js/kodaly.js"></script>
    
    <cfinclude template="footer.cfm">

    <script src="js/responsiveslides.min.js"></script>

    <script>
        $(function () {
            $(".rslides").responsiveSlides({
                auto: true,
                speed: 2000,
                nav: false,
                random: true,
                pause: false,
            });
        });
    </script>

    <script src="owl-carousel/owl.carousel.js"></script>

    <script>
        $(document).ready(function () {
            $("#owlWrapper").owlCarousel({
                items: 1,
                itemsDesktop: [768, 1],
                itemsTablet: [600, 1],
                itemsDesktopSmall: [480, 1],
                autoHeight: false

            });
        });
    </script>
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