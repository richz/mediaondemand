function showMediaInPopupWindow() {

    closeVideo();

    var mediaUrl = document.getElementById('ctl00_MainContent_hdnMediaUrl').getAttribute('value');
    var mediaId = document.getElementById('ctl00_MainContent_hdnMediaId').getAttribute('value');

    var queryString = '?mediaUrl=' + mediaUrl;

    var windowOptions = 'width=400,height=300,toolbar=no, location=yes,directories=no,status=yes,menubar=no,scrollbars=no,copyhistory=no, resizable=yes';

    if (_arrWin[0])
        _arrWin[0].location = 'PopupMedia.aspx' + queryString;
    else
        _arrWin[0] = window.open('PopupMedia.aspx' + queryString, 'childWindow', windowOptions);

}

function ForcePostBack(lnkMovieLink, mediaType) {

    var mediaUrl = lnkMovieLink.getAttribute('param');
    var mediaId = lnkMovieLink.getAttribute('mediaId');

    document.getElementById('ctl00_MainContent_hdnMediaUrl').setAttribute('value', mediaUrl);
    document.getElementById('ctl00_MainContent_hdnMediaId').setAttribute('value', mediaId);

    playMedia(mediaUrl, mediaType);

    //playMedia(url, mediaType);
    //showLightBox(url, mediaType);

    //Force page postback to set Movie Url
    //__doPostBack('__Page', 'MyCustomArgument');
}

function closeVideo() {

    if (navigator.appName == 'Microsoft Internet Explorer' && document.getElementById('player') != null)
        stop();

    var playerDiv = document.getElementById('mediaPlayer');

    playerDiv.innerHTML = '';

}

function playMedia(mediaUrl, mediaType) {

    var playerDiv = document.getElementById('mediaPlayer');

    if (-1 != navigator.userAgent.indexOf("MSIE")) {

        playerDiv.innerHTML =
            '<object id="player" classid="clsid:22d6f312-b0f6-11d0-94ab-0080c74c7e95"'
            + ' type="application/x-ms-wmp" width="400px" height="300px">'
            + '<param name="showControls" value="true">'
            + '<param name="fileName" value="' + mediaUrl + '">'
            + '<param name="uiMode" value="full">'
            + '<param name="StretchToFit" value="true">'
            + '<param name="AutoSize" value="false">'
            + '</object>';

    }
    else if (-1 != navigator.userAgent.indexOf("Firefox")) {

    playerDiv.innerHTML =
            '<object id="player"'
            + ' type="application/x-ms-wmp"  width="400px" height="300px">'
            + '<param name="showControls" value="true">'
            + '<param name="fileName" value="' + mediaUrl + '">'
            + '<PARAM name="uiMode" value="full">'
            + '<param name="StretchToFit" value="true">'
            + '</object>';
    }

}

function stop() {

    document.getElementById('player').stop();
}
