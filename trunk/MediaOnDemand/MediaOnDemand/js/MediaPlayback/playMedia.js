function playMedia(mediaUrl, mediaTitle, mediaType) {

    document.getElementById('ctl00_MainContent_hdnMediaUrl').setAttribute('value', mediaUrl);
    document.getElementById('ctl00_MainContent_hdnMediaTitle').setAttribute('value', mediaTitle);

    var playerDiv = document.getElementById('mediaPlayer');

    if (!FlowPlayerPlaylist_Contains(mediaUrl)) {

        $("#playlist").prepend('<a href="' + mediaUrl + '">' + mediaTitle + '</span></a>');

        $f('player').play(mediaUrl);

        document.getElementById('mediaPlaylist').setAttribute('class', 'shown');
    }

}

function AddToFlowPlayerPlaylist(mediaUrl, mediaTitle) {

    if (!FlowPlayerPlaylist_Contains(mediaUrl)) {

        if ($("#playlist").children().length == 0) {

            $("#playlist").prepend('<a class="first" href="' + mediaUrl + '">' + mediaTitle + '</span></a>');

            $f('player').play(mediaUrl);
        }
        else
            $("#playlist").append('<a href="' + mediaUrl + '">' + mediaTitle + '</span></a>');

        document.getElementById('mediaPlaylist').setAttribute('class', 'shown');
    }
}

function ClearPlaylist() {

    $f("player").stop();
    $("#playlist").empty();
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

function showMediaPlayer(mediaPlayer) {

    document.getElementById(mediaPlayer).setAttribute('class', 'visibleVideoPlayer');
    document.getElementById('mediaPlaylist').setAttribute('class', 'shown');
}

function hideMediaPlayer(mediaPlayer) {

    ClearPlaylist();

    document.getElementById(mediaPlayer).setAttribute('class', 'hidden');
    document.getElementById('mediaPlaylist').setAttribute('class', 'hidden');
}