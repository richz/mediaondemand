function showProgress() {

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
    layer.style.opacity = '.6';
    layer.style.filter += ("progid:DXImageTransform.Microsoft.Alpha(opacity=60)");
    document.body.appendChild(layer);

    var div = document.createElement('div');
    div.style.zIndex = 3;
    div.id = 'box';
    div.style.position = (navigator.userAgent.indexOf('MSIE 6') > -1) ? 'absolute' : 'fixed';
    div.style.top = '50px';
    div.style.left = (width / 2) - (width / 12) + 'px';
    div.style.height = '66px';
    div.style.width = '66px';
    div.style.backgroundColor = 'white';
    div.style.border = '2px solid silver';
    div.style.padding = '20px';

    div.innerHTML = '<div><img alt="Processing" src="../images/ajax-loaderCircle.gif" /></div>';

    document.body.appendChild(div);

}

function ForcePostBack() {

    //Force page postback
    __doPostBack('__Page', 'MyCustomArgument');
}

function showBox() {

    var hdnUpdateMode = document.getElementById('ctl00_MainContent_hdnUpdateMode').getAttribute('value');

    if (hdnUpdateMode == 'edit') {
        var title = document.getElementById('ctl00_MainContent_hdnTitle').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnTitle').getAttribute('value');
        var location = document.getElementById('ctl00_MainContent_hdnLocation').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnLocation').getAttribute('value');
        var isViewable = document.getElementById('ctl00_MainContent_hdnIsViewable').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnIsViewable').getAttribute('value');
        var artist = document.getElementById('ctl00_MainContent_hdnArtist').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnArtist').getAttribute('value');
        var description = document.getElementById('ctl00_MainContent_hdnDescription').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnDescription').getAttribute('value');
        var genre = document.getElementById('ctl00_MainContent_hdnGenre').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnGenre').getAttribute('value');        
        var duration = document.getElementById('ctl00_MainContent_hdnDuration').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnDuration').getAttribute('value');
        var album = document.getElementById('ctl00_MainContent_hdnAlbum').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnAlbum').getAttribute('value');

        //var medid = document.getElementById('ctl00_MainContent_hdnMedId').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnMedId').getAttribute('value');
    }
    else {

        var title = '';
        var location = '';        
        var artist = '';
        var description = '';
        var genre = '';        
        var duration = '';
        var album = '';    
    }
    var mediaType = document.getElementById('ctl00_MainContent_hdnMediaType').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnMediaType').getAttribute('value');
    
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
    layer.style.opacity = '.6';
    layer.style.filter += ("progid:DXImageTransform.Microsoft.Alpha(opacity=60)");
    document.body.appendChild(layer);

    var div = document.createElement('div');
    div.style.zIndex = 3;
    div.id = 'box';
    div.style.position = (navigator.userAgent.indexOf('MSIE 6') > -1) ? 'absolute' : 'fixed';
    div.style.top = '50px';
    div.style.left = (width / 2) - (width / 12) + 'px';
    div.style.height = '350px';
    div.style.width = '300px';
    div.style.backgroundColor = 'white';
    div.style.border = '2px solid silver';
    div.style.padding = '20px';
    
    var selectedIsViewable = '';
    var selectedMediaType = '';
    
    if (hdnUpdateMode == 'edit') {
        
        if (isViewable == 'Y') {

            selectedIsViewable = '<select ID="ddlIsViewable"><option value="Y" selected="selected">Yes</option><option value="N">No</option></select>';
        }
        else
            selectedIsViewable = '<select ID="ddlIsViewable"><option value="Y">Yes</option><option value="N" selected="selected">No</option></select>';
          
    }
    else
    {
        selectedIsViewable = '<select ID="ddlIsViewable"><option value="Y" selected="selected">Yes</option><option value="N">No</option></select>';          
    }

    switch (mediaType) {

        case 'movie':
            selectedMediaType = '<select ID="ddlMediaType"><option value="movie" selected="selected">Movie</option><option value="tv">TV</option><option value="basketball">Basketball</option><option value="musicvideo">Music Video</option><option value="music">Music</option></select>';
            break;
        case 'tv':
            selectedMediaType = '<select ID="ddlMediaType"><option value="movie">Movie</option><option value="tv" selected="selected">TV</option><option value="basketball">Basketball</option><option value="musicvideo">Music Video</option><option value="music">Music</option></select>';
            break;
        case 'basketball':
            selectedMediaType = '<select ID="ddlMediaType"><option value="movie">Movie</option><option value="tv">TV</option><option value="basketball" selected="selected">Basketball</option><option value="musicvideo">Music Video</option><option value="music">Music</option></select>';
            break;            
        case 'musicvideo':
            selectedMediaType = '<select ID="ddlMediaType"><option value="movie">Movie</option><option value="tv">TV</option><option value="basketball">Basketball</option><option value="musicvideo" selected="selected">Music Video</option><option value="music">Music</option></select>';
            break;
        case 'music':
            selectedMediaType = '<select ID="ddlMediaType"><option value="movie">Movie</option><option value="tv">TV</option><option value="basketball">Basketball</option><option value="musicvideo">Music Video</option><option value="music" selected="selected">Music</option></select>';
            break;
    }  

    div.innerHTML = '<h1>Add/Edit Media Record</h1><br/><br/><center><table><tr><td align="right"><label id="lblTitle">Title</label></td><td colspan="2" align="left"><input ID="txtTitle" type="text" value="' + title + '"/></td></tr><tr><td align="right"><label id="lblLocation">Location</label></td><td colspan="2" align="left"><input ID="txtLocation" value="' + location + '" type="text"/></td></tr><tr><td align="right"><label id="lblIsViewable">Is Viewable</label></td><td colspan="2" align="left">' + selectedIsViewable + '</td></tr><tr><td align="right"><label id="lblArtist">Artist</label></td><td colspan="2" align="left"d><input ID="txtArtist" value="' + artist + '" type="text"/></td></tr><tr><td align="right"><label id="lblDescription">Description</label></td><td colspan="2" align="left"><input ID="txtDescription" value="' + description + '" type="text"/></td></tr><tr><td align="right"><label id="lblGenre">Genre</label></td><td colspan="2" align="left"><input ID="txtGenre" value="' + genre + '" type="text"/></td></tr><tr><td align="right"><label id="lblMediaType">Media Type</label></td><td colspan="2" align="left">' + selectedMediaType + '</td></tr><tr><td align="right"><label id="lblDuration">Duration</label></td><td colspan="2" align="left"><input ID="txtDuration" value="' + duration + '" type="text"/></td></tr><tr><td align="right"><label id="lblAlbum">Album</label></td><td colspan="2" align="left"><input ID="txtAlbum" value="' + album + '" type="text"/></td></tr><tr><td colspan="3" align="right"><tr><td></td><td><input id="btnSave" onclick="Save()" type="button" value="Apply"/></td><td><input id="btnCancel" onclick="Cancel()" type="button" value="Cancel" /></td></tr></table></center>';
      
    document.body.appendChild(div);    
}

function Cancel() {

    //alert('Cancel');

    var addButton = document.getElementById('ctl00_MainContent_btnAddNewMediaRow');
    addButton.click();

    CloseLightBox();

}

function Save() {

    //alert('Save');

    var saveButton = document.getElementById('ctl00_MainContent_btnApplyChanges');

    //Update Hidden fields
    var hdnTitle = document.getElementById('ctl00_MainContent_hdnTitle');
    hdnTitle.setAttribute('value', document.getElementById('txtTitle').value);

    var hdnLocation = document.getElementById('ctl00_MainContent_hdnLocation');
    hdnLocation.setAttribute('value', document.getElementById('txtLocation').value);

    var hdnIsViewable = document.getElementById('ctl00_MainContent_hdnIsViewable');
    hdnIsViewable.setAttribute('value', document.getElementById('ddlIsViewable').options[document.getElementById('ddlIsViewable').selectedIndex].value);

    var hdnArtist = document.getElementById('ctl00_MainContent_hdnArtist');
    hdnArtist.setAttribute('value', document.getElementById('txtArtist').value);

    var hdnDescription = document.getElementById('ctl00_MainContent_hdnDescription');
    hdnDescription.setAttribute('value', document.getElementById('txtDescription').value);

    var hdnGenre = document.getElementById('ctl00_MainContent_hdnGenre');
    hdnGenre.setAttribute('value', document.getElementById('txtGenre').value);

    var hdnMediaType = document.getElementById('ctl00_MainContent_hdnMediaType');
    hdnMediaType.setAttribute('value', document.getElementById('ddlMediaType').options[document.getElementById('ddlMediaType').selectedIndex].value);

    var hdnDuration = document.getElementById('ctl00_MainContent_hdnDuration');
    hdnDuration.setAttribute('value', document.getElementById('txtDuration').value);

    var hdnAlbum = document.getElementById('ctl00_MainContent_hdnAlbum');
    hdnAlbum.setAttribute('value', document.getElementById('txtAlbum').value);
    
    saveButton.click();

    CloseLightBox();

}

function CloseLightBox() {

    document.body.removeChild(document.getElementById('lightBoxBackGround'));
    document.body.removeChild(document.getElementById('box'));

}

