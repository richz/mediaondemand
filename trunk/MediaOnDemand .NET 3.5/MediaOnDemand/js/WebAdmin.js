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
    layer.style.opacity = '.5';
    layer.style.filter += ("progid:DXImageTransform.Microsoft.Alpha(opacity=60)");

    var progressIndicator = document.createElement('div');
    progressIndicator.style.zIndex = 3;
    progressIndicator.id = 'progressIndicator';
    //box.style.position = (navigator.userAgent.indexOf('MSIE 6') > -1) ? 'absolute' : 'fixed';
    progressIndicator.style.position = 'absolute';

    progressIndicator.style.top = 200 + 'px'//((.5 * height) - (.5 * progressIndicator.style.height)) + 'px';
    progressIndicator.style.left = ((.5 * width) - (progressIndicator.style.width)) + 'px';

    progressIndicator.style.height = '100px';
    progressIndicator.style.width = '100px';
    progressIndicator.style.backgroundColor = 'transparent';

    progressIndicator.innerHTML = '<img id="progressImg" style="z-index:4" alt="" src="../images/progressIndicator.gif"/>';

    document.body.appendChild(progressIndicator);

    document.body.appendChild(layer);
}

function ForcePostBack() {

    //Force page postback
    __doPostBack('__Page', 'MyCustomArgument');
}


function showEditLightBox() {

    var width = document.documentElement.clientWidth + document.documentElement.scrollLeft;
    var height = document.documentElement.scrollHeight;

    var updateMode = document.getElementById('ctl00_MainContent_hdnUpdateMode').getAttribute('value');

    if (updateMode == 'edit') {
        var title = document.getElementById('ctl00_MainContent_hdnTitle').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnTitle').getAttribute('value');
        var location = document.getElementById('ctl00_MainContent_hdnLocation').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnLocation').getAttribute('value');
        var isViewable = document.getElementById('ctl00_MainContent_hdnIsViewable').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnIsViewable').getAttribute('value');
        var artist = document.getElementById('ctl00_MainContent_hdnArtist').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnArtist').getAttribute('value');
        var description = document.getElementById('ctl00_MainContent_hdnDescription').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnDescription').getAttribute('value');
        var genre = document.getElementById('ctl00_MainContent_hdnGenre').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnGenre').getAttribute('value');
        var duration = document.getElementById('ctl00_MainContent_hdnDuration').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnDuration').getAttribute('value');
        var album = document.getElementById('ctl00_MainContent_hdnAlbum').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnAlbum').getAttribute('value');
        var posterImageUrl = document.getElementById('ctl00_MainContent_hdnPosterImageUrl').getAttribute('value') == null ? '' : document.getElementById('ctl00_MainContent_hdnPosterImageUrl').getAttribute('value');
    }
    else {

        var title = '';
        var location = '';
        var artist = '';
        var description = '';
        var genre = '';
        var duration = '';
        var album = '';
        var posterImageUrl = '';

    }

    var width = document.documentElement.clientWidth + document.documentElement.scrollLeft;
    var height = document.documentElement.scrollHeight;
    var layer = document.createElement('div');
    layer.style.zIndex = 2;
    layer.id = 'lightBoxBackGround';
    layer.style.position = 'absolute';
    layer.style.top = '0px';
    layer.style.left = '0px';
    layer.style.height = (height - 50) + 'px';
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
    div.style.left = (width / 2) - (width / 10) + 'px';
    div.style.height = '350px';
    div.style.width = '300px';
    div.style.backgroundColor = 'white';
    div.style.border = '2px solid silver';
    div.style.padding = '20px';

    var mediaType = document.getElementById('ctl00_MainContent_hdnMediaType').getAttribute('value');

    var selectedIsViewable = '';
    var selectedMediaType = '';

    if (updateMode == 'edit') {

        if (isViewable == 'Y') {

            selectedIsViewable = '<select ID="ddlIsViewable"><option value="Y" selected="selected">Yes</option><option value="N">No</option></select>';
        }
        else
            selectedIsViewable = '<select ID="ddlIsViewable"><option value="Y">Yes</option><option value="N" selected="selected">No</option></select>';

    }
    else {
        selectedIsViewable = '<select ID="ddlIsViewable"><option value="Y" selected="selected">Yes</option><option value="N">No</option></select>';
    }


    switch (mediaType) {

        case 'movie':
            selectedMediaType = '<select ID="ddlMediaType"><option value="movie" selected="selected">Movie</option><option value="tv">TV</option><option value="sports">Sports</option><option value="musicvideo">Music Video</option><option value="music">Music</option></select>';
            break;
        case 'tv':
            selectedMediaType = '<select ID="ddlMediaType"><option value="movie">Movie</option><option value="tv" selected="selected">TV</option><option value="sports">Sports</option><option value="musicvideo">Music Video</option><option value="music">Music</option></select>';
            break;
        case 'sports':
            selectedMediaType = '<select ID="ddlMediaType"><option value="movie">Movie</option><option value="tv">TV</option><option value="sports" selected="selected">Sports</option><option value="musicvideo">Music Video</option><option value="music">Music</option></select>';
            break;
        case 'musicvideo':
            selectedMediaType = '<select ID="ddlMediaType"><option value="movie">Movie</option><option value="tv">TV</option><option value="sports">Sports</option><option value="musicvideo" selected="selected">Music Video</option><option value="music">Music</option></select>';
            break;
        case 'music':
            selectedMediaType = '<select ID="ddlMediaType"><option value="movie">Movie</option><option value="tv">TV</option><option value="sports">Sports</option><option value="musicvideo">Music Video</option><option value="music" selected="selected">Music</option></select>';
            break;
    }

    if (updateMode == 'edit') {

        div.innerHTML = '<h1>Edit Media Record</h1>'
        + '<br/><br/><center><table>'
        + '<tr><td align="right"><label id="lblTitle">Title</label></td>'
        + '<td colspan="2" align="left"><input ID="txtTitle" type="text" value="' + title + '"/></td></tr>'
        + '<tr><td align="right"><label id="lblLocation">Location</label></td>'
        + '<td colspan="2" align="left"><input ID="txtLocation" value="' + location + '" type="text"/></td></tr>'
        + '<tr><td align="right"><label id="lblIsViewable">Is Viewable</label></td>'
        + '<td colspan="2" align="left">' + selectedIsViewable + '</td></tr>'
        + '<tr><td align="right"><label id="lblArtist">Artist</label></td>'
        + '<td colspan="2" align="left"d><input ID="txtArtist" value="' + artist + '" type="text"/></td></tr>'
        + '<tr><td align="right"><label id="lblDescription">Description</label></td>'
        + '<td colspan="2" align="left"><input ID="txtDescription" value="' + description + '" type="text"/></td></tr>'
        + '<tr><td align="right"><label id="lblGenre">Genre</label></td>'
        + '<td colspan="2" align="left"><input ID="txtGenre" value="' + genre + '" type="text"/></td></tr>'
        + '<tr><td align="right"><label id="lblMediaType">Media Type</label></td>'
        + '<td colspan="2" align="left">' + selectedMediaType + '</td></tr>'
        + '<tr><td align="right"><label id="lblDuration">Duration</label></td>'
        + '<td colspan="2" align="left"><input ID="txtDuration" value="' + duration + '" type="text"/></td></tr>'
        + '<tr><td align="right"><label id="lblAlbum">Album</label></td>'
        + '<td colspan="2" align="left"><input ID="txtAlbum" value="' + album + '" type="text"/></td></tr>'
        + '<tr><td align="right"><label id="lblPosterImageUrl">Poster Image File</label></td>'
        + '<td colspan="2" align="left"><input ID="txtPosterImageUrl" value="' + posterImageUrl + '" type="text"/></td></tr>'
        + '<tr><td colspan="3" align="right"></td></tr>'
        + '<tr><td><input id="btnSave" onclick="Save()" type="button" value="Apply"/></td>'
        + '<td><input id="btnCancel" onclick="Cancel()" type="button" value="Cancel" /></td></tr>'
        + '</table></center>';
    }
    else {

        div.innerHTML = '<h1>Add Media Record</h1>'
        + '<br/><br/><center><table>'
        + '<tr><td align="right"><label id="lblTitle">Title</label></td>'
        + '<td colspan="2" align="left"><input ID="txtTitle" type="text" value="' + title + '"/></td></tr>'
        + '<tr><td align="right"><label id="lblLocation">Location</label></td>'
        + '<td colspan="2" align="left"><input ID="txtLocation" value="' + location + '" type="text"/></td></tr>'
        + '<tr><td align="right"><label id="lblIsViewable">Is Viewable</label></td>'
        + '<td colspan="2" align="left">' + selectedIsViewable + '</td></tr>'
        + '<tr><td align="right"><label id="lblArtist">Artist</label></td>'
        + '<td colspan="2" align="left"d><input ID="txtArtist" value="' + artist + '" type="text"/></td></tr>'
        + '<tr><td align="right"><label id="lblDescription">Description</label></td>'
        + '<td colspan="2" align="left"><input ID="txtDescription" value="' + description + '" type="text"/></td></tr>'
        + '<tr><td align="right"><label id="lblGenre">Genre</label></td>'
        + '<td colspan="2" align="left"><input ID="txtGenre" value="' + genre + '" type="text"/></td></tr>'
        + '<tr><td align="right"><label id="lblMediaType">Media Type</label></td>'
        + '<td colspan="2" align="left">' + selectedMediaType + '</td></tr>'
        + '<tr><td align="right"><label id="lblDuration">Duration</label></td>'
        + '<td colspan="2" align="left"><input ID="txtDuration" value="' + duration + '" type="text"/></td></tr>'
        + '<tr><td align="right"><label id="lblAlbum">Album</label></td>'
        + '<td colspan="2" align="left"><input ID="txtAlbum" value="' + album + '" type="text"/></td></tr>'
        + '<tr><td align="right"><label id="lblPosterImageUrl">Poster Image File</label></td>'
        + '<td colspan="2" align="left"><input ID="txtPosterImageUrl" value="' + posterImageUrl + '" type="text"/></td></tr>'
        + '<tr><td colspan="3" align="right"></td></tr>'
        + '<tr><td><input id="btnSave" onclick="Save()" type="button" value="Apply"/></td>'
        + '<td><input id="btnCancel" onclick="Cancel()" type="button" value="Cancel" /></td></tr>'
        + '</table></center>';
    }
    document.body.appendChild(div);

}

function Cancel() {

    //alert('Cancel');

    var addButton = document.getElementById('ctl00_MainContent_btnAddNewMediaRow');
    addButton.click();

    CloseLightBox();

}

function validateLightboxFields() {

    var titleField = document.getElementById('txtTitle');
    var locationField = document.getElementById('txtLocation');
    var titleLabel = document.getElementById('lblTitle');
    var locationLabel = document.getElementById('lblLocation');

    titleLabel.style.color = 'Black';
    titleLabel.style.fontWeight = 'Normal';
    locationLabel.style.color = 'Black';
    locationLabel.style.fontWeight = 'Normal';

    if (titleField.value == '' || locationField.value == '') {

        alert('Please fill out the required fields');

        if (titleField.value == '') {
            titleLabel.style.color = 'Red';
            titleLabel.style.fontWeight = 'Bold';
        }
        if (locationField.value == '') {
            locationLabel.style.color = 'Red';
            locationLabel.style.fontWeight = 'Bold';
        }

        return false;

    }

    // TO DO Add more validation

    return true;

}

function Save() {

    var isValid = validateLightboxFields();

    if (isValid) {
        var saveButton = document.getElementById('ctl00_MainContent_btnApplyChanges');

        //Update Hidden fields
        var hdnTitle = document.getElementById('ctl00_MainContent_hdnTitle');
        hdnTitle.setAttribute('value', trim(document.getElementById('txtTitle').value));

        var hdnLocation = document.getElementById('ctl00_MainContent_hdnLocation');
        hdnLocation.setAttribute('value', trim(document.getElementById('txtLocation').value));

        var hdnIsViewable = document.getElementById('ctl00_MainContent_hdnIsViewable');
        hdnIsViewable.setAttribute('value', trim(document.getElementById('ddlIsViewable').options[document.getElementById('ddlIsViewable').selectedIndex].value));

        var hdnArtist = document.getElementById('ctl00_MainContent_hdnArtist');
        hdnArtist.setAttribute('value', trim(document.getElementById('txtArtist').value));

        var hdnDescription = document.getElementById('ctl00_MainContent_hdnDescription');
        hdnDescription.setAttribute('value', trim(document.getElementById('txtDescription').value));

        var hdnGenre = document.getElementById('ctl00_MainContent_hdnGenre');
        hdnGenre.setAttribute('value', trim(document.getElementById('txtGenre').value));

        var hdnMediaType = document.getElementById('ctl00_MainContent_hdnMediaType');
        hdnMediaType.setAttribute('value', trim(document.getElementById('ddlMediaType').options[document.getElementById('ddlMediaType').selectedIndex].value));

        var hdnDuration = document.getElementById('ctl00_MainContent_hdnDuration');
        hdnDuration.setAttribute('value', trim(document.getElementById('txtDuration').value));

        var hdnAlbum = document.getElementById('ctl00_MainContent_hdnAlbum');
        hdnAlbum.setAttribute('value', trim(document.getElementById('txtAlbum').value));

        var hdnPosterImageUrl = document.getElementById('ctl00_MainContent_hdnPosterImageUrl');
        hdnPosterImageUrl.setAttribute('value', trim(document.getElementById('txtPosterImageUrl').value));

        saveButton.click();

        CloseLightBox();
    }
}