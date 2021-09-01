var Util = {}, timerShoppingcart;
/**
 * 初始化
 * @returns {undefined}
 */
Util.init = function () {
    //csrf token
    $.ajaxSetup({
        headers: {
            "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
        }
    });
    //...
    console.log(new Date());
    console.log(Date.parse(new Date()));
    $('#nav-product-categories').on('shown.bs.collapse', function () {
        if ($("#nav-user").hasClass('in')) {
            $("#nav-user").collapse('hide');
        }
    });
    $('#nav-user').on('shown.bs.collapse', function () {
        if ($("#nav-product-categories").hasClass('in')) {
            $("#nav-product-categories").collapse('hide');
        }
    });
};
/**
 * 导航菜单 多级分类动态显示
 * @returns {undefined}
 */
Util.allCategories = function () {
    var timerCat;
    $("#products .st-allcat-items > li").mouseenter(function (e) {
        e.preventDefault();
        clearTimeout(timerCat);
        $(this).addClass("active").siblings().removeClass('active');
        var ind = $(this).index();
        var h = $(this).parent().outerHeight() + 2;
        $(".st-allcat-content").show().children('div.st-allcat-content-item').hide().eq(ind).show().css({"min-height": h + 'px'});
    });
    $(".st-allcat-content").hover(function () {
        clearTimeout(timerCat);
    }, function () {
        var _this = this;
        timerCat = setTimeout(function () {
            $(_this).hide();
        }, 100);
    });
    $("#products").hover(function () {
        $('.st-allcat').show();
    }, function () {
        $(".st-allcat-content,.st-allcat").hide();
        $(this).find(".st-allcat-items > li").removeClass('active');
    });
};
/**
 * 产品详情放大镜
 * @returns {undefined}
 */
Util.zoomImage = function ()
{
    //放大镜宽高随着图片大小变动
//    var stImgObj = $(".st-detail-img-right");
//    var stImgW = stImgObj.width();
//    var stImgH = stImgObj.height();
//    $(".st-detail-img-right .pic .magnify").width(stImgW / 2).height(stImgH / 2);
//    $('.st-detail-img-right .bigpic').width(stImgW).height(stImgH).css("right", "-" + (stImgW + 2) + 'px');
//    $(".st-detail-img-right .bigpic > img").width(stImgW * 2).height(stImgH * 2);

    ///////////////////////////////////////////////
    var imgLeftObj = $(".st-detail-img-left ul");
    var picImg = $(".st-detail-img-right .pic img");
    var bigImg = $(".st-detail-img-right .bigpic img");
    imgLeftObj.on("mouseenter click", "li",
            function () {
                var imgsrc = $(this).children("img").attr("data-src");
                $(this).addClass("active").siblings().removeClass("active");
                picImg.attr("src", imgsrc);
                bigImg.attr("src", imgsrc);
            });
    var pic = $(".st-detail-img-right .pic");
    var magnify = $(".st-detail-img-right .pic .magnify");
    var bigpic = $(".st-detail-img-right .bigpic");
    var bigImg = $(".st-detail-img-right .bigpic img");
    pic.mousemove(function (e) {
        //放大镜宽高随着图片大小变动
        var stImgObj = $(".st-detail-img-right");
        var stImgW = stImgObj.width();
        var stImgH = stImgObj.height();
        $(".st-detail-img-right .pic .magnify").width(stImgW / 2).height(stImgH / 2);
        $('.st-detail-img-right .bigpic').width(stImgW).height(stImgH).css("right", "-" + (stImgW + 2) + 'px');
        $(".st-detail-img-right .bigpic > img").width(stImgW * 2).height(stImgH * 2);

        magnify.show();
        bigpic.show();
        var pagex = e.pageX;
        var pagey = e.pageY;
        var pictop = pic.offset().top;
        var picleft = pic.offset().left;
        var magnifyw = magnify.width();
        var magnifyh = magnify.height();
        var magnifytop = pagey - pictop - magnifyh / 2;
        var magnifyleft = pagex - picleft - magnifyw / 2;
        var picw = pic.width() - magnifyw;
        var pich = pic.height() - magnifyh;
        magnifytop = magnifytop < 0 ? 0 : magnifytop;
        magnifyleft = magnifyleft < 0 ? 0 : magnifyleft;
        magnifytop = magnifytop > pich ? pich : magnifytop;
        magnifyleft = magnifyleft > picw ? picw : magnifyleft;
        magnify.css({
            top: magnifytop,
            left: magnifyleft
        });
        var minl = bigpic.width() - bigImg.width();
        var mint = bigpic.height() - bigImg.height();
        var objimgl = -magnifyleft * 2;
        var objimgt = -magnifytop * 2;
        objimgl = objimgl < minl ? minl : objimgl;
        objimgt = objimgt < mint ? mint : objimgt;
        bigImg.css({
            top: objimgt,
            left: objimgl
        });
    });
    pic.mouseleave(function () {
        magnify.hide();
        bigpic.hide();
    });
};
/**
 * 顶部全局通知手动关闭后不再显示
 * @returns {undefined}
 */
Util.navNotice = function () {
    $('.st .alert').on('closed.bs.alert', function () {
        var cookieName = $(this).find('p').attr('data-cookie');
        //生成cookie
        $.cookie(cookieName, Date.parse(new Date()), {expires: 1});
    });
};
/**
 * 渲染错误信息
 * @param {string} message
 * @returns {Boolean}
 */
Util.showErrors = function (message) {
    $('body,html').animate({
        scrollTop: 0
    }, 50);
    var obj = $(".st-form-alert:first").clone(true).show();
    $(".st-form-alert:first").after(obj);
    $(".st-form-alert:eq(1) > .alert").addClass('alert-danger').children('p').html(message);
    setTimeout(function () {
        $(".st-form-alert:eq(1)").remove();
    }, 5000);
    return true;
};
/**
 * 渲染成功信息
 * @param {string} message
 * @param {Boolean} reload 重载页面
 * @returns {Boolean}
 */
Util.showSuccess = function (message, reload, timeout) {
    $('body,html').animate({
        scrollTop: 0
    }, 50);
    var obj = $(".st-form-alert:first").clone(true).show();
    $(".st-form-alert:first").after(obj);
    $(".st-form-alert:eq(1) > .alert").addClass('alert-success').children('p').html(message);
    if (timeout <= 0) {
        return;
    }
    if (!timeout) {
        var timeout = 1500;
    }
    setTimeout(function () {
        $(".st-form-alert:eq(1)").remove();
        if (reload) {
            window.location.reload();
        }
    }, timeout);
    return true;
};
/**
 * 添加 或者 修改 url中参数的值
 * @param {type} url
 * @param {type} name
 * @param {type} val
 * @returns {undefined}
 */
Util.setUrlParam = function (url, name, val) {
    var curUrl = url;
    var urlObj = new URL(curUrl);
    console.log(urlObj.href);
    urlObj.searchParams.set(name, val);
    console.log(urlObj.href);
    return urlObj.href;
};
/**
 * 立即购买
 * @param {type} productId
 * @param {type} qty
 * @returns {undefined}
 */
Util.buyNow = function (productId, qty) {
    if (qty < 1) {
        return;
    }
    $.post('/shoppingcart/create', {product_id: productId, qty: qty, buyNow: 1}, function (res) {
        if (res.code !== 200) {
            Util.showErrors(res.message);
            return;
        }
        window.location.href = '/shoppingcart/checkout?buyNow=1';
//        Util.showSuccess(res.message);
//        Util.fetchNavcartHtml();
    });
};
/**
 * 加入购物车
 * @param {type} productId
 * @param {type} qty
 * @returns {undefined}
 */
Util.addtocart = function (productId, qty) {
    if (qty < 1) {
        return;
    }
    $.post('/shoppingcart/create', {product_id: productId, qty: qty}, function (res) {
        if (res.code !== 200) {
            Util.showErrors(res.message);
            return;
        }
        Util.showSuccess(res.message);
        Util.fetchNavcartHtml();
    });
};
/**
 * 更新购物车
 * @returns {undefined}
 */
Util.updatecart = function (productId, qty) {
    if (qty < 1) {
        return;
    }
    clearTimeout(timerShoppingcart);
    timerShoppingcart = setTimeout(function () {
        $.post('/shoppingcart/update', {product_id: productId, qty: qty}, function (res) {
            if (res.code !== 200) {
                Util.fetchNavcartHtml();
                Util.showErrors(res.message);
                return;
            }
            Util.fetchNavcartHtml();
        });
    }, 500);
};
//Util.updatecart = function () {
//    $(document).on('change keyup', "#ST-NAVCART-PRODUCTS input[name=qty]", function () {
//        var qty = this.value;
//        var productId = $(this).attr('data-productId');
//        if (qty < 1) {
//            return;
//        }
//        clearTimeout(timerShoppingcart);
//        timerShoppingcart = setTimeout(function () {
//            $.post('/shoppingcart/update', {product_id: productId, qty: qty}, function (res) {
//                if (res.code !== 200) {
//                    Util.showErrors(res.message);
//                    return;
//                }
//                Util.fetchNavcartHtml();
//            });
//        }, 500);
//    });
//};
/**
 * 删除
 * @param {type} productId
 * @returns {undefined}
 */
Util.removecart = function (productId) {
    $.post('/shoppingcart/remove', {product_id: productId}, function (res) {
        if (res.code !== 200) {
            Util.showErrors(res.message);
            return;
        }
        //Util.showSuccess(res.message);
        Util.fetchNavcartHtml();
    });
};
/**
 * 收藏
 * @param {type} productId
 * @returns {undefined}
 */
Util.addToWishList = function (productId) {
    $.post('/product/collect', {product_id: productId}, function (res) {
        if (res.code !== 200) {
            Util.showErrors(res.message);
            return;
        }
        $(".addtowishlist").children('span').removeClass('glyphicon-heart-empty').addClass('glyphicon-heart');
        Util.showSuccess(res.message);
        var total = res.data.total;
        if (total === null) {
            return;
        }
        $("#ST-WISH-LIST-TOTAL").text(total);
    });
};
/**
 * 购物车[导航区域](显隐)
 * @returns {undefined}
 */
Util.navCart = function () {
    //鼠标hover事件控制显隐
    var timerCart;
    var node = '#ST-NAVCART-ICON,#ST-NAVCART-PRODUCTS';
    $(document).on('mouseenter', node, function (event) {
        clearTimeout(timerCart);
        $('#ST-NAVCART-PRODUCTS').show();
    });
    $(document).on('mouseleave', node, function (event) {
        //console.log(event);
        o = event.relatedTarget || event.toElement;
        if (!o) {
            return;
        }
        timerCart = setTimeout(function () {
            $("#ST-NAVCART-PRODUCTS").hide();
        }, 100);
    });
};
Util.fetchNavcartHtml = function () {
    this.fetchShoppingcartHtml();
};
Util.fetchShoppingcartHtml = function () {
    var country_code = $("select[name=_country_code]").val();
    var shipping_option_id = $("select[name=_shipping_option_id]").val();
    $.get('/shoppingcart/fetchShoppingcartHtml', {country_code: country_code, shipping_option_id: shipping_option_id}, function (res) {
        $('.st-cart-product-list').html(res.data.content);
        $('.st-cartnum').text(res.data.total.cart_qty_total);
        $(".ST-cart-shipping_total").text(res.data.total.shipping_total);
        $(".ST-cart-cart_total").text(res.data.total.cart_total);
    });
};
Util.isIE = function () {
    if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
        return true;
    } else {
        return false;
    }
};
/**
 * 获取订单统计
 * @returns {undefined}
 */
Util.getOrderTotal = function () {
    var country_code = $("select[name=country_code]").val();
    var shipping_option_id = $("input[name=shipping_option_id]:checked").val();
    var payment_option_id = $("input[name=payment_option_id]:checked").val();
    var use_credits = $("input[name=use_credits]").val();
    var data = {
        country_code: country_code,
        shipping_option_id: shipping_option_id,
        payment_option_id: payment_option_id,
        use_credits: use_credits,
        buyNow: $("input[name=buyNow]").val()
    };
    $.post('/shoppingcart/ordertotal', data, function (res) {
        console.log(res);
        $("#ST-shipping_fee").text(res.data.shipping_fee);
        $("#ST-handling_fee").text(res.data.handling_fee);
        $("#ST-tax_fee").text(res.data.tax_fee);
        $("#ST-used_credits_amount").text(res.data.used_credits_amount);
        $("#ST-ORDER-TOTAL").text(res.data.order_total);
        $("#ST-ORDER-TOTAL-defaultCurrencyPay").text(res.data.order_total_defaultCurrencyPay);
    });
};
/**
 * 取消订单
 * @param {type} OrderId
 * @returns {undefined}
 */
Util.cancelOrder = function (OrderId) {
    $.post('/user/order/cancel', {order_id: OrderId}, function (res) {
        if (res.code !== 200) {
            Util.showErrors(res.message);
            return;
        }
        Util.showSuccess(res.message, true);
    });
};
/**
 * 确认收货
 * @param {type} OrderId
 * @returns {undefined}
 */
Util.receiveOrder = function (OrderId) {
    $.post('/user/order/receive', {order_id: OrderId}, function (res) {
        if (res.code !== 200) {
            Util.showErrors(res.message);
            return;
        }
        Util.showSuccess(res.message, true);
    });
};
/**
 * 重新发送email验证
 * @param {type} OrderId
 * @returns {undefined}
 */
Util.resendEmailVerify = function () {
    $.post('/user/email/resendVerify', function (res) {
        if (res.code !== 200) {
            Util.showErrors(res.message);
            return;
        }
        Util.showSuccess(res.message, false, -1);
    });
};

/**
 * 检测是否可能是让人呕吐得360浏览器
 * @returns {undefined}
 */
Util.maybe360Browser = function () {
    return this.isChromeBrowser() && this.hasBrowserMime('type', 'application/aliedit') && this.hasBrowserMime('type', 'application/npalissologin');
};
Util.isChromeBrowser = function () {
    var ua = navigator.userAgent.toLowerCase();
    return ua.indexOf("chrome") > 1;
};
Util.hasBrowserMime = function (option, value) {
    var mimeTypes = navigator.mimeTypes;
    console.log(mimeTypes);
    for (var mt in mimeTypes) {
        if (mimeTypes[mt][option] == value) {
            return true;
        }
    }
    return false;
};
/**
 * 移除收藏
 * @param {type} collectId
 * @returns {undefined}
 */
Util.removeCollects = function (collectId) {
    $.post('/user/collects/remove', {product_id: collectId}, function (res) {
        if (res.code !== 200) {
            Util.showErrors(res.message);
            return;
        }
        Util.showSuccess(res.message, true);
    });
};