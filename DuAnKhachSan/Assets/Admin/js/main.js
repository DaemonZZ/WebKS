import { type } from "jquery";

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
/*
$('.btn-edit').on('shown.bs.modal', function () {
    $('#myInput').trigger('focus')
})*/

$('#editModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget)
    var id = button.data('id')
    var room = button.data('room')
    var type = button.data('type')
    var price = button.data('price')
    var modal = $(this)
    modal.find('.modal-title').text('Edit Room ' + room)
    modal.find('.modal-body .price input').val(price)
    modal.find('.modal-body .id input').val(id)
    modal.find('.modal-body select').val(type)
});
$('#delModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget)
    var id = button.data('id')
    var room = button.data('room')
    var modal = $(this)
    modal.find('.modal-title').text('Delete Room ' + room)
    modal.find('.modal-body .id input').val(id)
});

function validateFormEdit() {
    var x = document.forms["modalForm"]["price"].value;
    var location = $("#validateMessage")
    var reg = "^[0-9]+$"
    if (x == "") {
        location.append("Price must be filled out<br/>");
        return false;
    }
    if (!x.match(reg)) {
        location.append("Numbers only<br/>");
        return false;
    }
}


/*function checkname() {
    var y = document.forms["addmodalForm"]["roomname"].value;
    var x = document.forms["addmodalForm"]["price"].value;
    var z = document.forms["addmodalForm"]["roomtype"].value;
    if (validateFormAdd()) {
        $.ajax({
            type: 'POST',
            data: { roomname: y, roomtype: z, price: x },
            url: '/Admin/Room/Add',
            success: function (a) {
                $("#validateAdd").text(a)
            }
            
        })
    }
    
}
*/
function AddPromotionCode() {
    var pro = document.forms["addPromotion"]["proType"].value;
    var discost = document.forms["addPromotion"]["discost"].value;
    var exp = document.forms["addPromotion"]["exp"].value;
    var amount = document.forms["addPromotion"]["amount"].value;
    var reg1 = "^[0-9]+$"
    //Validate
    if (pro == "" || discost == "" || exp == "" || amount == "") {
        $("#validateAdd").html("Please fill all field")
        return
    }
    if (parseFloat(discost) > 100) {
        $("#validateAdd").html("Discost < 100% ")
        return
    }
    if (!amount.match(reg1)) {
        $("#validateAdd").html("'Amount' acceppt only number")
        return
    }
    
    var form = new FormData();
    form.append("pro", pro);
    form.append("discost", discost);
    form.append("exp", exp);
    form.append("amount", amount);

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/Admin/Promotion/Add", true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) { //ok
            var content = xhr.responseText;
            var json = JSON.parse(content);
            if (json.Data.status == "OK") {
                $('#addModal').modal('hide');
                window.location.reload();
            }
            else {
                $("#validateAdd").html(json.Data.message);
            }
        }
    }
    xhr.send(form);
   
}


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
        
    }).data('datepicker');
    checkin.hide();
});

$('#delCode').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget)
    var id = button.data('id')
    var code = button.data('code')
    var modal = $(this)
    modal.find('.modal-title').text('Delete Code: ' + code)
    modal.find('.modal-body .id input').val(id)
});

function validateFormAdd() {
    var x = document.forms["addmodalForm"]["price"].value;
    var y = document.forms["addmodalForm"]["roomname"].value;
    var z = document.forms["addmodalForm"]["roomtype"].value;
    var location = $("#validateAdd")
    var reg1 = "^[0-9]+$"
    var reg2 = "^P[0-9]+$"
    if (x == "") {
        location.append("Price must be filled out<br/>");
        return false;
    }
    if (!x.match(reg1)) {
        location.append("Numbers only<br/>");
        return false;
    }
    if (y == "") {
        location.append("Name must be filled out<br/>");
        return false;
    }
    if (!y.match(reg2)) {
        location.append("Name must start with 'P' and full of number digits after<br/>");
        return false;
    }
    return true;
}

