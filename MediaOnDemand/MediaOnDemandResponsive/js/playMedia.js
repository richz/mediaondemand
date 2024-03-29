﻿function SetStars(controlId, startNum) {

    var i = 1;

    var controlID = controlId.substring(0, controlId.length - 1);
    var imageButton;
    var imageUrl;

    while (i <= 5) {

        imageButton = document.getElementById(controlID + '' + i);

        if (i <= startNum)
            imageUrl = 'images/rating/ratingStarFilled.png';
        else
            imageUrl = 'images/rating/ratingStarEmpty.png';

        if (imageButton)
            imageButton.setAttribute('src', imageUrl);

        i++;
    }


}

function UnSetStars(controlId, startNum) {

    //    var i = 1;

    //    var controlID = controlId.substring(0, controlId.length - 1);
    //    var imageButton;

    //    while (i <= 5) {

    //        imageButton = document.getElementById(controlID + '' + i);

    //        imageButton.setAttribute('src', '~/images/rating/ratingStarEmpty.png');

    //        i++;
    //    }
}


String.prototype.trim = function () {
    return this.replace(/^\s*/, "").replace(/\s*$/, "");
}

function showMediaInPopupWindow(mediaType) {
    var browser = BrowserDetect.browser;
    var position = 0;

    if (browser == 'IE' && document.getElementById('player') != null) // stop player - IE working only 
    {
        position = document.getElementById('player').currentPosition;
        document.getElementById('player').Stop();
    }

    if (mediaType == 'movie' || mediaType == 'tv')
        CloseVideo();
    else // music 
    {
        var btnPlayInPopup = document.getElementById('btnPlayInPopup');
        btnPlayInPopup.style.display = 'none';

        var musicplayer = document.getElementById('musicPlayer');
        if (musicplayer != null)
            musicplayer.innerHTML = '';
    }

    var mediaUrl = document.getElementById('ctl00_MainContent_hdnMediaUrl').getAttribute('value');
    var mediaId = document.getElementById('ctl00_MainContent_hdnMediaId').getAttribute('value');

    var width;
    var height;

    if (mediaType == 'movie' || mediaType == 'tv') {
        width = 400;
        height = 300;
    }
    else {
        width = 400;
        //height = 135;
        height = 250;
    }

    var queryString = '?mediaUrl=' + mediaUrl + '&mediaType=' + mediaType + '&mediaPos=' + position;

    if (_arrWin[0] != null) // popup window is open
    {
        _arrWin[0].close();
        _arrWin[0] = null;
        //_arrWin[0].location = 'PopupMedia.aspx' + queryString;
    }
    var windowOptions;
    if (mediaType == 'movie' || mediaType == 'tv')
        windowOptions = 'width=' + width + ',height=' + height + ',toolbar=no, location=yes,directories=no,status=yes,menubar=no,scrollbars=no,copyhistory=no, resizable=yes';
    else // music
    {
        windowOptions = 'width=' + width + ',height=' + height + ',toolbar=no, location=yes,directories=no,status=yes,menubar=no,scrollbars=no,copyhistory=no, resizable=no';
    }

    _arrWin[0] = window.open('PopupMedia.aspx' + queryString, 'childWindow', windowOptions);

}

//function playMediaInMainWindow(mediaType, mediaUrl, position) {

//    if (_arrWin[0]) {

//        var mainWindow = window.opener;
//        var page;

//        switch (mediaType) {
//            case 'music':
//                page = 'StreamMusic.aspx';
//                break;
//            case 'movie':
//                page = 'WatchMovies.aspx';
//                break;
//            case 'tv':
//                page = 'WatchTvSeries.aspx';
//                break;

//                var queryString = '?playInMainWindow=true' + '&mediaUrl=' + mediaUrl + '&mediaType=' + mediaType + '&mediaPos=' + position;

//                mainWindow.location = page + queryString;

//                alert(mainWindow.location);

//                _arrWin[0] = null;
//                self.close();
//        }
//    }
//}

function ForcePostBack(mediaLink) {
    
    var mediaType = getQueryVariable('Type');    
    var mediaUrl = mediaLink.getAttribute('param');
    var mediaId = mediaLink.getAttribute('mediaId');
    var mediaTitle;
    
    //if (mediaType == 'movie' || mediaType == 'tv') {
        
        mediaTitle = mediaLink.getAttribute('mediaTitle');
        $('input[id$=hdnMediaTitle]').val(mediaTitle);
    //}

    $('input[id$=hdnMediaUrl]').val(mediaUrl);
    $('input[id$=hdnMediaId]').val(mediaId);

    //if (_arrWin[0] != null) // popup window is open
    //{
    //    showMediaInPopupWindow(mediaType);
    //}
    //else {
        playMedia(mediaUrl, mediaType, false, 0);
    //}
    //Force page postback to set Movie Url
    //__doPostBack('__Page', 'MyCustomArgument');

}

function RemoveChildWindow() {

    _arrWin[0] = null;

}

function CloseVideo() {


    //if (navigator.appName == 'Microsoft Internet Explorer' && document.getElementById('player') != null)
    //    stop();

    var lightBox = document.getElementById('lightBoxBackGround');

    if (lightBox != null) {
        document.body.removeChild(lightBox);
        document.body.removeChild(document.getElementById('mediaBox'));
    }

    javascript: scroll(0, 0);

    window.location.reload()

    //document.getElementById('ctl00_MainContent_hdnHasMediaPlayed').setAttribute('value', 'Y');

    //__doPostBack('__Page', 'MyCustomArgument');

    //var btnSaveMediaPlayed = document.getElementById('ctl00_MainContent_btnSaveMediaPlayed');

    //btnSaveMediaPlayed.click();
}

function CloseMusicPlayer() {

    if (navigator.appName == 'Microsoft Internet Explorer' && document.getElementById('player') != null)
        stop();

    var btnSaveMediaPlayed = document.getElementById('ctl00_MainContent_btnSaveMediaPlayed');

    btnSaveMediaPlayed.click();

}

function playMedia(mediaUrl, mediaType, isPopup, position) {
    var w;
    var h;
    var playerDiv;
    var browser = BrowserDetect.browser;
    var str = '';

    //if (mediaType == 'movie' || mediaType == 'tv') {
        var width;
        var height;

        if (!isPopup) {
            width = document.documentElement.clientWidth + document.documentElement.scrollLeft;
            height = document.documentElement.scrollHeight;
            var mediaTitle = $("input[id$='hdnMediaTitle']").val();
            /*
            var btnPlayInPopup = document.createElement('input');
            btnPlayInPopup.id = 'btnPlayInPopup';
            btnPlayInPopup.setAttribute('type', 'button');
            btnPlayInPopup.setAttribute('onclick', 'showMediaInPopupWindow("' + mediaType + '")');
            btnPlayInPopup.setAttribute('value', 'Show In Popup Window');
            //btnPlayInPopup.style.styleFloat = 'left';
            btnPlayInPopup.style.display = 'block';
            */
            var btnCloseVideo = document.createElement('input');
            btnCloseVideo.id = 'btnCloseVideo';
            btnCloseVideo.setAttribute('type', 'button');
            btnCloseVideo.setAttribute('onclick', 'CloseVideo()');
            btnCloseVideo.setAttribute('value', 'Close Video');
            //btnCloseVideo.style.styleFloat = 'right';

            var buttonDivTableTd1 = document.createElement('td');
            buttonDivTableTd1.align = 'left';
            //buttonDivTableTd1.appendChild(btnPlayInPopup);
            buttonDivTableTd1.style.width = '100px';

            var buttonDivTableTd2 = document.createElement('td');
            buttonDivTableTd2.align = 'center';
            buttonDivTableTd2.innerHTML = '<label id="lblTitle" style="font-size: 20px; font-weight: bold; color:white">' + mediaTitle + '</label>';

            var buttonDivTableTd3 = document.createElement('td');
            buttonDivTableTd3.align = 'right';
            buttonDivTableTd3.appendChild(btnCloseVideo);
            buttonDivTableTd3.style.width = '100px';

            var buttonDivTableTr = document.createElement('tr');
            buttonDivTableTr.style.width = '100%';

            buttonDivTableTr.appendChild(buttonDivTableTd1);
            buttonDivTableTr.appendChild(buttonDivTableTd2);
            buttonDivTableTr.appendChild(buttonDivTableTd3);

            var buttonDivTable = document.createElement('table');
            buttonDivTable.style.width = '100%';
            buttonDivTable.style.top = '0px';
            buttonDivTable.appendChild(buttonDivTableTr);

            var buttonDiv = document.createElement('div');
            buttonDiv.id = 'buttonDiv';            
            buttonDiv.style.width = '100%';
            buttonDiv.style.Background = 'white';

            buttonDiv.appendChild(buttonDivTable);

        }
        else // popup 
        {
            width = '400';
            height = '350';
        }

        playerDiv = document.createElement('div');
        playerDiv.id = 'videoPlayer';
        playerDiv.style.top = '0px';
        playerDiv.style.backgroundColor = 'black';
        playerDiv.style.zIndex = 1033;
        playerDiv.style.marginLeft = '2.5%';
        playerDiv.style.width = '95%';
        playerDiv.style.height = '95%';

        var layer = document.createElement('div');
        layer.style.zIndex = 1031;
        layer.id = 'lightBoxBackGround';
        layer.style.position = 'absolute';
        layer.style.top = '0px';
        layer.style.left = '0px';
        layer.style.height = '1200' + 'px';
        layer.style.width = width + 'px';
        layer.style.backgroundColor = 'black';

        var div = document.createElement('div');
        div.style.zIndex = 1032;
        div.id = 'mediaBox';
        div.style.position = (navigator.userAgent.indexOf('MSIE 6') > -1) ? 'absolute' : 'fixed';
        div.style.top = '0px';
        div.style.left = '0px';
        div.style.left = '0' + '%';
        div.style.backgroundColor = 'black';

        if (!isPopup) {
            div.style.height = '90' + '%';

            div.appendChild(buttonDiv);
        }
        else {
            div.style.height = '100' + '%';
        }

        div.style.width = '100' + '%';
        div.appendChild(playerDiv);

        document.body.appendChild(div);
        document.body.appendChild(layer);

    /*}
    
    else // music
    {
        if (!isPopup) {

            playerDiv = document.createElement('div');
            playerDiv.id = 'videoPlayer';
            playerDiv.style.zIndex = 100;
            playerDiv.style.marginLeft = 'auto';
            playerDiv.style.height = '100' + '%';
            playerDiv = document.getElementById('musicPlayer');

            var btnPlayInPopup = document.getElementById('btnPlayInPopup');
            btnPlayInPopup.style.display = 'block';

            var btnCloseMusicPlayer = document.getElementById('btnCloseMusicPlayer');
            btnCloseMusicPlayer.style.display = 'block';
        }
        else // popup
        {
            playerDiv = document.createElement('div');
            playerDiv.id = 'musicPlayer';
            playerDiv.style.height = '100' + '%';
            playerDiv.style.width = '100' + '%';

            document.body.appendChild(playerDiv);
        }
        
    }*/

        //var html5 = !mediaUrl.endsWith('.mp4');

        if (strEndsWith(mediaUrl, '.mp4')) {
            var videoWidth = '100%';
            var videoHeight = '100%';

            str = '<video autobuffer width="' + videoWidth + '" height="' + videoHeight + '" controls autoplay onclick="this.play();"><source src="' + mediaUrl + '" type="video/mp4"><object data="' + mediaUrl + '" width="' + videoWidth + '" height="' + videoHeight + '" ><embed></object></video>';
        }
        else {
            switch (browser) {
                case 'FireFox':
                    {
                        str = '<object id="player"';

                        if (mediaType == 'movie' || mediaType == 'tv') {
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

                        if (mediaType == 'movie' || mediaType == 'tv') {

                            str += ' type="application/x-ms-wmp" width="100%" height="100%" autosize="-1">';
                        }
                        else // music
                        {
                            if (!isPopup)
                                str += ' type="application/x-ms-wmp" width="400px" height="40px" autosize="-1">';
                            else {
                                str += ' type="application/x-ms-wmp" width="400px" height="115px" autosize="-1">';
                                str += '<param name="showdisplay" value="true">';
                            }
                        }

                        str += '<param name="showControls" value="true">'
                            + '<param name="fileName" value="' + mediaUrl + '">';

                        str += '<PARAM NAME="CurrentPosition" VALUE="' + position + '">'

                        str += '<param name="uiMode" value="full">'
                          + '<param name="StretchToFit" value="true">'
                            + '<param name="AutoSize" value="-1">'
                            + '</object>';
                    }
                    break;
                case 'Chrome':
                    {
                        str = '<object id="player"';

                        if (mediaType == 'movie' || mediaType == 'tv') {
                            str += ' type="application/x-ms-wmp" width="100%" height="100%" autosize="-1">';
                        }
                        else // music 
                        {
                            if (!isPopup)
                                str += ' type="application/x-ms-wmp" width="420px" height="45px" autosize="-1">';
                            else {
                                str += ' type="application/x-ms-wmp" width="100%" height="52px" autosize="-1">';
                                str += '<param name="showdisplay" value="true">';
                            }
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
        }

    playerDiv.innerHTML = str;
    
    enableVideoClicks();
}

function strEndsWith(str, suffix) {
    return str.match(suffix + "$") == suffix;
}

function enableVideoClicks() {
    var videos = document.getElementsByTagName('video') || [];
    for (var i = 0; i < videos.length; i++) {
        // TODO: use attachEvent in IE
        videos[i].addEventListener('click', function (videoNode) {
            return function () {
                videoNode.play();
            };
        }(videos[i]));
    }
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


function ShowPosterImage(link) {

    var posterImageUrl = link.getAttribute('posterimageurl');

    if (trim(posterImageUrl) != '') {

        tooltip.show(posterImageUrl);

    }

}