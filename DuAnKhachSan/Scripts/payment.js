
var frame = $('.khungchonphong')
var index = 0;

(function ($) {
    "use strict";
    $('.column100').on('mouseover', function () {
        var table1 = $(this).parent().parent().parent();
        var table2 = $(this).parent().parent();
        var verTable = $(table1).data('vertable') + "";
        var column = $(this).data('column') + "";

        $(table2).find("." + column).addClass('hov-column-' + verTable);
        $(table1).find(".row100.head ." + column).addClass('hov-column-head-' + verTable);
    });

    $('.column100').on('mouseout', function () {
        var table1 = $(this).parent().parent().parent();
        var table2 = $(this).parent().parent();
        var verTable = $(table1).data('vertable') + "";
        var column = $(this).data('column') + "";

        $(table2).find("." + column).removeClass('hov-column-' + verTable);
        $(table1).find(".row100.head ." + column).removeClass('hov-column-head-' + verTable);
    });


})(jQuery);


$(document).ready(function () {
    $('#form_body').append($('#add_ele').html());
});

function selectType(obj) {

    var id = $(obj).val();
    var info = $('.thongtinphong:first');
    var khung = $('.khung:last');

    if (id != null) {
        $.ajax({
            url: "/Book/Select",
            data: { id: id },
            dataType: "json",
            type: "POST",
            success: function (res) {

                $('.motaphong:first').empty();
                $('.motaphong:first ').append(res.summ);
                khung.empty();
                if (res.count > 0) {
                    khung.append(info.html());
                    $('.anhphong:last img').attr('src', res.imglink);
                    $('.anhphong:last a').attr('href', res.link);
                    $('.giaphong:last').text(res.price + ' VND/night');
                }
                else {
                    khung.append('<h5 style="color:red">You have selected dates that are not available or specified too many occupants per room. Please adjust your search.</h5>');
                }
            }
        })
    }
}

function Add() {
    var att = ++index;
    $('.select').attr('display', 'none');
    $('#form_body').append($('#add_ele').html());
    // $('.khung:last').before($('#select').html());
    $('select:last').attr('name', (att).toString());
    $('.close_icon:last img').attr('data-id', att.toString());
    $('.amount:last img').attr('data-id', att.toString());
}


function remove(obj) {
    var id = $(obj).data('id');

    $(obj).parent().parent().parent().parent().remove();
    cal();
}

function changeAmount() {
    cal();
}

function cal() {
    var sel = $('.giaphong');
    var amo = $('.amo');
    var listGia = new Array();
    var listAmount = new Array();
    var sum = 0;
    var night = parseInt($('#nights').text())
    sel.each(function (index, ele) {
        if (ele.textContent != "") {
            var gia = ele.textContent.slice(0, 7);
            listGia.push(parseInt(gia));
        }
    });
    amo.each(function (index, ele) {
        if (ele.value != "") {
            listAmount.push(parseInt(ele.value));
        }
    })
    for (var i = 0; i < listAmount.length; i++) {
        sum += (listAmount[i] * listGia[i]);
    }
    $('#total').text(sum * night + ' VND    ');
}

function purchaseClicked() {
    var total = $('#total');
    var tt = total.text().trim();

    if (tt == '0 VND' || tt == '') {
        alert("Please choose your rooms");
    }
    else {
        var code = $('#code').text().trim();
        var ci = $('#ci').text().trim();
        var co = $('#co').text().trim();
        var infor = [];
        var khung = $('.khungchonphong');
        khung.each(function (index, ele) {
            if (index != 0) {
                var loai = ele.childNodes[1].childNodes[1].childNodes[3].value;
                var gia = parseInt(ele.childNodes[3].childNodes[1].childNodes[5].childNodes[3].textContent.slice(0, 7));
                var amount = ele.childNodes[3].childNodes[1].childNodes[5].childNodes[7].childNodes[1].value;
                infor.push({ gia: gia, loai: loai, amount: amount });
            }
        });

        var listRoom = JSON.stringify(infor);
        if (infor.length > 0) {
            redirectPost("/Book/Pay", { listRoom: listRoom, code: code, ci: ci, co: co });
        }
    }

}

function redirectPost(url, data) {
    var form = document.createElement('form');
    document.body.appendChild(form);
    form.method = 'post';
    form.action = url;
    for (var name in data) {
        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = name;
        input.value = data[name];
        form.appendChild(input);
    }
    form.submit();
}
function back() {
    window.history.back();
}
function next() {
    var code = $('#code').text().trim();
    var ci = $('#ci').text().trim();
    var co = $('#co').text().trim();
    var total = $('#total').text().trim();
    redirectPost("/Book/getCusInfo", { total: total, code: code, ci: ci, co: co });
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode != 46 && charCode > 31
        && (charCode < 48 || charCode > 57))
        return false;

    return true;
}

function formsubmit() {
    var first = $('#first').val();
    var last = $('#last').val();
    var sex = $('#sex').find(':selected').val();
    var mail = $('#mail').val();
    var phone = $('#phone').val();
    var country = $('#country').find(':selected').text();
    alert(country);

    $.ajax({
        url: "/Book/CreateCus",
        data: {
            first: first,
            last: last,
            sex: sex,
            mail: mail,
            phone: phone,
            country: country
        },
        dataType: "json",
        type: "POST",
        success: function (res) {

            alert(res.toString());
        }
    });
}