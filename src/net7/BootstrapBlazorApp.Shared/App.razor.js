export function init() {
    var wasm = document.getElementById('loading')
    if (wasm) {
        wasm.classList.add("is-done")
        var handler = window.setTimeout(function () {
            window.clearTimeout(handler)
            wasm.remove()
            document.body.classList.remove('overflow-hidden')
        }, 600);
    }
}
