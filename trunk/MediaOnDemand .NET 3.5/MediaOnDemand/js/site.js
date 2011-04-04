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

function trim(str, chars) {
    return ltrim(rtrim(str, chars), chars);
}

function ltrim(str, chars) {
    chars = chars || "\\s";
    return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
}

function rtrim(str, chars) {
    chars = chars || "\\s";
    return str.replace(new RegExp("[" + chars + "]+$", "g"), "");
}

//Tool Tip

var imageExists;

var tooltip = function () {
    var id = 'ToolTip';
    var top = 3;
    var left = 3;
    var maxw = 300;
    var speed = 10;
    var timer = 20;
    var endalpha = 95;
    var alpha = 0;
    var tt, t, c, b, h;

    var image;

    var ie = document.all ? true : false;
    return {
        show: function (v, w) {

            imageExists = true;

            var tester = new Image();
            tester.onerror = ImageDoesNotExist;
            tester.src = v;
            
            if (imageExists == true) {

                if (tt == null) {

                    tt = document.createElement('div');
                    tt.setAttribute('id', id);
                    t = document.createElement('div');
                    t.setAttribute('id', id + 'top');

                    image = document.createElement('img');
                    image.setAttribute('src', v);
                    image.setAttribute('alt', '');
                    image.setAttribute('height', '240px');
                    image.setAttribute('width', '200px');

                    //c = document.createElement('div');
                    //c.setAttribute('id', id + 'cont');

                    b = document.createElement('div');
                    b.setAttribute('id', id + 'bot');
                    tt.appendChild(t);
                    //tt.appendChild(c);

                    tt.appendChild(image);

                    tt.appendChild(b);
                    document.body.appendChild(tt);
                    tt.style.opacity = 0;
                    tt.style.filter = 'alpha(opacity=0)';
                    document.onmousemove = this.pos;
                }
                tt.style.display = 'block';

                //c.innerHTML = v;

                image.setAttribute('src', v);
                image.setAttribute('alt', '');
                image.setAttribute('height', '240px');
                image.setAttribute('width', '200px');

                tt.style.width = w ? w + 'px' : 'auto';
                if (!w && ie) {
                    t.style.display = 'none';
                    b.style.display = 'none';
                    tt.style.width = tt.offsetWidth;
                    t.style.display = 'block';
                    b.style.display = 'block';
                }
                if (tt.offsetWidth > maxw) { tt.style.width = maxw + 'px' }
                h = parseInt(tt.offsetHeight) + top;
                clearInterval(tt.timer);
                tt.timer = setInterval(function () { tooltip.fade(1) }, timer);
            }            
        },
        pos: function (e) {
            var u = ie ? event.clientY + document.documentElement.scrollTop : e.pageY;
            var l = ie ? event.clientX + document.documentElement.scrollLeft : e.pageX;
            tt.style.top = (u - h) + 'px';
            tt.style.left = (l + left) + 'px';
        },
        fade: function (d) {
            var a = alpha;
            if ((a != endalpha && d == 1) || (a != 0 && d == -1)) {
                var i = speed;
                if (endalpha - a < speed && d == 1) {
                    i = endalpha - a;
                } else if (alpha < speed && d == -1) {
                    i = a;
                }
                alpha = a + (i * d);
                tt.style.opacity = alpha * .01;
                tt.style.filter = 'alpha(opacity=' + alpha + ')';
            } else {
                clearInterval(tt.timer);
                if (d == -1) { tt.style.display = 'none' }
            }
        },
        hide: function () {

            if (tt != null) {
                clearInterval(tt.timer);
                tt.timer = setInterval(function () { tooltip.fade(-1) }, timer);
            }
        }
    };
} ();

function ImageDoesNotExist() {

    imageExists = false;
}