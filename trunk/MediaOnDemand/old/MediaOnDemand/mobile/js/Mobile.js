function touchMove(event) {

    alert('touchmove');
    event.preventDefault();
    curX = event.targetTouches[0].pageX - startX;
    curY = event.targetTouches[0].pageY - startY;
    event.targetTouches[0].target.style.webkitTransform =
        'translate(' + curX + 'px, ' + curY + 'px)';

    alert('endtouchmove');
}

function gestureChange(event) {
    // Insert your code here

    alert('hello');
}