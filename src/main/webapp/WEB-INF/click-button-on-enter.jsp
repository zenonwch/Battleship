<script>
    document.onkeyup = function (evt) {
        let e = window.event || evt;

        if (e.keyCode === 13 || e.which === 13) {
            document.getElementsByTagName("button")[0].click();
        }
    }
</script>