function showMediaInPopupWindow(mediaType) {

    if (mediaType == 'video')
        CloseVideo();
    else // music 
    {
        playerDiv.innerHTML = str;
    }
    
    var mediaUrl = document.getElementById('ctl00_MainContent_hdnMediaUrl').getAttribute('value');
    var mediaId = document.getElementById('ctl00_MainContent_hdnMediaId').getAttribute('value');

    var queryString = '?mediaUrl=' + mediaUrl;

    if (_arrWin[0] != null) // popup window is open
    {
        _arrWin[0].location = 'PopupMedia.aspx' + queryString;
    }
    else {
        var windowOptions;
        if (mediaType == 'video')
            windowOptions = 'width=400,height=300,toolbar=no, location=yes,directories=no,status=yes,menubar=no,scrollbars=no,copyhistory=no, resizable=yes';
        else // music
        {
            windowOptions = 'width=250,height=20,toolbar=no, location=yes,directories=no,status=yes,menubar=no,scrollbars=no,copyhistory=no, resizable=no';
        }

        _arrWin[0] = window.open('PopupMedia.aspx' + queryString, 'childWindow', windowOptions);
    }
}

//function showMediaInMainWindow(mediaUrl) {

//    if (_arrWin[0]) {

//        var mediaUrl = document.getElementById('ctl00_MainContent_hdnMediaUrl').getAttribute('value');

//        _arrWin[0] = null;

//        playMedia(mediaUrl, 'video', false);

////        var btnPlayInPopup = document.getElementById('btnPlayInPopup');

////        if (btnPlayInPopup != null)
////            btnPlayInPopup.disabled = '';    
//    }
//}

function ForcePostBack(lnkMovieLink, mediaType) {

    var mediaUrl = lnkMovieLink.getAttribute('param');
    var mediaId = lnkMovieLink.getAttribute('mediaId');

    document.getElementById('ctl00_MainContent_hdnMediaUrl').setAttribute('value', mediaUrl);
    document.getElementById('ctl00_MainContent_hdnMediaId').setAttribute('value', mediaId);

    playMedia(mediaUrl, mediaType, false);

    //Force page postback to set Movie Url
    //__doPostBack('__Page', 'MyCustomArgument');
}

function CloseVideo() {

    if (navigator.appName == 'Microsoft Internet Explorer' && document.getElementById('player') != null)
        stop();

    //    var playerDiv = document.getElementById('videoPlayer');

    //    playerDiv.innerHTML = '';

    document.body.removeChild(document.getElementById('lightBoxBackGround'));
    document.body.removeChild(document.getElementById('mediaBox'));

//    if (_arrWin[0])
//        _arrWin[0] = null;

    javascript:scroll(0, 0);
}

//function StopMusicPlayer() {
//    if (navigator.appName == 'Microsoft Internet Explorer' && document.getElementById('player') != null)
//        stop();

//    var browser = BrowserDetect.browser;
//    var str = '';

//    switch (browser) {
//        case 'FireFox':
//            {
//                str = '<object id="player"'

//                if (mediaType == 'video') {
//                    str += ' type="application/x-ms-wmp" width="100%" height="100%" autosize="-1">';
//                }
//                else // music 
//                {
//                    str += ' type="application/x-ms-wmp" width="400px" height="45px">';
//                }

//                str += '<param name="showControls" value="true">'
//                    + '<param name="fileName" value="">'
//                    + '<param name="uiMode" value="full">'
//                    + '<param name="StretchToFit" value="true">'
//                    + '<param name="Autostart" value="1">'
//                    + '<param name="AutoSize" value="-1">'
//                    + '</object>';
//            }
//            break;
//        case 'IE':
//            {
//                str = '<object id="player" classid="clsid:22d6f312-b0f6-11d0-94ab-0080c74c7e95"';

//                if (mediaType == 'video') {
//                    str += ' type="application/x-ms-wmp" width="100%" height="100%" autosize="-1">';
//                }
//                else // music 
//                {
//                    str += ' type="application/x-ms-wmp" width="400px" height="43px">';
//                }

//                str += '<param name="showControls" value="true">'
//                + '<param name="fileName" value="">'
//                + '<param name="uiMode" value="full">'
//                + '<param name="StretchToFit" value="true">'
//                + '<param name="AutoSize" value="-1">'
//                + '</object>';
//            }
//            break;
//        case 'Chrome':
//            {
//                str = '<object id="player"'

//                if (mediaType == 'video') {
//                    str += ' type="application/x-ms-wmp" width="100%" height="100%" autosize="-1">';
//                }
//                else {
//                    str += ' type="application/x-ms-wmp" width="400px" height="45px">';
//                }

//                str += '<param name="showControls" value="true">'
//                + '<param name="fileName" value="">'
//                + '<param name="uiMode" value="full">'
//                + '<param name="StretchToFit" value="true">'
//                + '<param name="AutoSize" value="-1">'
//                + '</object>';
//            }
//            break;

//    }

//    playerDiv.innerHTML = str;

//    
//}

function playMedia(mediaUrl, mediaType, isPopup) {
    var w;
    var h;
    var playerDiv;
    var browser = BrowserDetect.browser;
    var str = '';

    if (mediaType == 'video') {
        var width;
        var height;

        if (!isPopup) {
            width = document.documentElement.clientWidth + document.documentElement.scrollLeft;
            height = document.documentElement.scrollHeight;

            var btnCloseVideo = document.createElement('input');
            btnCloseVideo.id = 'btnCloseVideo';
            btnCloseVideo.setAttribute('type', 'button');
            btnCloseVideo.setAttribute('onclick', 'CloseVideo()');
            btnCloseVideo.setAttribute('value', 'Close Video');
            btnCloseVideo.style.styleFloat = 'right';

            var btnPlayInPopup = document.createElement('input');
            btnPlayInPopup.id = 'btnPlayInPopup';
            btnPlayInPopup.setAttribute('type', 'button');
            btnPlayInPopup.setAttribute('onclick', 'showMediaInPopupWindow("video")');
            btnPlayInPopup.setAttribute('value', 'Show In Popup Window');
            btnPlayInPopup.style.styleFloat = 'left';
            btnPlayInPopup.style.display = 'block';

            var buttonDiv = document.createElement('div');
            buttonDiv.id = 'buttonDiv';
            buttonDiv.style.width = '100%';

            buttonDiv.appendChild(btnPlayInPopup);
            buttonDiv.appendChild(btnCloseVideo);

        }
        else // popup 
        {
            width = '400';
            height = '300';
        }

        playerDiv = document.createElement('div');
        playerDiv.id = 'videoPlayer';
        playerDiv.style.zIndex = 100;
        playerDiv.style.marginLeft = 'auto';
        playerDiv.style.height = '100' + '%';

        var layer = document.createElement('div');
        layer.style.zIndex = 2;
        layer.id = 'lightBoxBackGround';
        layer.style.position = 'absolute';
        layer.style.top = '0px';
        layer.style.left = '0px';
        layer.style.height = height + 'px';
        layer.style.width = width + 'px';
        layer.style.backgroundColor = 'black';

        var div = document.createElement('div');
        div.style.zIndex = 3;
        div.id = 'mediaBox';
        div.style.position = (navigator.userAgent.indexOf('MSIE 6') > -1) ? 'absolute' : 'fixed';
        div.style.top = '0px';
        div.style.left = '5' + '%';
        div.style.height = '90' + '%';
        div.style.width = '90' + '%';
        div.style.backgroundColor = 'black';

        if (!isPopup) {
            div.appendChild(buttonDiv);
        }

        div.appendChild(playerDiv);

        document.body.appendChild(div);
        document.body.appendChild(layer);

    }
    else // music
    {
        if (!isPopup) {
            playerDiv = document.getElementById('musicPlayer');

            var btnPlayInPopup = document.getElementById('btnPlayInPopup');
            btnPlayInPopup.style.display = 'block';
        }
        else // popup
        {
            playerDiv = document.createElement('div');
            playerDiv.id = 'musicPlayer';
            playerDiv.style.height = '100' + '%';
            playerDiv.style.width = '100' + '%';

            document.body.appendChild(playerDiv);
        }
    }

    switch (browser) {
        case 'FireFox':
            {
                str = '<object id="player"';

                if (mediaType == 'video') {
                    str += ' type="application/x-ms-wmp" width="100%" height="100%" autosize="-1">';
                }
                else // music 
                {
                    str += ' type="application/x-ms-wmp" width="400px" height="45px" autosize="-1">';
                }

                str += '<param name="showControls" value="true">'
                    + '<param name="fileName" value="' + mediaUrl + '">'
                    + '<param name="uiMode" value="full">'
                    + '<param name="StretchToFit" value="true">'
                    + '<param name="AutoSize" value="-1">'
                    + '</object>';
            }
            break;
        case 'IE':
            {
                str = '<object id="player" classid="clsid:22d6f312-b0f6-11d0-94ab-0080c74c7e95"';

                if (mediaType == 'video') {
                    str += ' type="application/x-ms-wmp" width="100%" height="100%" autosize="-1">';
                }
                else // music
                {
                    str += ' type="application/x-ms-wmp" width="400px" height="43px" autosize="-1">';
                }

                str += '<param name="showControls" value="true">'
                + '<param name="fileName" value="' + mediaUrl + '">'
                + '<param name="uiMode" value="full">'
                + '<param name="StretchToFit" value="true">'
                + '<param name="AutoSize" value="-1">'
                + '</object>';
            }
            break;
        case 'Chrome':
            {
                str = '<object id="player"';

                if (mediaType == 'video') {
                    str += ' type="application/x-ms-wmp" width="100%" height="100%" autosize="-1">';
                }
                else // music 
                {
                    str += ' type="application/x-ms-wmp" width="400px" height="45px" autosize="-1">';
                }

                str += '<param name="showControls" value="true">'
                    + '<param name="fileName" value="' + mediaUrl + '">'
                    + '<param name="uiMode" value="full">'
                    + '<param name="StretchToFit" value="true">'
                    + '<param name="AutoSize" value="-1">'
                    + '</object>';
            }
            break;
    }

    playerDiv.innerHTML = str;
}

function stop() {

    document.getElementById('player').stop();
}


var BrowserDetect = {
    init: function () {
        this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
        this.version = this.searchVersion(navigator.userAgent)
			|| this.searchVersion(navigator.appVersion)
			|| "an unknown version";
        this.OS = this.searchString(this.dataOS) || "an unknown OS";
    },
    searchString: function (data) {
        for (var i = 0; i < data.length; i++) {
            var dataString = data[i].string;
            var dataProp = data[i].prop;
            this.versionSearchString = data[i].versionSearch || data[i].identity;
            if (dataString) {
                if (dataString.indexOf(data[i].subString) != -1)
                    return data[i].identity;
            }
            else if (dataProp)
                return data[i].identity;
        }
    },
    searchVersion: function (dataString) {
        var index = dataString.indexOf(this.versionSearchString);
        if (index == -1) return;
        return parseFloat(dataString.substring(index + this.versionSearchString.length + 1));
    },
    dataBrowser: [
		{
		    string: navigator.userAgent,
		    subString: "Chrome",
		    identity: "Chrome"
		},
		{ string: navigator.userAgent,
		    subString: "OmniWeb",
		    versionSearch: "OmniWeb/",
		    identity: "OmniWeb"
		},
		{
		    string: navigator.vendor,
		    subString: "Apple",
		    identity: "Safari",
		    versionSearch: "Version"
		},
		{
		    prop: window.opera,
		    identity: "Opera"
		},
		{
		    string: navigator.vendor,
		    subString: "iCab",
		    identity: "iCab"
		},
		{
		    string: navigator.vendor,
		    subString: "KDE",
		    identity: "Konqueror"
		},
		{
		    string: navigator.userAgent,
		    subString: "Firefox",
		    identity: "FireFox"
		},
		{
		    string: navigator.vendor,
		    subString: "Camino",
		    identity: "Camino"
		},
		{		// for newer Netscapes (6+)
		    string: navigator.userAgent,
		    subString: "Netscape",
		    identity: "Netscape"
		},
		{
		    string: navigator.userAgent,
		    subString: "MSIE",
		    identity: "IE",
		    versionSearch: "MSIE"
		},
		{
		    string: navigator.userAgent,
		    subString: "Gecko",
		    identity: "Mozilla",
		    versionSearch: "rv"
		},
		{ 		// for older Netscapes (4-)
		    string: navigator.userAgent,
		    subString: "Mozilla",
		    identity: "Netscape",
		    versionSearch: "Mozilla"
		}
	],
    dataOS: [
		{
		    string: navigator.platform,
		    subString: "Win",
		    identity: "Windows"
		},
		{
		    string: navigator.platform,
		    subString: "Mac",
		    identity: "Mac"
		},
		{
		    string: navigator.userAgent,
		    subString: "iPhone",
		    identity: "iPhone/iPod"
		},
		{
		    string: navigator.platform,
		    subString: "Linux",
		    identity: "Linux"
		}
	]

};

BrowserDetect.init();