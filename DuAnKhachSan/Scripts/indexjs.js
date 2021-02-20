

$(function () {
    'use strict';
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

    var checkin = $('#timeCheckIn').datepicker({
        onRender: function (date) {
            return date.valueOf() < now.valueOf() ? 'disabled' : '';
        }
    }).on('changeDate', function (ev) {
        if (ev.date.valueOf() > checkout.date.valueOf()) {
            var newDate = new Date(ev.date)
            newDate.setDate(newDate.getDate() + 1);
            checkout.setValue(newDate);
        }
        checkin.hide();
        $('#timeCheckOut')[0].focus();
    }).data('datepicker');
    var checkout = $('#timeCheckOut').datepicker({
        onRender: function (date) {
            return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
        }
    }).on('changeDate', function (ev) {
        checkout.hide();
    }).data('datepicker');
});

function menuDropClick(id) {
    var url = $("#RedirectTo").val();
    location.href = url+"/"+id;
}

if (jQuery().owlCarousel) {
    jQuery("#promotion_owl").owlCarousel({
        nav: true,
        navText: ["<img src='/Image/icon/prev_3.png'>", "<img src='/Image/icon/next_3.png'>"],
        slideSpeed: 800,
        dotsSpeed: 400,
        items: 3,
        autoHeight: true,
        dotsSpeed: false,
        autoplay: true,
         loop: true,
        margin: 10,
    });
    jQuery("#rooms_owl").owlCarousel({
        nav: true,
        navText: ["<img src='/Image/icon/prev_3.png'>", "<img src='/Image/icon/next_3.png'>"],
        slideSpeed: 800,
        dotsSpeed: 400,
        items: 2,
        autoHeight: true,
        dotsSpeed: false,
        autoplay: true,
        loop: true,
        margin: 10,
        autoplayTimeout: 8000
    });
    jQuery("#dinning_owl").owlCarousel({
        nav: true,
        navText: ["<img src='/Image/icon/prev_3.png'>", "<img src='/Image/icon/next_3.png'>"],
        slideSpeed: 800,
        dotsSpeed: 400,
        items: 2,
        autoHeight: true,
        dotsSpeed: false,
        autoplay: true,
        loop: true,
        margin: 10,
    });
    
}

