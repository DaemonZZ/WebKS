var count = 1;
var frame = $('.khungchonphong')
function selectType() {
    
    var id = $('.khungchonphong select').val();
    if (id != null) {
        $.ajax({
            url: "/Book/Select",
            data: { id: id },
            dataType: "json",
            type: "POST",
            success: function (res) {
                console.log(res);
                $('form').append(
                    "Room count: " + res.count + "</br>"+
                    "<a href='" + res.link + "'>" + res.link + "</a></br>"
                )
            }
        })
    }
}