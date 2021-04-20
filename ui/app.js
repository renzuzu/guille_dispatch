let pic = false

$(function(){
    window.addEventListener("message", function(event){
        if (event.data.callnum) {
            if (event.data.callnum == 0) {
                $("#text").html("Sin llamadas recibidas");
            }
            else {
                $("#text").html(event.data.content + "");
                const row = table.insertRow();
            }
            $("#callnum").html(event.data.callnum + "/");
        }
        if (event.data.totalcalls) {
            $("#num").html(event.data.totalcalls + "");
        }
        if (event.data.show == true) {
            var selector = document.getElementById("all")
            selector.style = "display:block;"
        }
        if (event.data.show == false) {
            var selector = document.getElementById("all")
            selector.style = "display:none;"
        }
        if (event.data.left) {
            
            var $av = $(".left");
            $av.addClass('anim');
            setTimeout(function() {
                console.log("pepe")
                var $av = $(".left");
                $av.removeClass('anim');
            },1000);
        }
        if (event.data.pic) {
            if ($('#vehicle').length != 0) {
                const vehicle = document.getElementById("vehicle")
                vehicle.remove();
            } 
            pic = true
            let model = event.data.model;
            console.log(model)
            const element = document.getElementById("text")
            
            const htmlString = `<img class="vehicle" id="vehicle" src="https://bandidosrp.es/ac/vehiclespic/${model}.webp" alt="${model}"></img>`
            const insertAfter = (element, htmlString) => element.insertAdjacentHTML("afterend", htmlString)
            insertAfter(element, htmlString)
            var $frame = $(".t-frame");
            var $border = $(".t-frame-inf-border");
            var $l = $(".left");
            var $lborder = $(".left-border")
            $l.addClass('space');
            $lborder.addClass('space');
            var $r = $(".right");
            var $rborder = $(".right-border")
            $r.addClass('space');
            $rborder.addClass('space');
            var $av = $(".avpag");
            var $avborder = $(".avpag-border")
            $av.addClass('space');
            $avborder.addClass('space');
            $frame.addClass('space')
            $border.addClass('space')
            $frame.removeClass('space')
            $border.removeClass('space')
            $frame.addClass('space')
            $border.addClass('space')
        }
        else {
            
            if (!event.data.avkey) {
                pic = false
                var $frame = $(".t-frame");
                var $border = $(".t-frame-inf-border");
                var $l = $(".left");
                var $lborder = $(".left-border")
                $l.removeClass('space');
                $lborder.removeClass('space');
                var $r = $(".right");
                var $rborder = $(".right-border")
                $r.removeClass('space');
                $rborder.removeClass('space');
                var $av = $(".avpag");
                var $avborder = $(".avpag-border")
                $av.removeClass('space');
                $avborder.removeClass('space');
                $frame.removeClass('space')
                $border.removeClass('space')
                $frame.removeClass('space')
                $border.removeClass('space')
                $frame.removeClass('space')
                $border.removeClass('space')
                if ($('#vehicle').length != 0) {
                    const vehicle = document.getElementById("vehicle")
                    vehicle.remove();
                }
            }
        } 
       
        if (event.data.right) {
            var $av = $(".right");
            $av.addClass('anim');
            setTimeout(function() {
                $av.removeClass('anim');
            },1000);
        }
        if (event.data.avkey) {
            var $av = $(".avpag");
            $av.addClass('anim');
            setTimeout(function() {
                $av.removeClass('anim');
            },1000);
        }
        if (event.data.newalert) {
            var toInsert = `<tr style="margin-top:500px"><td class="table-container"><th class="table-code">Alerta de robo</th><th class="content-table-text">${event.data.content}</th><th class="table-id">${event.data.id}</th></td></tr>`
            $('#table').append(toInsert);
            var $av = $(".t-frame-sup-border");
            var $text1 = $(".callnum");
            var $text2 = $(".cust-text");
            var $text3 = $(".num");
            var $pic = $(".infsvg");
            $av.addClass('alert');
            $text1.addClass('alert-contrast');
            $text2.addClass('alert-contrast');
            $text3.addClass('alert-contrast');
            $pic.addClass('alert-contrast');
            setTimeout(function() {
                $av.removeClass('alert');
                $text1.removeClass('alert-contrast');
                $text2.removeClass('alert-contrast');
                $text3.removeClass('alert-contrast');
                $pic.removeClass('alert-contrast');
            },2000);
        }
        if (event.data.restart == true) {
            $("#callnum").html(0 + "/");
            $("#num").html(0);
            $("#text").html("Sin llamadas recibidas");
        }
        if (event.data.newambualert) {
            console.log("wtf")
            var $av = $(".t-frame-sup-border");
            var $text1 = $(".callnum");
            var $text2 = $(".cust-text");
            var $text3 = $(".num");
            var $pic = $(".infsvg");
            $av.addClass('ambualert');
            $text1.addClass('alert-contrast');
            $text2.addClass('alert-contrast');
            $text3.addClass('alert-contrast');
            $pic.addClass('alert-contrast');
            setTimeout(function() {
                $av.removeClass('ambualert');
                $text1.removeClass('alert-contrast');
                $text2.removeClass('alert-contrast');
                $text3.removeClass('alert-contrast');
                $pic.removeClass('alert-contrast');
            },2000);
        }
        if (event.data.newmecaalert) {
            console.log("wtf")
            var $av = $(".t-frame-sup-border");
            var $text1 = $(".callnum");
            var $text2 = $(".cust-text");
            var $text3 = $(".num");
            var $pic = $(".infsvg");
            $av.addClass('mecaalert');
            $text1.addClass('alert-contrast');
            $text2.addClass('alert-contrast');
            $text3.addClass('alert-contrast');
            $pic.addClass('alert-contrast');
            setTimeout(function() {
                $av.removeClass('mecaalert');
                $text1.removeClass('alert-contrast');
                $text2.removeClass('alert-contrast');
                $text3.removeClass('alert-contrast');
                $pic.removeClass('alert-contrast');
            },2000);
        }
        if (event.data.newtaxialert) {
            console.log("wtf")
            var $av = $(".t-frame-sup-border");
            var $text1 = $(".callnum");
            var $text2 = $(".cust-text");
            var $text3 = $(".num");
            var $pic = $(".infsvg");
            $av.addClass('taxialert');
            $text1.addClass('alert-contrast');
            $text2.addClass('alert-contrast');
            $text3.addClass('alert-contrast');
            $pic.addClass('alert-contrast');
            setTimeout(function() {
                $av.removeClass('taxialert');
                $text1.removeClass('alert-contrast');
                $text2.removeClass('alert-contrast');
                $text3.removeClass('alert-contrast');
                $pic.removeClass('alert-contrast');
            },2000);
        }
        var $sup = $(".t-frame-sup-border");
        var $inf = $(".t-frame-inf-border");
        if (event.data.inConfig == true) {
            $sup.addClass('InConfig')
            $inf.addClass('InConfig')
            const element = document.getElementById("t-frame")
            const htmlString = `<h1 class="cust-text" id="cust-text">Presiona I para terminar la customización</h1>`
            const insertAfter = (element, htmlString) => element.insertAdjacentHTML("afterend", htmlString)
            insertAfter(element, htmlString)
        }
    })
})

$(function(){
    $("#all").draggable();
    $("#configmenu").draggable();
});

document.addEventListener("DOMContentLoaded", () => {
    console.log("Loaded")
    $("#text").html("Sin llamadas recibidas");
    var selector = document.getElementById("all")
    selector.style = "display:none;"
});

document.addEventListener('keypress', logKey);


function logKey(e) {
    if (e.keyCode == 105) {
        var $sup = $(".t-frame-sup-border");
        var $inf = $(".t-frame-inf-border");
        const cust = document.getElementById("cust-text")
        cust.remove();
        $sup.removeClass('InConfig')
        $inf.removeClass('InConfig')
        $.post(`http:/${GetParentResourceName()}/exit`, JSON.stringify({}));
    }
}

let wtfdude = false

setInterval(function() {
    console.log();
    if ($('#text').text().length > 209) {
        var $frame = $(".t-frame");
        var $border = $(".t-frame-inf-border");
        var $l = $(".left");
        var $lborder = $(".left-border")
        $l.addClass('space');
        $lborder.addClass('space');
        var $r = $(".right");
        var $rborder = $(".right-border")
        $r.addClass('space');
        $rborder.addClass('space');
        var $av = $(".avpag");
        var $avborder = $(".avpag-border")
        $av.addClass('space');
        $avborder.addClass('space');
        $frame.addClass('space')
        $border.addClass('space')
        wtfdude = true
    }
    else {
        if (wtfdude == true && pic == false ) {
            
            var $frame = $(".t-frame");
            var $border = $(".t-frame-inf-border");
            $frame.removeClass('space')
            $border.removeClass('space')
            var $l = $(".left");
            $l.removeClass('space');
            var $r = $(".right");
            $r.removeClass('space');
            var $r = $(".avpag");
            $r.removeClass('space');
            var $lborder = $(".left-border")
            $lborder.removeClass('space');
            var $rborder = $(".right-border")
            $rborder.removeClass('space');
            var $avborder = $(".avpag-border")
            $avborder.removeClass('space');
            wtfdude = false
        }
    }
    if (parseInt($('#callnum').text()) > 9) {
        var $pepe = $(".num");
        $pepe.addClass('space');
    }
    else {
        var $pepe = $(".num");
        $pepe.removeClass('space');
    }
}, 0);

// MENU


$(function() {
    document.getElementById("images-button").addEventListener("click", tooglepics);
    document.getElementById("delete-button").addEventListener("click", deletealerts);
    function tooglepics() {
        $.post(`http:/${GetParentResourceName()}/tooglepic`, JSON.stringify({}));
    }
    function deletealerts() {
        $.post(`http:/${GetParentResourceName()}/deletealerts`, JSON.stringify({}));
    }
});
