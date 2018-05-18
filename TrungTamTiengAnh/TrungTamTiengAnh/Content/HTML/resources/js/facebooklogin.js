window.fbAsyncInit = function () {
    FB.init({
        appId: '1593780443982097',
        xfbml: true,
        version: 'v2.8'
    });
};
function sendLoginFacebook(response) {
    $.post("/ajax/MemberClient/LoginFacebook", { response: response, accessToken: response.authResponse.accessToken, returnUrl: $("#returnUrl").val() }, function (data) {
        if (data.errorcode > 0) {
            window.location.href = data.Url;
        } else {
            swal({
                title: 'Không thành công',
                text: data.errormessage,
                timer: 2000
            });
        }
    }, "json");
}

function loginFacebook() {
    FB.login(function (response) {
        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            sendLoginFacebook(response);
        } else if (response.status === 'not_authorized') {
            // The person is logged into Facebook, but not your app.
        } else {
            // The person is not logged into Facebook, so we're not sure if
            // they are logged into this app or not.
        }
    });
}
