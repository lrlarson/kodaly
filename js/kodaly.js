


//var dataHost = "http://127.0.0.1:8501/kodaly-final/data/kodaly.cfc";
var dataHost = "data/kodaly.cfc";
var region = -1;
var state = -1;
var ethnic = -1;
var songType = -1;
var subject = -1;
var forms = -1;
var scale = -1;
var range = -1;
var notes = -1;
var melodicElement = -1;
var rhythmicElement = -1;
var meter = -1;
var formAnalysis = -1;
var toneSet = '';
var subSubject = -1;
var gameType = -1;
var motive = '';
var contextSet = -1;
var grades = '_none';
var searchString = '';
var subGame = -1;
var audioPlaying = -1;
var tonalCenterID = -1;



    var init = function(){
        $('#subTableRow').hide('slow');
        $('#subGameRow').hide('slow');
        $('#melContextRow').hide('slow');
    }



        var submitEmail = function() {
            fName = $('#first_name').val();
            lName = $('#last_name').val();
            email = $('#email_address').val();
            if (validateEmail(email)) {
                $.ajax({
                    url: dataHost,
                    data: {
                        method: 'insertNewEmail',
                        returnFormat: 'json',
                        email: email,
                        firstName: fName,
                        lastName: lName
                    },
                    method: 'GET',
                    dataType: "json",
                    async: false,
                    success: function (d, r, o) {
                        $('#submit_button').val('Your email has been saved. Thanks!')
                        setTimeout(function(){
                            $.fn.custombox('close')},1550);
                    }

                });

            }
        }

var validateEmail = function(subEmail){
    var x = subEmail;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        alert("Not a valid e-mail address");
        return false;
    }else{
        return true;
    }

}


var handleMobileAudioClick = function(){
        player = document.getElementsByTagName("audio")[0];
        if (audioPlaying == -1) {
            player.play();
            audioPlaying = 1;
            $('#audioSwitchMobile').removeClass('listen');
            $('#audioSwitchMobile').addClass('pause');
            $('#audioSwitchMobile').html('pause');
        }else{
            player.pause();
            $('#audioSwitchMobile').removeClass('pause');
            $('#audioSwitchMobile').addClass('listen');
           // $('#audioSwitchMobile').html('listen');
            audioPlaying = -1;
        }
    }

        var handleAudioClick = function(){
            player = document.getElementsByTagName("audio")[0];
            if (audioPlaying == -1) {
                player.play();
                audioPlaying = 1;
                $('#audioSwitch').removeClass('listen');
                $('#audioSwitch').addClass('pause');
                $('#audioSwitch').html('pause');
            }else{
                player.pause();
                $('#audioSwitch').removeClass('pause');
                $('#audioSwitch').addClass('listen');
                $('#audioSwitch').html('listen');
                audioPlaying = -1;
            }
        }

    var handleEndOfAudio = function(){
        $('#audioSwitch').removeClass('pause');
        $('#audioSwitch').addClass('listen');
        $('#audioSwitch').html('listen');
        $('#audioSwitchMobile').removeClass('pause');
        $('#audioSwitchMobile').addClass('listen');
        audioPlaying = -1;

    }
    var handleSubjectChoice = function(){

        if ($('#selectSubject').val() != -1){
            $('#subTableRow').removeClass('no-display');
            $('#subTableRow').show('slow');
            getSubSubjects($('#selectSubject').val() );
        }else{
            $('#subTableRow').hide('slow');
            $('#selectSubSubject').val(-1);
            subSubject = -1;
        }
}

    var handleGameChoice = function(){

        if ($('#selectGameTypes').val() != -1){
            $('#subGameRow').show('slow');
            getSubGames($('#selectGameTypes').val() );
        }else{
            $('#subGameRow').hide('slow');
            $('#selectSubGame').val(-1);
            subGame = -1;
        }
    }


    var handleMelodicElementChoice = function(){
        if ($('#selectMelodicElements').val() != -1){
            $('#melContextRow').show('slow');
            getMelodicContexts($('#selectMelodicElements').val())
        }else{
            $('#melContextRow').hide('slow');
            $('#melContextBox').val(-1);
            contextSet = -1;
        }


    }


    var getMelodicContexts = function(selectedElement){
        $.ajax({
            url: dataHost,
            data: {
                method: 'getMelContextsForElement',
                returnFormat: 'json',
                element:selectedElement
            },
            method: 'GET',
            dataType: "json",
            async: false,
            success: function (d, r, o) {
                workReturn = $.serializeCFJSON({
                    data: d
                });

                var subContextTemplateScript = $('#melContext-template').html();
                melTemplate= Handlebars.compile(subContextTemplateScript);
                $('#selectMelContext').empty();
                $('#selectMelContext').append(melTemplate(workReturn));

            }
        });

    }

    var getSubGames = function(selectedGame){
        $.ajax({
            url: dataHost,
            data: {
                method: 'getSubGames',
                returnFormat: 'json',
                game:selectedGame
            },
            method: 'GET',
            dataType: "json",
            async: false,
            success: function (d, r, o) {
                workReturn = $.serializeCFJSON({
                    data: d
                });

                var subGameTemplateScript = $('#subGame-template').html();
                subTemplate= Handlebars.compile(subGameTemplateScript);
                $('#selectSubGame').empty();
                $('#selectSubGame').append(subTemplate(workReturn));

            }
        });

    }

    var getSubSubjects = function(selectedSubject){
        $.ajax({
            url: dataHost,
            data: {
                method: 'getSubSubjects',
                returnFormat: 'json',
                subject:selectedSubject
            },
            method: 'GET',
            dataType: "json",
            async: false,
            success: function (d, r, o) {
                workReturn = $.serializeCFJSON({
                    data: d
                });

                var subSubjectTemplateScript = $('#subSubject-template').html();
                subTemplate= Handlebars.compile(subSubjectTemplateScript);
                $('#selectSubSubject').empty();
                $('#selectSubSubject').append(subTemplate(workReturn));

            }
        });

    }



    var reset = function(){
        //alert('reset called');
        $('.apply').css('background-color','rgba(0, 0, 0, 0.14)');
        controls = $('select');
        for (i=0;i<controls.length;i++){
            if (controls[i].id == 'selectGrades'){
                controls[i].value = '_none';
                $('#'  + controls[i].id).css('background-color','#8c8c84');
            }else{
            controls[i].value = -1;
            $('#'  + controls[i].id).css('background-color','#8c8c84');
            }
        }
        controlTexts = $('input[type="text"]');
        for (i=0;i<controlTexts.length;i++){
            controlTexts[i].value = '';
        }
        init();
       handleSearchChange();
    }


    var handleSearchChange = function(event) {

       if (!(typeof event === 'undefined')) {
           setBackgroundColor(event.target.id);
       }
        getSelectStates();
        getFilteredEvents();

    }


    var setBackgroundColor = function(target){
        if ($('#'  + target).val() != -1 && $('#'  + target).val() != '_none'){
            $('#'  + target).css('background-color','#b50430');
        } else{
            $('#'  + target).css('background-color','#8c8c84');
        }
	}

    var getSelectStates = function(){

        region = $('#selectRegion').val();
        state =  $('#selectStates').val();
        ethnic = $('#selectEthnic').val();
        songType = $('#selectSongType').val();
        subject = $('#selectSubject').val();
        forms = $('#selectForms').val();
        scale = $('#selectScale').val();
        range = $('#selectRange').val();
        tonalCenterID = $('#selectNotes').val();
        melodicElement = $('#selectMelodicElements').val();
        rhythmicElement = $('#selectRythmicElements').val();
        meter = $('#selectMeters').val();
        formAnalysis = $('#selectFormAnalysis').val();

        toneSet = $('#toneSetData').val();
        motive = $('#motiveContextBox').val();
        contextSet = $('#melContextBox').val();



        if (!($('#selectSubSubject').val())){
            subSubject = -1
        }else{
            subSubject = $('#selectSubSubject').val();
        }
        gameType = $('#selectGameTypes').val();
        grades = $('#selectGrades').val();
        searchString = $('#search').val();
        if (!($('#selectSubGame').val())){
            subGame = -1
        }else{
            subGame = $('#selectSubGame').val();
        }
        if (!($('#selectMelContext').val())){
            contextSet = -1
        }else{
            contextSet = $('#selectMelContext').val();
        }


}

    var getFilteredEvents = function () {
    $.ajax({
        url: dataHost,
        data: {
            method: 'getFilteredTitles',
            returnFormat: 'json',
            region:region,
            state:state,
            ethnic:ethnic,
            songType:songType,
            subject:subject,
            forms:forms,
            scale:scale,
            range:range,
            tonalCenterID:tonalCenterID,
            melodicElement:melodicElement,
            rhythmicElement:rhythmicElement,
            meter:meter,
            formalAnalysis:formAnalysis,
            toneSet:toneSet,
            subSubject:subSubject,
            gameType:gameType,
            motiveSet:motive,
            contextSet:contextSet,
            grades:grades,
            searchString:searchString,
            subGameType:subGame
        },
        method: 'GET',
        dataType: "json",
        async: true,
        success: function (d, r, o) {
            workReturn = $.serializeCFJSON({
                data: d
            });

            var numberOfRecords = {
                number: workReturn.data.length
            };

            console.log(workReturn);


            var titlesTemplateScript = $('#titles-grid-template').html();
            titlesTemplate= Handlebars.compile(titlesTemplateScript);
            $('#titlesDisplay').empty();
            $('#titlesDisplay').append(titlesTemplate(workReturn));

            var numberTemplateScript = $('#count-template').html();
            numberTemplate = Handlebars.compile(numberTemplateScript);
            $('#countDisplay').empty();
            $('#countDisplay').append(numberTemplate(numberOfRecords));

            var showAllTemplateScript = $('#all-template').html();
            allTemplate = Handlebars.compile(showAllTemplateScript);
            $('#showAllDisplay').empty();
            $('#showAllDisplay').append(allTemplate(numberOfRecords));

            var mobileTemplateScript = $('#titles-mobile').html();
            mobileTemplate= Handlebars.compile(mobileTemplateScript);
            $('#mobileTitles').empty();
            $('#mobileTitles').append(mobileTemplate(workReturn));


        }
    });
}


Handlebars.registerHelper("isData", function (data) {
    if (!data) {
        var string = '<span class="no-results">No songs in the collection meet all the criteria</span>'
        return string;
    }

});



Handlebars.registerHelper("whatCountDisplay",function(count){
    if (count == totalCount){
        var string = "<div>Showing all <em>" + totalCount +  "</em> songs in the collection</div>"
    } else if(count>0){
        var string = "<div>Showing  <em>" + count + "</em> of  <em>" + totalCount + "</em> songs</div>"
    }   else{
        var string = '<div>No songs in the collection meet all the criteria</span></div>';
    }
    return string;

});

Handlebars.registerHelper("showAllDisplay",function(count){
    if (count == totalCount){
        var string = '<div class="search-show-all"><a href="#"></a></div>';
    } else if(count>0){
        var string = '<div class="search-show-all"><a href="javascript:reset();" >Show All</a></div>';
    }   else{
        var string = '<div class="search-show-all"><a href="javascript:reset();" >Show All</a></div>';
    }
    return string;

});


Handlebars.registerHelper("hasRecording", function (recording_flag) {
    if (recording_flag) {
        var string = '<img src="images/icon_recording.svg" width="25">'
        return string;
    }

});

Handlebars.registerHelper("isLOC", function (loc) {
    if (loc) {
        var string = '<img src="images/icon_libraryofcongress.svg" width="25">'
        return string;
    }

});

Handlebars.registerHelper("isChild", function (child) {
    if (child) {
        var string = '<img src="images/icon_childinformant.svg" width="25">'
        return string;
    }

});

Handlebars.registerHelper("isGame", function (game) {
    if (game) {
        var string = ' <img src="images/icon_game.svg" width="36">'
        return string;
    }

});


var substringMatcher = function(strs) {
    return function findMatches(q, cb) {
        var matches, substrRegex;

        matches = [];

        q = '^' + q;


        // regex used to determine if a string contains the substring `q`
        substrRegex = new RegExp(q, 'i');

        $.each(strs, function(i, str) {
            if (substrRegex.test(str)) {
                matches.push({ value: str });
            }
        });

        cb(matches);
    };
};

$('#mailing_list').on('click', function ( e ) {
    $.fn.custombox( this, {
        effect:         'fadein',
        overlayColor:   '#eeefea',
        overlayOpacity: 1,
        speed:          400
    });
    e.preventDefault();
});