var config_description = {
    height: 200

};
var config_content = {
    toolbar: 'Full',
    height: 250
};
function LoadCKEDITOR(instanceName, fullEditor) {
    if (fullEditor)
        CKEDITOR.replace(instanceName, config_content);
    else
        CKEDITOR.replace(instanceName, config_description);

}



function LoadCKEDITORStand(instanceName) {
    CKEDITOR.replace(instanceName, config_stand);

}
function updateEditor() {
    for (var name in CKEDITOR.instances)
        CKEDITOR.instances[name].updateElement();
}

function createCKFider(instance, imageWidth) {
    $("#" + instance + "Button").click(function () {
        var finder = new CKFinder();
        finder.selectActionFunction = function (fileUrl) {
            var htmlRespoint = "<input type=\"hidden\" name=\"" + instance + "\" value=\"" + fileUrl + "\" />";
            htmlRespoint += "<img src=\"" + fileUrl + "\" style=\"border:1px solid #ccc; width:" + imageWidth + "px; margin-top:2px;\" />";
            $("#" + instance + "Values").html(htmlRespoint);
        };
        finder.popup();
    });
}

$(function () {
    Example.init({
        "selector": ".bb-alert"
    });
});

function confirmAlert(actionString, action, urlPost, arrRowId, rowTitle) {
    if (!arrRowId) {
        Lobibox.alert("error", {
            msg: "Bạn chưa chọn bản ghi nào", callback: function ($this, type) {
                if (type === 'ok') {
                    return;
                }
            }
        });
        return;
    }
    var confirmModal =
        $('<div class="modal fade in" style="display:none">' +
            '<div class="modal-dialog modal-lg">' +
                '<div class="modal-content">' +
                    '<div class="modal-body">' +
                        '<p>Bạn có chắc chắn muốn ' + actionString + ':<br/></p>' +
                        '<p>' + rowTitle + '</p>' +
                    '</div>' +
                    '<div class="modal-footer">' +
                        '<a href="#" id="okButton" class="btn btn-primary" data-dismiss="modal">Tiếp tục</a>' +
                        '<a href="#" id="cancelButton" class="btn btn-danger">Hủy</a>' +
                    '</div>' +
                '</div>' +
            '</div>' +
        '</div>');
    confirmModal.find('#okButton').click(function (e) {
        e.preventDefault();
        $.post(encodeURI(urlPost), { "ActionView": action, "itemId": "" + arrRowId + "" }, function (data) {
            if (data.Erros) {
                Lobibox.alert("error", {
                    msg: data.Message, callback: function ($this, type) {
                        if (type === 'ok') {
                            return;
                        }
                    }
                });
            }
            else {
                Lobibox.alert("success", {
                    msg: data.Message, callback: function ($this, type) {
                        if (type === 'ok') {
                            window.location.reload();
                        }
                    }
                });
            }
        });
        setTimeout(function () {
            confirmModal.remove();
        }, 500);
        confirmModal.modal('hide');
    });
    confirmModal.find('#cancelButton').click(function (e) {
        e.preventDefault();
        setTimeout(function () {
            confirmModal.remove();
        }, 500);
        confirmModal.modal('hide');
    });
    confirmModal.modal('show');
};
function doActionForm(formId, modal) {
    var form = formId.serialize();
    var url = formId.attr("action");
    $.post(url, form, function (res) {
        if (!res.Erros) {
            if (modal != '') {
                $(modal).remodal().close();
            }
            Lobibox.alert("success", {
                msg: res.Message, callback: function ($this, type) {
                    if (type === 'ok') {
                        window.location.reload();
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

function previewFiles() {

    var preview = document.querySelector('#preview');
    var files = document.querySelector('input[type=file]').files;

    function readAndPreview(file) {
        // Make sure `file.name` matches our extensions criteria
        if (/\.(jpe?g|png|gif)$/i.test(file.name)) {
            var reader = new FileReader();

            reader.addEventListener("load", function () {
                $("#preview").empty();
                var image = new Image();
                image.height = 100;
                image.title = file.name;
                image.src = this.result;
                preview.appendChild(image);
            }, false);

            reader.readAsDataURL(file);
        }

    }

    if (files) {
        [].forEach.call(files, readAndPreview);
    }
}

$(function () {
    $("body").on("click",".hiddenView",function (e) {
        e.preventDefault();
        var arrRowId = $(this).attr("ref");
        var actionTitle = $(this).attr("actionTitle");
        var rowTitle = $(this).attr("title");
        if (actionTitle == '') {
            actionTitle = 'Ẩn';
        }
        confirmAlert(actionTitle, "Hide", urlAlertAction, arrRowId, rowTitle);
    });

    $("body").on("click", ".showView",function (e) {
        e.preventDefault();
        var arrRowId = $(this).attr("ref");
        var actionTitle = $(this).attr("actionTitle");
        var rowTitle = $(this).attr("title");
        if (actionTitle == '') {
            actionTitle = 'Hiển thị';
        }
        confirmAlert(actionTitle, "Show", urlAlertAction, arrRowId, rowTitle);
    });
    
    $("body").on("click",".deleteView",function (e) {
        e.preventDefault();
        var arrRowId = $(this).attr("ref");
        var actionTitle = $(this).attr("actionTitle");
        var rowTitle = $(this).attr("title");
        if (actionTitle == '') {
            actionTitle = 'Xóa';
        }
        confirmAlert(actionTitle, "Delete", urlAlertAction, arrRowId, rowTitle);
    });
});
function managerPostForm() {
    LoadCKEDITOR('Content', true);
    createCKFider('ImagesUrl', 162);
    $("#ManagerPostForm").validate({
        rules: {
            ClassId:
            {
                required: true,
            },
            Title:
            {
                required: true,
            },
            ShortDescription:
            {
                required: true,
            },
            ModuleId:
            {
                required: true,
            },
        },
        messages: {
            ClassId: "Lớp bắt buộc nhập!",
            Title: "Tiêu đề bắt buộc nhập!",
            ShortDescription: "Mô tả ngắn bắt buộc nhập!",
            ModuleId: "Chuyên mục bắt buộc nhập!",
        },
        submitHandler: function () { //onSubmit
            updateEditor();
            doActionForm($("#ManagerPostForm"), '#add-news-modal');
            return false;
        }
    });
}
function sendNotification() {
    LoadCKEDITOR('Content', true);
    $("#SendNotiForm").validate({
        rules: {
            Title:
            {
                required: true,
            },
            Content: {
                required: true,
            },
        },
        messages: {
            Title: "Tiêu đề bắt buộc nhập!",
            Content: "Nội dung bắt buộc nhập!",
        },
        submitHandler: function () { //onSubmit
            updateEditor();
            var form = $("#SendNotiForm").serialize();
            var url = $("#SendNotiForm").attr("action");
            $.post(url, form, function (res) {
                if (!res.Erros) {
                    $('#send-noti-modal').remodal().close();
                    Lobibox.alert("success", {
                        msg: res.Message, callback: function ($this, type) {
                            if (type === 'ok') {
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
            return false;
        }
    });
}
function AgencytPostForm() {
    LoadCKEDITOR('Content', true);
    createCKFider('ImagesUrl', 162);
    $("#ManagerPostForm").validate({
        rules: {
            Title:
            {
                required: true,
            },
            ShortDescription:
            {
                required: true,
            },            
        },
        messages: {
            Title: "Tiêu đề bắt buộc nhập!",
            ShortDescription: "Mô tả ngắn bắt buộc nhập!",
        },
        submitHandler: function () { //onSubmit
            updateEditor();
            doActionForm($("#ManagerPostForm"), '#add-news-modal');
            return false;
        }
    });
}

function profile() {
    $("#profileFrm").validate({
        rules: {
            FullNameParent:
            {
                required: true,
            },
            Mobile:
            {
                required: true,
                number: true,
                minlength: 10,
            },
            Address:
            {
                required: true,
            },
            NameBaby:
           {
               required: true,
           },
            Captchar:
          {
              required: true,
          },
            Email:
         {
             required: true,
             email: true,
         },
        },
        messages: {
            FullNameParent:
             {
                 required: "Bạn chưa nhập tên phụ huynh!",
             },
            Mobile:
            {
                required: "Bạn chưa nhập số điện thoại!",
                number: "Chỉ được nhập số!",
                minlength: "Số điện thoại ít nhất 10 ký tự số!",
            },
            Address:
            {
                required: "Bạn chưa nhập địa chỉ!",
            },
            NameBaby:
           {
               required: "Bạn chưa nhập tên của bé!",
           },
            Captchar:
          {
              required: "Bạn chưa nhập mã xác nhận!",
          },
            Email:
            {
                required: "Bạn chưa nhập Email!",
                email: "Email chưa đúng định dạng!",
            },
        },
        submitHandler: function () { //onSubmit
            doActionForm($("#profileFrm"), '');
            return false;
        }
    });
}
function ChangeRandom() {
    $("#imageRandom").attr("src", "/showCaptchaImage?width=90&height=26&t=" + new Date().getMilliseconds());
}