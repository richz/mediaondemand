function ForcePostBack(lnkMovieLink, mediaType) {

    var url = lnkMovieLink.getAttribute('param');

    document.getElementById('ctl00_MainContent_hdnMediaUrl').setAttribute('value', url);

    //play(url, mediaType);
    showLightBox(url, mediaType);

    //Force page postback to set Movie Url
    //__doPostBack('__Page', 'MyCustomArgument');
}

function play(mediaUrl, mediaType) {

    var playerWidth = 0;
    var playerHeight = 0;
    var playerClass = '';

    if (mediaType == 'music') {
        playerWidth = '550px';
        playerHeight = '45px';
        playerClass = 'musicMediaPlayer';
    }
    else  // video
    {
        playerWidth = '550px';
        playerHeight = '200px';
        playerClass = 'videoMediaPlayer';
    }

    document.getElementById('mediaplayer').innerHTML = '';

    if (mediaUrl != null) {

        var player = document.getElementById('player');

        if (player != null) {
            document.getElementById('mediaplayer').removeChild(player);
            document.getElementById('mediaplayer').setAttribute('class', 'emptyMediaPlayer');
        }

        document.getElementById('mediaplayer').innerHTML =
            '<object id="player" classid="clsid:22d6f312-b0f6-11d0-94ab-0080c74c7e95"'
            + 'type="application/x-oleobject" width="' + playerWidth + '" height="' + playerHeight + '">'
            + '<param name="showControls" value="true">'
            + '<param name="fileName" value="' + mediaUrl + '">'
            + '<embed type="application/x-mplayer2" width="' + playerWidth + '" height="' + playerHeight + '"'
            + 'showcontrols="true" src="' + mediaUrl + '"><\/embed><\/object>';

        document.getElementById('mediaplayer').setAttribute('class', playerClass);
    }
    else {

        var mediaUrl = document.getElementById('ctl00_MainContent_hdnMediaUrl').getAttribute('value');

        document.getElementById('mediaplayer').innerHTML =
            '<object id="player" classid="clsid:22d6f312-b0f6-11d0-94ab-0080c74c7e95"'
            + 'type="application/x-oleobject" width="' + playerWidth + '" height="' + playerHeight + '">'
            + '<param name="showControls" value="true">'
            + '<param name="fileName" value="' + mediaUrl + '">'
            + '<embed type="application/x-mplayer2" width="' + playerWidth + '" height="' + playerHeight + '"'
            + 'showcontrols="true" src="' + mediaUrl + '"><\/embed><\/object>';

        document.getElementById('mediaplayer').setAttribute('class', playerClass);
    }    
}

function stop() {

    if(navigator.appName == 'Microsoft Internet Explorer')
        document.getElementById('player').stop();    
}

function showLightBox(mediaUrl, mediaType) {

    var playerWidth = 0;
    var playerHeight = 0;
    var playerClass = '';

    if (mediaType == 'music') {
        playerWidth = 550;
        playerHeight = 45;
        playerClass = 'musicMediaPlayer';
    }
    else  // video
    {
        playerWidth = .8 * document.documentElement.clientWidth; //550;
        playerHeight = .8 * document.documentElement.clientHeight; //300;
        playerClass = 'videoMediaPlayer';
    }

    var width = document.documentElement.clientWidth + document.documentElement.scrollLeft;
    var height = document.documentElement.scrollHeight;
    var layer = document.createElement('div');
    layer.style.zIndex = 2;
    layer.id = 'lightBoxBackGround';
    layer.style.position = 'absolute';
    layer.style.top = '0px';
    layer.style.left = '0px';
    layer.style.height = height + 'px';
    layer.style.width = width + 'px';
    layer.style.backgroundColor = 'black';
    layer.style.opacity = '.5';
    layer.style.filter += ("progid:DXImageTransform.Microsoft.Alpha(opacity=60)");
    document.body.appendChild(layer);

    var div = document.createElement('div');
    div.style.zIndex = 3;
    div.id = 'box';
    div.style.position = (navigator.userAgent.indexOf('MSIE 6') > -1) ? 'absolute' : 'fixed';
    
    if(mediaType == 'music') {
        div.style.top = (width / 6) + 'px';
        div.style.left = (height / 2) + 'px';        
    }    
    else    {
        div.style.top = .05 * width + 'px';
        div.style.left = .1 * height + 'px';
    }    
    
    div.style.height = playerHeight + 10 + 'px';
    div.style.width = playerWidth + 10 + 'px';
    div.style.backgroundColor = 'black';
    div.style.border = '1px solid silver';
    div.style.padding = '20px';

    var closeButton = document.createElement('input');
    closeButton.setAttribute('type', 'button');
    closeButton.setAttribute('id', 'btnCloseLightBox');
    closeButton.setAttribute('onclick', 'CloseLightBox()');
    closeButton.setAttribute('value', 'Close');

    var playerDiv = document.createElement('div');
    
    var buttonCell = document.createElement('td');
    var buttonRow = document.createElement('tr');    
    var playerCell = document.createElement('td');
    var playerRow = document.createElement('tr');
    
    var table = document.createElement('table');
        
    //div.innerHTML = '';

    if (mediaUrl != null) {

        var player = document.getElementById('player');

        if (player != null) {
            
            if(navigator.appName == 'Microsoft Internet Explorer')
                player.stop();

            playerDiv.removeChild(player);
            playerDiv.setAttribute('class', 'emptyMediaPlayer');
        }

        playerDiv.innerHTML =
            '<object id="player" classid="clsid:22d6f312-b0f6-11d0-94ab-0080c74c7e95"'
            + 'type="application/x-oleobject" width="' + playerWidth + 'px' + '" height="' + playerHeight + 'px' + '">'
            + '<param name="showControls" value="true">'
            + '<param name="fileName" value="' + mediaUrl + '">'
            + '<PARAM name="uiMode" value="none">'
            + '<embed type="application/x-mplayer2" width="' + playerWidth + 'px' + '" height="' + playerHeight + 'px' + '"'
            + 'showcontrols="true" src="' + mediaUrl + '"><\/embed><\/object>';

        playerDiv.setAttribute('class', playerClass);
    }
    else {

        var mediaUrl = document.getElementById('ctl00_MainContent_hdnMediaUrl').getAttribute('value');

        playerDiv.innerHTML =
            '<object id="player" classid="clsid:22d6f312-b0f6-11d0-94ab-0080c74c7e95"'
            + 'type="application/x-oleobject" width="' + playerWidth + 'px' + '" height="' + playerHeight + 'px' + '">'
            + '<param name="showControls" value="true">'
            + '<param name="fileName" value="' + mediaUrl + '">'
            + '<PARAM name="uiMode" value="none">'
            + '<embed type="application/x-mplayer2" width="' + playerWidth + 'px' + '" height="' + playerHeight + 'px' + '"'
            + 'showcontrols="true" src="' + mediaUrl + '"><\/embed><\/object>';

        playerDiv.setAttribute('class', playerClass);
    }

    buttonCell.appendChild(closeButton);
    playerCell.appendChild(playerDiv);
    buttonRow.appendChild(buttonCell);
    playerRow.appendChild(playerCell);    
    table.appendChild(buttonRow);
    table.appendChild(playerRow);
    div.appendChild(table);
    document.body.appendChild(div);
}

function CloseLightBox() {

    stop();

    document.body.removeChild(document.getElementById('lightBoxBackGround'));
    document.body.removeChild(document.getElementById('box'));

}