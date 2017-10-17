function cancel() {
    let req = new XMLHttpRequest();

    let data = new FormData();
    data.append("cancel", "yes");

    req.open("POST", window.location.href, true);
    req.send(data);

    if (refreshInterval) {
        clearInterval(refreshInterval);
        refreshInterval = false;
    }

    req.onreadystatechange = function () {
        if (XMLHttpRequest.DONE === req.readyState
            && req.status === 200) {
            console.log("cancel sent");
        }
    };
}