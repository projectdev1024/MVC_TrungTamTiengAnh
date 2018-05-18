function checkBrowserEnableCookie() {
    var cookieEnabled = (navigator.cookieEnabled) ? true : false
    //if not IE4+ nor NS6+
    if (typeof navigator.cookieEnabled == "undefined" && !cookieEnabled) {
        document.cookie = "testcookie"
        cookieEnabled = (document.cookie.indexOf("testcookie") != -1) ? true : false
    }
    if (cookieEnabled) return true;
    else return false;
}
function createCookie(name, value, days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        var expires = "; expires=" + date.toGMTString();
    }
    else var expires = "";
    document.cookie = name + "=" + value + expires + "; path=/";
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

function eraseCookie(name) {
    createCookie(name, "", -1);
}

function countShoppingCart(name) {
    if (readCookie(name) == "") {
        //createCookie(name,'',1);
        //document.getElementById('count_shopping_cart').innerHTML = "0";
    }
    else {
        var current_cart = readCookie(name);
        var ca = current_cart.split('%2c');
        number_product = ca.length - 1;
       // document.getElementById('count_shopping_cart').innerHTML = "" + number_product + "";
    }
    //$("#shopping_cart_list").load("Cart/CartItemList.aspx");
}

function emptyShoppingCart(name) {
    createCookie(name, '-', 1);
}
function addToShoppingCart(productId, quantity) {
    var PricePro1 = $("#Price").val();
    get_cookie('lang');
    if (PricePro1 == null || PricePro1 == "") {
        PricePro = 0;
    }
    else {
        PricePro = PricePro1;
    }
    if (quantity == null || quantity == 0) {
        if (lang == 'vi') {
            Lobibox.alert("error", { title: "Không thành công", msg: "Bạn chưa chọn số lượng" });
        }
        else {
            Lobibox.alert("error", { title: "Failed", msg: "Please choose quatity" });
        }
        return false;
    }
    if (readCookie('shopping_cart') == null) {
        createCookie('shopping_cart', '', 1);
    }
    var current_cart = readCookie('shopping_cart');
    if (current_cart.search('%2c' + productId + '-') == -1 || current_cart.split('%2c' + productId + '-')==null) {
        var new_cart = current_cart + '%2c' + productId + '-' + quantity;
        createCookie('shopping_cart', new_cart, 1);
        countShoppingCart('shopping_cart');
        var url = "/Ajax/Cart/CartData";
        $.ajax({
            type: "Get",
            url: url,
            dataType: "text",
            success: function (data) {
                $("#cart-modal").html(data);
                var inst = $('[data-remodal-id=cart-modal]').remodal();
                inst.open();
            }
        })              
    }
    else {
        //Lobibox.notify('success', {
        //    title: "Thành công",
        //    msg: 'Thêm sản phẩm vào giỏ hàng thành công.'
        //});
        countShoppingCart('shopping_cart');        
        var current_cart = readCookie('shopping_cart');
        var i = current_cart.split('%2c' + productId + '-');
        var j = parseInt(i[1]);
        var k = parseInt(i[1]) + 1;
        updateQuality(productId, j, k);                                        
    }
}
function addListToShoppingCart(productId, quantity) {
    if (readCookie('shopping_cart') == null) {
        createCookie('shopping_cart', '', 1);
    }
    var current_cart = readCookie('shopping_cart');
    if (current_cart.search('%2c' + productId + '-') == -1 || current_cart.split('%2c' + productId + '-') == null) {
        var new_cart = current_cart + '%2c' + productId + '-' + quantity;
        createCookie('shopping_cart', new_cart, 1);
        countShoppingCart('shopping_cart');        
    }
    else {
        //Lobibox.notify('success', {
        //    title: "Thành công",
        //    msg: 'Thêm sản phẩm vào giỏ hàng thành công.'
        //});
        countShoppingCart('shopping_cart');
        var current_cart = readCookie('shopping_cart');
        var i = current_cart.split('%2c' + productId + '-');
        var j = parseInt(i[1]);
        var k = parseInt(i[1]) + 1;
        updatelistQuality(productId, j, k);
    }
}
function updatelistQuality(productId, quantity, newquantity) {
    var current_cart = readCookie('shopping_cart');
    new_cart = current_cart.replace("%2c" + productId + '-' + quantity, "%2c" + productId + '-' + newquantity);
    createCookie('shopping_cart', new_cart, 1);
    countShoppingCart('shopping_cart');    
}

function updateQuality(productId, quantity, newquantity) {
    var current_cart = readCookie('shopping_cart');
    new_cart = current_cart.replace("%2c" + productId + '-' + quantity, "%2c" + productId + '-' + newquantity);
    createCookie('shopping_cart', new_cart, 1);
    countShoppingCart('shopping_cart');
    var url = "/Ajax/Cart/CartData";
    $('#cart-modal').load(url)
    var inst = $('[data-remodal-id=cart-modal]').remodal();
    inst.open();    
}

function addToCartRedirect(productId, quantity) {
    var PricePro1 = $("#Price").val();
    if (PricePro1 == null || PricePro1 == "") {
        PricePro = 0;
    }
    else {
        PricePro = PricePro1;
    }

    if (quantity == null || quantity == 0) {
        Lobibox.alert("error", { title: "Không thành công", msg: "Bạn chưa chọn số lượng" });
        return false;
    }

    if (readCookie('shopping_cart') == null) {
        createCookie('shopping_cart', '', 1);
    }
    var current_cart = readCookie('shopping_cart');

    if (current_cart.search('%2c' + productId + '-') == -1) {
        var new_cart = current_cart + '%2c' + productId + '-' + quantity;
        createCookie('shopping_cart', new_cart, 1);
        countShoppingCart('shopping_cart');


    } else {
        Lobibox.alert("error", { title: "Không thành công", msg: "Sản phẩm này đã có trong giỏ hàng \nVui lòng xem chi tiết giỏ hàng để chỉnh sửa hoặc xóa bớt sản phẩm !" });
    }
    window.location = "/gio-hang";
}

function checkItemInCart(productId) {
    var current_cart = readCookie('shopping_cart');
    if (current_cart.search('%2c' + productId + '-') != -1) {
        document.write('Đang trong giỏ hàng');
    }
}

function deleteFromCart(productId, quantity) {
    var lang = get_cookie('lang');
    if (lang == 'vi') {
        if (confirm("Bạn có muốn xóa sản phẩm này khỏi giỏ hàng không?")) {
            var current_cart = readCookie('shopping_cart');
            new_cart = current_cart.replace("%2c" + productId + '-' + quantity, "");
            new_cart = new_cart.replace("%2c" + productId + '-', "0");
            createCookie('shopping_cart', new_cart, 1);
            countShoppingCart('shopping_cart');
            //var inst = $('[data-remodal-id=cart-modal]').remodal();
            //inst.open();
            var url = "/Ajax/Cart/CartData";
            $('#cart-modal').load(url)
        }
    }
    else {
        if (confirm("Do you want to delete this product from the cart?")) {
            var current_cart = readCookie('shopping_cart');
            new_cart = current_cart.replace("%2c" + productId + '-' + quantity, "");
            new_cart = new_cart.replace("%2c" + productId + '-', "0");
            createCookie('shopping_cart', new_cart, 1);
            countShoppingCart('shopping_cart');
            //var inst = $('[data-remodal-id=cart-modal]').remodal();
            //inst.open();
            var url = "/Ajax/Cart/CartData";
            $('#cart-modal').load(url)
        }
    }
    
}
function deleteFromCartPayment(productId, quantity) {
    var lang = get_cookie('lang');
    if (lang == 'vi') {
        if (confirm("Bạn có muốn xóa sản phẩm này khỏi giỏ hàng không?")) {
            var current_cart = readCookie('shopping_cart');
            new_cart = current_cart.replace("%2c" + productId + '-' + quantity, "");
            new_cart = new_cart.replace("%2c" + productId + '-', "0");
            createCookie('shopping_cart', new_cart, 1);
            countShoppingCart('shopping_cart');
            var url = "/Ajax/Cart/LoadCartData";
            $('#cartPayment').load(url);
            window.location.reload();
        }
    }
    else {
        if (confirm("Do you want to delete this product from the cart?")) {
            var current_cart = readCookie('shopping_cart');
            new_cart = current_cart.replace("%2c" + productId + '-' + quantity, "");
            new_cart = new_cart.replace("%2c" + productId + '-', "0");
            createCookie('shopping_cart', new_cart, 1);
            countShoppingCart('shopping_cart');
            var url = "/Ajax/Cart/LoadCartData";
            $('#cartPayment').load(url);
            window.location.reload();
        }
    }
}

function updateCart(productId, quantity) {
    var lang = get_cookie('lang');
    var newquantity = document.getElementById("item_" + productId).value;
    newquantity = parseFloat(newquantity);
    if (newquantity ==0) {
        deleteFromCart(productId, quantity);
        return false;
    }
    else if (newquantity > 99) {
        if (lang == 'vi') {
            Lobibox.alert("error", { title: "Không thành công", msg: " số lượng không được lớn hơn 99 !" });
        }
        else {
            Lobibox.alert("error", { title: "Failed", msg: " Quatity must smaller than 99 !" });
        }
        $("#item_" + productId).val(quantity);
        return false;
    }
    else {
        var current_cart = readCookie('shopping_cart');
        new_cart = current_cart.replace("%2c" + productId + '-' + quantity, "%2c" + productId + '-' + newquantity);
        createCookie('shopping_cart', new_cart, 1);
        countShoppingCart('shopping_cart');
        window.location.href = "/gio-hang";
    }


}

function addToViewHistory(productId) {
    if (readCookie('product_history') == null) {
        createCookie('product_history', ',', 1);
    }
    var current_list = readCookie('product_history');
    if (current_list.search(',' + productId + ',') == -1) {
        var new_list = "," + productId + current_list;
        createCookie('product_history', new_list, 1);
    }
}

function deleteAllCart() {
    $.removeCookie('shopping_cart');
    var url = "/Ajax/Cart/LoadCartData";
    $('#cartPayment').load(url);
}

function setCartUrlBack(url) {
    $.cookie('CartUrlBack', url, { expires: 1, path: '/' });
}

function countShoppingCartNumber() {
    if (readCookie('shopping_cart') == "") {
        return 0;
    } else {
        var current_cart = readCookie('shopping_cart');
        var ca = current_cart.split('%2c');
        number_product = ca.length - 1;
        return number_product;
    }
}
function openDialogCart() {
    $.post(UrlPathHome + "Cart_/CartPopup", {}, function (data) {
        /*
        $.modal(data, {
            closeHTML: "",
            containerCss: {
                backgroundColor: "#fff",
                borderColor: "#fff",
                height: 480,
                padding: 10,
                width: 420
            },
            overlayClose: true
        });
        */
        //$.nmData(data);
        $.fancybox(data);
        init_autoGendThumb();
    }, "html");
}
function closeDialogCart() {
    $.fancybox.close();
    //$.modal.close();
}
function deleteCartPopup(productId, quantity) {
    var current_cart = readCookie('shopping_cart');
    new_cart = current_cart.replace("%2c" + productId + '-' + quantity, "");
    new_cart = new_cart.replace("%2c" + productId + '-', "0");
    createCookie('shopping_cart', new_cart, 1);
    countShoppingCart('shopping_cart');
    //window.location.href = UrlPathHome + "CartHome/ListCart";
    //$("#cart_popup_row_" + productId).remove();
    $.post(UrlPathHome + "Cart_/CartPopup", {}, function (data) {
        //$(".simplemodal-data").html(data);
        $.fancybox(data);
        //$.nmData(data);
    }, "html");
    //}
}

$(document).ready(function () {
    countShoppingCart('shopping_cart');
});
$(function () {
    $(".thanhtoan").click(function (e) {
        var lang = get_cookie('lang');
        e.preventDefault();
        var paymentType = $('.payment-method-list > li label input[type=radio]:checked').attr("data-paytype");
        $("#paymentType").val(paymentType);
        if (paymentType == null) {
            if (lang == 'vi') {
                alert("Chưa chọn hình thức thanh toán!");
            }
            else {
                alert("Please choose payment type!");
            }
            return;
        }
        $(".thanhtoan").hide();
        $(".thanhtoan-loading").show();
        $.ajax({
            type: "POST",
            url: "/Ajax/Payment/PaymentAction",
            data: $("#frmCustomer").serialize(),
            success: function (response) {
                $(".thanhtoan").show();
                $(".thanhtoan-loading").hide();
                if (response.result == "1") {
                    deleteAllCart();
                    if (lang == 'vi') {
                        Lobibox.notify('success', {
                            title: "Thành công",
                            msg: 'Bạn đã đặt hàng thành công'
                        });
                    }
                    else {
                        Lobibox.notify('success', {
                            title: "Successfull",
                            msg: 'You ordered successfull!'
                        });
                    }
                    window.location.href = "/thanh-cong?ordercode=" + response.ordercodess;
                }
                if (response.result == "2") {
                    Lobibox.alert("error", { title: "Error", msg: response.message });
                }
            }
        });
    });
});



/*!
 * jQuery Cookie Plugin v1.4.1
 * https://github.com/carhartl/jquery-cookie
 *
 * Copyright 2013 Klaus Hartl
 * Released under the MIT license
 */
(function (factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD
        define(['jquery'], factory);
    } else if (typeof exports === 'object') {
        // CommonJS
        factory(require('jquery'));
    } else {
        // Browser globals
        factory(jQuery);
    }
}(function ($) {

    var pluses = /\+/g;

    function encode(s) {
        return config.raw ? s : encodeURIComponent(s);
    }

    function decode(s) {
        return config.raw ? s : decodeURIComponent(s);
    }

    function stringifyCookieValue(value) {
        return encode(config.json ? JSON.stringify(value) : String(value));
    }

    function parseCookieValue(s) {
        if (s.indexOf('"') === 0) {
            // This is a quoted cookie as according to RFC2068, unescape...
            s = s.slice(1, -1).replace(/\\"/g, '"').replace(/\\\\/g, '\\');
        }

        try {
            // Replace server-side written pluses with spaces.
            // If we can't decode the cookie, ignore it, it's unusable.
            // If we can't parse the cookie, ignore it, it's unusable.
            s = decodeURIComponent(s.replace(pluses, ' '));
            return config.json ? JSON.parse(s) : s;
        } catch (e) { }
    }

    function read(s, converter) {
        var value = config.raw ? s : parseCookieValue(s);
        return $.isFunction(converter) ? converter(value) : value;
    }

    var config = $.cookie = function (key, value, options) {

        // Write

        if (value !== undefined && !$.isFunction(value)) {
            options = $.extend({}, config.defaults, options);

            if (typeof options.expires === 'number') {
                var days = options.expires, t = options.expires = new Date();
                t.setTime(+t + days * 864e+5);
            }

            return (document.cookie = [
				encode(key), '=', stringifyCookieValue(value),
				options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
				options.path ? '; path=' + options.path : '',
				options.domain ? '; domain=' + options.domain : '',
				options.secure ? '; secure' : ''
            ].join(''));
        }

        // Read

        var result = key ? undefined : {};

        // To prevent the for loop in the first place assign an empty array
        // in case there are no cookies at all. Also prevents odd result when
        // calling $.cookie().
        var cookies = document.cookie ? document.cookie.split('; ') : [];

        for (var i = 0, l = cookies.length; i < l; i++) {
            var parts = cookies[i].split('=');
            var name = decode(parts.shift());
            var cookie = parts.join('=');

            if (key && key === name) {
                // If second argument (value) is a function it's a converter...
                result = read(cookie, value);
                break;
            }

            // Prevent storing a cookie that we couldn't decode.
            if (!key && (cookie = read(cookie)) !== undefined) {
                result[name] = cookie;
            }
        }

        return result;
    };

    config.defaults = {};

    $.removeCookie = function (key, options) {
        if ($.cookie(key) === undefined) {
            return false;
        }

        // Must not alter options, thus extending a fresh object...
        $.cookie(key, '', $.extend({}, options, { expires: -1 }));
        return !$.cookie(key);
    };

}));
