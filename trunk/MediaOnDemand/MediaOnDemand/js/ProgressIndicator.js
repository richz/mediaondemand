function startProgress() {

    //var button = document.getElementById('StartProgress').getAttribute('param');

    var progressControl = document.getElementById('ctl00_MainContent_ProgressControl_inner');

    progressControl.play();

    //$find('ProgressControl').play();

    //document.getElementById(button).click();

}

function stopProgress() {

    $find('ProgressControl').stop();

}