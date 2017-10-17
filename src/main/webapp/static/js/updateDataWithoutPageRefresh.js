function getNewData() {
    let req = new XMLHttpRequest();

    req.open("GET", window.location.href, true);
    req.send();

    req.onreadystatechange = function () {
        if (XMLHttpRequest.DONE === req.readyState) {

            let redirectUrl = req.getResponseHeader("X-Redirect-Url");

            if (redirectUrl) {
                console.log("going to reload the page");
                window.location.replace(redirectUrl);
            }

            if (req.status === 200) {

                let respDOM = new DOMParser().parseFromString(req.responseText, "text/html");

                let current = document.body;
                let updated = respDOM.body;

                if (current.innerHTML !== updated.innerHTML) {
                    console.log("going to update body");
                    current.innerHTML = updated.innerHTML;
                }

                if (respDOM.getElementById("fire-button")) {
                    clearInterval(refreshInterval);
                    refreshInterval = false;
                }
            }
        }
    };
}