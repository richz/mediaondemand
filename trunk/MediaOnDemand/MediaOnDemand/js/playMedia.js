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

    _arrWin[0] = window.open('PopupMedia.aspx' + queryString, 'childWindow', windowOptions);

    //__doPostBack('__Page', 'MyCustomArgument');
}

function ForcePostBack(mediaUrl, mediaTitle, mediaType, lnkMovieLink, mediaId) {

    document.getElementById('ctl00_MainContent_hdnMediaUrl').setAttribute('value', mediaUrl);
    document.getElementById('ctl00_MainContent_hdnMediaId').setAttribute('value', mediaId);
    document.getElementById('ctl00_MainContent_hdnMediaTitle').setAttribute('value', mediaTitle);

    playMedia(mediaUrl, mediaTitle, mediaType);

    //Force page postback to set Movie Url
    //__doPostBack('__Page', 'MyCustomArgument');
}

function playMedia(mediaUrl, mediaTitle, mediaType) {

    var playerDiv = document.getElementById('mediaPlayer');

    if (mediaType == 'video') {
       
        if (!FlowPlayerPlaylist_Contains(mediaUrl)) {
            $("#playlist").prepend('<a href="' + mediaUrl + '">' + mediaTitle + '</span></a>');

            $f('player').play(mediaUrl);

            document.getElementById('mediaPlaylist').setAttribute('class', 'shown');    
        }
    }
    else {

        $f("player", "http://releases.flowplayer.org/swf/flowplayer-3.2.2.swf", {
            clip: {
                url: mediaUrl,
                autoPlay: true,
                bufferLength: 10,
                title: mediaTitle
            },
            plugins: {
                audio: {
                    url: '/my-plugins/flowplayer.audio.swf'
                }
            }
        });

    }
}

function AddToFlowPlayerPlaylist(mediaUrl, mediaTitle) {

    if (!FlowPlayerPlaylist_Contains(mediaUrl)) {

        animatedcollapse.show('collapsiblePlayerDiv');
        $("#playlist").append('<a href="' + mediaUrl + '">' + mediaTitle + '</span></a>');
    }

    document.getElementById('mediaPlaylist').setAttribute('class', 'shown');

//    if ($("#playlist").children().length == 0) {
//        $f('player').play(mediaUrl);
//    }
}

function ClearPlaylist() {

    $("#playlist").empty();
    $f("player").stop();    
}

function FlowPlayerPlaylist_Contains(item) {

    var contains = false;

    var expItem1 = location.href.substring(location.href, location.href.indexOf('pages'));
    var expItem2 = encodeURI(item.substring(item.indexOf('mediafiles')));

    var expItem = expItem1.concat(expItem2);

    var i = 0;

    for (i = 0; i < $("#playlist").children().length; i++) {

        var itemHref = $("#playlist")[0].children[i].href;

        if (itemHref == expItem) {
            contains = true;
        }

    }

    return contains;

}




function sleep(ms) {
    var dt = new Date();
    dt.setTime(dt.getTime() + ms);
    while (new Date().getTime() < dt.getTime());
}
