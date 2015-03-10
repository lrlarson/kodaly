 <!-- begin footer -->
  
 <link rel="stylesheet" type="text/css" href="css/jquery.custombox.css">   
 <div>
        <div class="w-container footer">
            <div class="w-row">
                <div class="w-col w-col-8 w-col-small-8 w-clearfix">
                    <a class="w-hidden-tiny w-inline-block footer-logo" href="http://www.hnu.edu/index.php">
                        <img src="images/hnu_logo_stack.svg" width="100" alt="53cf24aaba039f772c45b0a6_hnu_logo_stack.svg">
                    </a>
                    <div class="footer-address">
                        <p class="footer-p">Kodály Center for Music Education&nbsp;
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
        <div class="w-col w-col-6">
          <div>
            <div class="footer-funder">Made possible by the The William and Flora Hewlett Foundation</div>
          </div>
        </div>
        <div class="w-col w-col-6">
        <a class="footer-bar-link" href="about.cfm">About</a>
        <a class="footer-bar-link" href="glossary.cfm">Glossary</a>
        <a class="footer-bar-link" href="bibliography.cfm">Bibliography</a>
        <a href="#modal" id="mailing_list" title="Custom effect" class="footer-bar-link">Mailing List</a>
        </div>
      </div>
    </div>
  </div>

    <div id="modal" style="display: none;" class="modal-example-content">
        <div class="modal-example-body">
            <button type="button" class="close_button" onclick="$.fn.custombox('close');">&times;</button><br>
            <h4>Kodály Center for Music Education :: Mailing List</h4><br>
            <input id="first_name" class="input" name="name" type="text" placeholder="First Name" size="30" /><br />
            <input id="last_name" class="input" name="name" type="text" placeholder="Last Name" size="30" /><br />
            <input id="email_address" class="input" name="name" type="text" placeholder="Email Address" size="30" /><br />
            <input type="hidden" name="action" value="submit"/>
            <input id="submit_button" class="submit" type="submit" value="Subscribe to List" onClick="submitEmail()" />
        </div>
    </div>
<script src="js/jquery.custombox.js"></script>
<script src="js/demo.js"></script>

    <script>
$('#mailing_list').on('click', function ( e ) {
    $.fn.custombox( this, {
        effect:         'fadein',
        overlayColor:   '#eeefea',
        overlayOpacity: 1,
        speed:          400
    });
    e.preventDefault();
});
    </script>

    <!-- end footer -->