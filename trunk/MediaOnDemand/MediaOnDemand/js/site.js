function getQueryVariable(variable) {
    var query = unescape(window.location.search.substring(1));
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == variable) {
            
            return pair[1];
        }
    }
}



function bookmarksite() {

    title = document.title; //'Community Improvement Organization Inc';
    url = window.location.href; //'www.improvingourcommunity.org';

    var browser = BrowserDetect.browser;

    switch (browser) {
        case 'FireFox':
            window.sidebar.addPanel(title, url, "");
            break;
        case 'IE':
            window.external.AddFavorite(url, title);
            break;
        case 'Chrome':
            //left = loginInfo.style.left + wrap.style.left;
            break;
    }
}

//function showBox() {

//    var width = document.documentElement.clientWidth + document.documentElement.scrollLeft;
//    var height = document.documentElement.scrollHeight;
//    var layer = document.createElement('div');
//    layer.style.zIndex = 2;
//    layer.id = 'lightBoxBackGround';
//    layer.style.position = 'absolute';
//    layer.style.top = '0px';
//    layer.style.left = '0px';
//    layer.style.height = height + 'px';
//    layer.style.width = width + 'px';
//    layer.style.backgroundColor = 'black';
//    layer.style.opacity = '.6';
//    layer.style.filter += ("progid:DXImageTransform.Microsoft.Alpha(opacity=60)");
//    document.body.appendChild(layer);

//}


function CloseLightBox() {

    document.body.removeChild(document.getElementById('lightBoxBackGround'));
    document.body.removeChild(document.getElementById('box'));

}