
var frame = $('.khungchonphong')
var index = 0;
function selectType(obj) {
    
    var id = $(obj).val();
    var info = $('#info');
    var khung = $('.khung:last');
    
    if (id != null) {
        $.ajax({
            url: "/Book/Select",
            data: { id: id },
            dataType: "json",
            type: "POST",
            success: function (res) {
                $('.anhphong:last img').attr('src', res.imglink);
                $('.anhphong:last a').attr('href', res.link);
                $('.motaphong').empty();
                $('.motaphong').append(res.summ);
                khung.empty();
                khung.append(info.html());
                
            }
        })
    }
}

function Add() {
    var removingItem = $("[name='typeId']:last").val();
    
    $('#select').remove();
    console.log("%c"+removingItem,"color:orange;font-size:200%");
}
$(document).ready(function () {
    $('#form').append($('#add_ele').html());
    console.log($('#add_ele').html())
})