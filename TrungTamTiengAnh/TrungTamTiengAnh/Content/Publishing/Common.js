function doAction(form, remodal) {
    var d = $(form).serialize();
    var url = $(form).attr("action");
    $.post(url, d, function (res) {
        if (!res.Erros) {
            if (remodal != null) {
                $(remodal).remodal().close();
            }
            Lobibox.alert("success", {
                msg: res.Message, callback: function ($this, type) {
                    if (type === 'ok') {
                        document.location.reload();
                    }
                }
            });
        } else {
            Lobibox.alert("error", {
                msg: res.Message, callback: function ($this, type) {
                    if (type === 'ok') {
                        return;
                    }
                }
            });
        }
    }, "json");
}



function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return "";
}


jQuery.validator.addMethod("beetwenPass", function (value, element, params) {
    return (value == $(params).val());
}, 'Nhập lại mật khẩu không đúng');


function RegDatePicker() {
    $('.calendar input[type="text"]').datepicker({
        "language": 'vi',
        "autoclose": true,
        todayHighlight: true,
        format: "dd/mm/yyyy",
        maxDate: 'now'
    });
}

function registerGridView(selector) {

    //checkall
    $(selector).on('click', '.checkAll', function () {
        $(selector + " input.check[type='checkbox']").not(".checkAll").not("#checkAll").prop("checked", $(this).is(":checked"));
    });

    //Đăng ký xóa nhiều
    $(selector)
        .on("click",
            "a.deleteAll",
            function (e) {
                e.preventDefault();
                var arrRowId = '';
                var rowTitle = '';

                $(selector + " input.check[type='checkbox']:checked")
                    .not("#checkAll")
                    .not(".checkAll")
                    .each(function () {
                        arrRowId += $(this).val() + ",";
                        rowTitle += "<li>" + $(this).parent().parent().parent().attr("title") + "</li>";
                    });
                rowTitle = "<ul>" + rowTitle + "</ul>";
                arrRowId = (arrRowId.length > 0) ? arrRowId.substring(0, arrRowId.length - 1) : arrRowId;
                confirmAlert("xóa", "Delete", urlPostAction, arrRowId, rowTitle);
                $(this).parents('.btn-group').removeClass('open');
                return false;
            });
}


