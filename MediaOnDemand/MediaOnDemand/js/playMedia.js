function ForcePostBack(lnkMovieLink, mediaType) {

    var url = lnkMovieLink.getAttribute('param');

    document.getElementById('ctl00_MainContent_hdnMediaUrl').setAttribute('value', url);

    playMedia(url, mediaType);
    //showLightBox(url, mediaType);

    //Force page postback to set Movie Url
    //__doPostBack('__Page', 'MyCustomArgument');
}

function playMedia(mediaUrl, mediaType) {

    var playerWidth = 0;
    var playerHeight = 0;
    var playerClass = '';

    if (mediaType == 'music') {

        playerHeight = 45;

    }
    else  // video
    {
        playerHeight = .8 * document.documentElement.clientHeight;

    }

    playerWidth = .8 * document.documentElement.clientWidth;

    //playerClass = 'videoMediaPlayer';


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

    div.style.top = .05 * width + 'px';
    div.style.left = .1 * height + 'px';

    div.style.height = playerHeight + 20 + 'px';
    div.style.width = playerWidth + 20 + 'px';
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

    if (mediaUrl != null) {

        var player = document.getElementById('player');

        if (player != null) {

            stop();

            playerDiv.removeChild(player);
            playerDiv.setAttribute('class', 'emptyMediaPlayer');
        }

        playerDiv.innerHTML =
            '<object id="player" classid="clsid:22d6f312-b0f6-11d0-94ab-0080c74c7e95"'
            + 'type="application/x-oleobject" width="' + playerWidth + 'px' + '" height="' + playerHeight + 'px' + '">'
            + '<param name="showControls" value="true">'
            + '<param name="fileName" value="' + mediaUrl + '">'
            + '<PARAM name="uiMode" value="mini">'
            + '<embed type="application/x-mplayer2" width="' + playerWidth + 'px' + '" height="' + playerHeight + 'px' + '"'
            + 'showcontrols="true" src="' + mediaUrl + '"><\/embed><\/object>';
    }
    else
        playerDiv.innerHTML = '<h1>No media found</h1>';

    playerDiv.style.Width = playerWidth;
    playerDiv.style.Height = playerHeight;

    buttonCell.appendChild(closeButton);
    playerCell.appendChild(playerDiv);
    buttonRow.appendChild(buttonCell);
    playerRow.appendChild(playerCell);
    table.appendChild(buttonRow);
    table.appendChild(playerRow);
    div.appendChild(table);
    document.body.appendChild(div);

}

function stop() {

    if (navigator.appName == 'Microsoft Internet Explorer' && document.getElementById('player' != null))
        document.getElementById('player').stop();
}

function CloseLightBox() {

    stop();

    document.body.removeChild(document.getElementById('lightBoxBackGround'));
    document.body.removeChild(document.getElementById('box'));

}