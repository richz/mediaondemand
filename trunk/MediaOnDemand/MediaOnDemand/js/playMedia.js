function ForcePostBack(lnkMovieLink) {

    var url = lnkMovieLink.getAttribute('param');

    document.getElementById('ctl00_MainContent_hdnMediaUrl').setAttribute('value', url);
    
    //Force page postback to set Movie Url
    __doPostBack('__Page', 'MyCustomArgument');    
}