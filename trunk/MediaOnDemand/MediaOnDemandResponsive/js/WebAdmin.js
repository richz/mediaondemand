function showProgress() {

    var width = document.documentElement.clientWidth + document.documentElement.scrollLeft;
    var height = document.documentElement.scrollHeight;
    var layer = document.createElement('div');
    layer.style.zIndex = 2;
    layer.id = 'lightBoxBackGround';
    layer.style.position = 'absolute';
    layer.style.top = '0px';
    layer.style.left = '0px';
    layer.style.height = '1200px';
    layer.style.width = width + 'px';
    layer.style.backgroundColor = 'black';
    layer.style.opacity = '.5';
    layer.style.filter += ("progid:DXImageTransform.Microsoft.Alpha(opacity=50)");

    var progressIndicator = document.createElement('div');
    progressIndicator.style.zIndex = 3;
    progressIndicator.id = 'progressIndicator';
    //box.style.position = (navigator.userAgent.indexOf('MSIE 6') > -1) ? 'absolute' : 'fixed';
    progressIndicator.style.position = 'absolute';

    progressIndicator.style.top = 200 + 'px'//((.5 * height) - (.5 * progressIndicator.style.height)) + 'px';
    progressIndicator.style.left = ((.45 * width) - (progressIndicator.style.width)) + 'px';

    progressIndicator.style.height = '100px';
    progressIndicator.style.width = '100px';
    progressIndicator.style.backgroundColor = 'transparent';

    progressIndicator.innerHTML = '<img id="progressImg" style="z-index:4" alt="" src="images/ProgressIndicator/progressIndicator.gif"/>';

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

    var updateMode = $('input[id$=hdnUpdateMode]').val();

    if (updateMode == 'edit') {
        var title = $('input[id$=hdnTitle]').val() == null ? '' : $('input[id$=hdnTitle]').val();
        var location = $('input[id$=hdnLocation]').val() == null ? '' : $('input[id$=hdnLocation]').val();
        var isViewable = $('input[id$=hdnIsViewable]').val() == null ? '' : $('input[id$=hdnIsViewable]').val();
        var artist = $('input[id$=hdnArtist]').val() == null ? '' : $('input[id$=hdnArtist]').val();
        var description = $('input[id$=hdnDescription]').val() == null ? '' : $('input[id$=hdnDescription]').val();
        var genre = $('input[id$=hdnGenre]').val() == null ? '' : $('input[id$=hdnGenre]').val()
        var duration = $('input[id$=hdnDuration]').val() == null ? '' : $('input[id$=hdnDuration]').val();
        var posterImageUrl = $('input[id$=hdnPosterImageUrl]').val() == null ? '' : $('input[id$=hdnPosterImageUrl]').val();
        var album = $('input[id$=hdnAlbum]').val() == null ? '' : $('input[id$=hdnAlbum]').val();
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
    layer.style.zIndex = 10;
    layer.id = 'lightBoxBackGround';
    layer.style.position = 'absolute';
    layer.style.top = '0px';
    layer.style.left = '0px';
    layer.style.height = '1200px';//(height - 50) + 'px';
    layer.style.width = width + 'px';
    layer.style.backgroundColor = 'black';
    layer.style.opacity = '.6';
    layer.style.filter += ("progid:DXImageTransform.Microsoft.Alpha(opacity=60)");
    document.body.appendChild(layer);

    var div = document.createElement('div');
    div.style.zIndex = 11;
    div.id = 'box';
    div.style.position = (navigator.userAgent.indexOf('MSIE 6') > -1) ? 'absolute' : 'fixed';    
    div.style.height = '450px';
    div.style.width = '450px';
    div.style.top = height / 2 - 450 + 'px';//'50px';
    div.style.left = (width / 2) - (width / 10) + 'px';
    div.style.backgroundColor = 'white';
    div.style.border = '2px solid silver';
    div.style.padding = '20px';

    var mediaType = $('input[id$=hdnMediaType]').val();

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

    if (updateMode == 'edit') {

        div.innerHTML = '<h1 style="margin-right:auto; margin-left:auto; text-align: center">Edit Media Record</h1>'
        + '<br/><br/><table style="width: 100%">'
        + '<tr><td align="right" style="padding-right: 10px"><label id="lblTitle">Title</label></td>'
        + '<td colspan="2" align="left"><input ID="txtTitle" style="width: 275px" type="text" value="' + title + '"/></td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblLocation">Location</label></td>'
        + '<td colspan="2" align="left"><input ID="txtLocation" style="width: 275px" value="' + location + '" type="text"/></td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblIsViewable">Is Viewable</label></td>'
        + '<td colspan="2" align="left">' + selectedIsViewable + '</td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblArtist">Artist</label></td>'
        + '<td colspan="2" align="left"d><input ID="txtArtist" style="width: 275px" value="' + artist + '" type="text"/></td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblDescription">Description</label></td>'
        + '<td colspan="2" align="left"><input ID="txtDescription" style="width: 275px" value="' + description + '" type="text"/></td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblGenre">Genre</label></td>'
        + '<td colspan="2" align="left"><input ID="txtGenre" style="width: 275px" value="' + genre + '" type="text"/></td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblMediaType">Media Type</label></td>'
        + '<td colspan="2" align="left">' + selectedMediaType + '</td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblDuration">Duration</label></td>'
        + '<td colspan="2" align="left"><input ID="txtDuration" style="width: 275px" value="' + duration + '" type="text"/></td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblAlbum">Album</label></td>'
        + '<td colspan="2" align="left"><input ID="txtAlbum" style="width: 275px" value="' + album + '" type="text"/></td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblPosterImageUrl">Poster Image File</label></td>'
        + '<td colspan="2" align="left"><input ID="txtPosterImageUrl" style="width: 275px" value="' + posterImageUrl + '" type="text"/></td></tr>'
        + '<tr rowspan="2"><td colspan="3" align="right"><br/></td></tr>'
        + '<tr><td></td><td colspan="2" align="right"><input id="btnSave" onclick="Save()" type="button" value="Apply"/><input id="btnCancel" style="margin-left: 20px" onclick="Cancel()" type="button" value="Cancel" /></td>'
        + '</tr></table>';
    }
    else {

        div.innerHTML = '<h1 style="margin-right:auto; margin-left:auto; text-align: center">Add Media Record</h1>'
        + '<br/><br/><table style="width: 100%">'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblTitle">Title</label></td>'
        + '<td colspan="2" align="left"><input ID="txtTitle" style="width: 275px" type="text" value="' + title + '"/></td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblLocation">Location</label></td>'
        + '<td colspan="2" align="left"><input ID="txtLocation" style="width: 275px" value="' + location + '" type="text"/></td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblIsViewable">Is Viewable</label></td>'
        + '<td colspan="2" align="left">' + selectedIsViewable + '</td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblArtist">Artist</label></td>'
        + '<td colspan="2" align="left"d><input ID="txtArtist" style="width: 275px" value="' + artist + '" type="text"/></td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblDescription">Description</label></td>'
        + '<td colspan="2" align="left"><input ID="txtDescription" style="width: 275px" value="' + description + '" type="text"/></td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblGenre">Genre</label></td>'
        + '<td colspan="2" align="left"><input ID="txtGenre" style="width: 275px" value="' + genre + '" type="text"/></td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblMediaType">Media Type</label></td>'
        + '<td colspan="2" align="left">' + selectedMediaType + '</td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblDuration">Duration</label></td>'
        + '<td colspan="2" align="left"><input ID="txtDuration" style="width: 275px" value="' + duration + '" type="text"/></td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblAlbum">Album</label></td>'
        + '<td colspan="2" align="left"><input ID="txtAlbum" style="width: 275px" value="' + album + '" type="text"/></td></tr>'
        + '<tr><td align="right" style="padding-right: 5px"><label id="lblPosterImageUrl">Poster Image File</label></td>'
        + '<td colspan="2" align="left"><input ID="txtPosterImageUrl" style="width: 275px" value="' + posterImageUrl + '" type="text"/></td></tr>'
       + '<tr rowspan="2"><td colspan="3" align="right"><br/></td></tr>'
        + '<tr><td></td><td colspan="2" align="right"><input id="btnSave" onclick="Save()" type="button" value="Apply"/><input id="btnCancel" style="margin-left: 20px" onclick="Cancel()" type="button" value="Cancel" /></td>'
        + '</tr></table>';
    }
    document.body.appendChild(div);

}

function Cancel() {

    //alert('Cancel');
    
    CloseLightBox();

}

function validateLightboxFields() {

    var titleField = $('input[id=txtTitle]');
    var locationField = $('input[id=txtLocation]');
    var titleLabel = $('input[id=lblTitle]');
    var locationLabel = $('label[id=lblLocation]');

    titleLabel.css('color', 'Black');
    titleLabel.css('fontWeight', 'Normal');
    locationLabel.css('color', 'Black');
    locationLabel.css('fontWeight', 'Normal');

    if (titleField.val() == '' || locationField.val() == '') {

        alert('Please fill out the required fields');

        if (titleField.val() == '') {
            titleLabel.css('color', 'Red');
            titleLabel.css('fontWeight', 'Bold');
        }
        if (locationField.val() == '') {
            locationLabel.css('color', 'Red');
            locationLabel.css('fontWeight', 'Bold');
        }

        return false;
    }

    return true;
}

function Save() {

    var isValid = validateLightboxFields();

    if (isValid) {
        var saveButton = $('input[id$=btnApplyChanges]');

        //Update Hidden fields
        var hdnTitle = $('input[id$=hdnTitle]');
        hdnTitle.val(trim($('#txtTitle').val()));

        var hdnLocation = $('input[id$=hdnLocation]');
        hdnLocation.val(trim($('#txtLocation').val()));

        var hdnIsViewable = $('input[id$=hdnIsViewable]');
        hdnIsViewable.val(trim($('#ddlIsViewable :selected').text()));

        var hdnArtist = $('input[id$=hdnArtist]');
        hdnArtist.val(trim($('#txtArtist').val()));

        var hdnDescription = $('input[id$=hdnDescription]');
        hdnDescription.val(trim($('#txtDescription').val()));

        var hdnGenre = $('input[id$=hdnGenre]');
        hdnGenre.val(trim($('#txtGenre').val()));

        var hdnMediaType = $('input[id$=hdnMediaType');
        hdnMediaType.val(trim($('#ddlMediaType :selected').text()));

        var hdnDuration = $('input[id$=hdnDuration]');
        hdnDuration.val(trim($('input[id$=txtDuration').val()));

        var hdnAlbum = $('input[id$=hdnAlbum]');
        hdnAlbum.val(trim($('input[id$=txtAlbum]').val()));

        var hdnPosterImageUrl = $('input[id$=hdnPosterImageUrl]');
        hdnPosterImageUrl.val(trim($('input[id$=txtPosterImageUrl]').val()));

        eval(saveButton.attr('href'));

        CloseLightBox();
    }
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