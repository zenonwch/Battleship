function postForm() {
    let req = new XMLHttpRequest();

    let fireButton = document.getElementById("fire-button");
    fireButton.setAttribute("disabled", "true");

    let form = document.getElementById("fire");
    let data = new FormData(form);

    for (let pair of data.entries()) {
        console.log(pair[0] + ": " + pair[1]);
    }

    req.open("POST", window.location.href, true);
    req.send(data);

    req.onreadystatechange = function () {
        if (XMLHttpRequest.DONE === req.readyState && req.status === 200) {
            fireButton.removeAttribute("disabled");

            if (!refreshInterval) {
                refreshInterval = setInterval(getNewData, timeout * 1000);
            }
        }
    };
}