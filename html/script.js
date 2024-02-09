$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    document.onkeyup = function(data) {
        if (data.which == 27) {
            $.post("https://police/exit", JSON.stringify({}));
            return
        }
    };

    $("#a").click(function(){
        $.post("https://police/main",JSON.stringify({
            text:"a",
        }));
        return;
    })
    $("#b").click(function(){
        $.post("https://police/main",JSON.stringify({
            text:"b",
        }));
        return;
    })
    $("#c").click(function(){
        $.post("https://police/main",JSON.stringify({
            text:"c",
        }));
        return;
    })
    $("#d").click(function(){
        $.post("https://police/main",JSON.stringify({
            text:"d",
        }));
        return;
    })
    $("#e").click(function(){
        $.post("https://police/main",JSON.stringify({
            text:"e",
        }));
        return;
    })
    $("#f").click(function(){
        $.post("https://police/main",JSON.stringify({
            text:"f",
        }));
        return;
    })
})