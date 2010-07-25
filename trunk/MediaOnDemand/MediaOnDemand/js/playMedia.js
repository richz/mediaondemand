function showMediaInPopupWindow() {

    closeVideo();

    var btnPlayInPopup = document.getElementById('btnPlayInPopup');

    if (btnPlayInPopup != null)
        btnPlayInPopup.disabled = 'disabled';    


    var mediaTitle = document.getElementById('ctl00_MainContent_hdnMediaTitle').getAttribute('value');
    var mediaUrl = document.getElementById('ctl00_MainContent_hdnMediaUrl').getAttribute('value');
    var mediaId = document.getElementById('ctl00_MainContent_hdnMediaId').getAttribute('value');

    var queryString = '?mediaId=' + mediaId + '&mediaUrl=' + mediaUrl + '&mediaTitle=' + mediaTitle;

    var windowOptions = 'width=400,height=350,toolbar=no, location=yes,directories=no,status=yes,menubar=no,scrollbars=no,copyhistory=no, resizable=no';

    //$f().stop();

        _arrWin[0] = window.open('PopupMedia.aspx' + queryString, 'childWindow', windowOptions);

        //document.getElementById('ctl00_MainContent_isPopupOpen').setAttribute('value') = 'Y';

        //__doPostBack('__Page', 'MyCustomArgument');
}

function ForcePostBack(window, mediaUrl, mediaTitle, mediaType, lnkMovieLink, mediaId) {

    if (window == 'mainwindow') {
        var mediaUrl = mediaUrl;
        var mediaId = mediaId;

        document.getElementById('ctl00_MainContent_hdnMediaUrl').setAttribute('value', mediaUrl);
        document.getElementById('ctl00_MainContent_hdnMediaId').setAttribute('value', mediaId);
        document.getElementById('ctl00_MainContent_hdnMediaTitle').setAttribute('value', mediaTitle);

        var btnPlayInPopup = document.getElementById('btnPlayInPopup');

        if (_arrWin[0]) {            
            var queryString = '?mediaId=' + mediaId + '&mediaUrl=' + mediaUrl + '&mediaTitle=' + mediaTitle;
            _arrWin[0].location = 'PopupMedia.aspx' + queryString;


            if (btnPlayInPopup != null)
                btnPlayInPopup.disabled = 'disabled';
        }
        else {

            if (btnPlayInPopup != null)
                btnPlayInPopup.disabled = '';

            playMedia(mediaUrl, mediaTitle, mediaType);
        }
    }
    else {

        if (window = 'popup') {

            var queryString = '?mediaId=' + mediaId + '&mediaUrl=' + mediaUrl + '&mediaTitle=' + mediaTitle;
            window.location = 'PopupMedia.aspx' + queryString;

            playMedia(mediaUrl, mediaTitle, mediaType);
        
        }
    
    }

    //Force page postback to set Movie Url
    //__doPostBack('__Page', 'MyCustomArgument');
}

function closeVideo() {

    var playerDiv = document.getElementById('mediaPlayer');

    playerDiv.setAttribute('class', 'hiddenMediaPlayer');

    playerDiv.innerHTML = '';

}

function playMedia(mediaUrl, mediaTitle, mediaType) {

    var playerDiv = document.getElementById('mediaPlayer');

    if (mediaType == 'video') {
        flowplayer("player", "../WebControls/flv flash player/flowplayer-3.2.2.swf", {

            clip: {
                url: mediaUrl,
                autoPlay: true,                
                bufferLength: 5,                
                title: mediaTitle
            }
        });

        playerDiv.setAttribute('class', 'visibleMediaPlayer');
    }
    else {

        playerDiv.innerHTML =
        + '<embed src=\"../WebControls/mp3 flash player/player_mp3_js\" quality=\"high\" width=\"300\" height=\"52\" allowScriptAccess=\"always\" wmode=\"transparent\"  type=\"application/x-shockwave-flash\" flashvars=\"valid_sample_rate=true&external_url=' + mediaUrl + '\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\"> </embed>';        
    
    } 
}