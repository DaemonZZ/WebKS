
var frame = $('.khungchonphong')
var index = 0;

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
                    $('.giaphong:last').text(res.price+' VND/night');
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
    $('.select').attr('display','none');
    $('#form_body').append($('#add_ele').html());
    // $('.khung:last').before($('#select').html());
    $('select:last').attr('name', (att).toString());
    $('.close_icon:last img').attr('data-id', att.toString());
    $('.amount:last img').attr('data-id', att.toString());
}


function remove(obj) {
    var id = $(obj).data('id');
    alert(id);
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