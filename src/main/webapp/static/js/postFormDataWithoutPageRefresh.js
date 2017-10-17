function postForm() {
    let req = new XMLHttpRequest();

    let form = document.getElementById("fire");
    let data = new FormData(form);

    let pair = "";

    for (pair of data.entries()) {
        console.log(pair[0] + ": " + pair[1]);
    }

    req.open("POST", window.location.href, true);
    req.send(data);

    let fireButton = document.getElementById("fire-button");
    fireButton.setAttribute("disabled", "true");

    let inputs = document.getElementsByTagName("input");
    for(let input of inputs) {
        input.setAttribute("disabled", "true");
    }

    req.onreadystatechange = function () {
        if (XMLHttpRequest.DONE === req.readyState
            && req.status === 200
            && !refreshInterval) {
            refreshInterval = setInterval(getNewData, timeout * 1000);
        }
    };
}