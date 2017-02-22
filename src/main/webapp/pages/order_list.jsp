<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2/17 0017
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String href_store_list = "/mobile/store_list?uid=" + request.getAttribute("uid") + "&time=" + System.currentTimeMillis() + "&token=" + request.getAttribute("token");
    String href_more_read = "/mobile/more_read?uid=" + request.getAttribute("uid") + "&time=" + System.currentTimeMillis() + "&token=" + request.getAttribute("token");
    String href_order_list = "/mobile/store_list?uid=" + request.getAttribute("uid") + "&time=" + System.currentTimeMillis() + "&token=" + request.getAttribute("token");
    String href_user = "/mobile/user?uid=" + request.getAttribute("uid") + "&time=" + System.currentTimeMillis() + "&token=" + request.getAttribute("token");
%>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>即客来 - 成为最好的你 - 全部订单</title>
    <script src="http://cdn.xingkeduo.com/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="http://cdn.xingkeduo.com/js/mobile3/common.js"></script>
    <script type="text/javascript" src="http://cdn.xingkeduo.com/js/mobile3/btn_active.js"></script>
    <script type="text/javascript" src="http://cdn.xingkeduo.com/js/fastclick.js"></script>
    <script type="text/javascript">
        //移动设备快速响应点击事件
        $(document).ready(function () {
            FastClick.attach(document.body);
        })
    </script>
    <link type="text/css" rel="stylesheet" href="http://cdn.xingkeduo.com/css/common.css">
    <link type="text/css" rel="stylesheet" href="http://cdn.xingkeduo.com/css/order_list.css">
    <script type="text/javascript" src="http://cdn.xingkeduo.com/js/zepto_min.js"></script>
    <script type="text/javascript" src="http://cdn.xingkeduo.com/js/touchslider.js"></script>
    <style type="text/css">
        .max_box {
            max-width: 640px;
            padding-top: 50%;
            font-family: "microsoft yahei", Arial, sans-serif
        }

        .info_box img {
            width: 30%;
            display: block;
            margin: 0 auto
        }

        .info_box {
            color: #999;
            font-size: 1rem;
            text-align: center;
        }

        .info_box p {
            line-height: 26px;
        }

        .store_text p {
            padding-right: 0.5rem;
        }

        p.product_name {
            color: #333;
            font-size: 1.1rem
        }

        p.product_name span {
            float: right;
        }
    </style>
</head>
<body>
<div class="container">
    <!--tab切换部分-->
    <div class="tab_switch">
        <ul id="pagenavi" class="page fixed_top">
            <li><a href="javascript:;" class="active">全部</a></li>
            <li><a href="javascript:;">等待中</a></li>
            <li><a href="javascript:;">待评价</a></li>
            <li><a href="javascript:;">已完成</a></li>
        </ul>


        <div id="slider" class="swipe mt37">
            <ul class="tab_switch_list">
                <!--  全部  -->
                <li class="li_list">
                    <c:choose>
                        <c:when test="${allOrder.size()>0}">
                            <c:forEach items="${allOrder}" var="item">
                                <div class="gap"></div>
                                <%--如果未评价--%>
                                <c:if test="${item.is_judge==0}">
                                    <div class="one_order">
                                        <p class="store_name_id">${item.store_info.title}
                                            <span class="state_label">
                                                  待评价
                                    </span></p>
                                        <div class="order_info">
                                            <div class="store_img">
                                                <img src="http://cdn.xingkeduo.com/image/mobile3/store/71/01.jpg">
                                            </div>
                                            <div class="store_text">
                                                <p>排队号：${item.queue_num}</p>
                                                <p>下单时间：${item.create_time}</p>
                                                <p>门店地址：${item.store_info.store_address}</p>
                                            </div>
                                        </div>
                                        <div class="total_main">
                                            <span class="total_price">合计</span>
                                            <span class="sum">${item.total_price}元</span>
                                        </div>
                                        <div class="btn_block">
                                            <a href="/mobile/judgement?jkl_order_id=${item.jkl_order_id}&store_id=${item.store_id}&uid=${uid}&time=<%=System.currentTimeMillis()%>&token=${token}">
                                                <div class="tips_btn" style="background: #1c436f;">立即评价</div>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                                <%--如果已经评价--%>
                                <c:if test="${item.is_judge==1}">
                                    <div class="gap"></div>
                                    <div class="one_order">
                                        <p class="store_name_id">${item.title}<span class="state_label">
                                已完成</span></p>
                                        <div class="order_info">
                                            <div class="store_img">
                                                <img src="http://cdn.xingkeduo.com/image/mobile3/store/44/01.jpg">
                                            </div>
                                            <div class="store_text">
                                                <p>排队号：${item.queue_num}</p>
                                                <p>下单时间 ${item.create_time}</p>
                                                <p>门店地址：${item.store_info.store_address}</p>
                                            </div>
                                        </div>
                                        <div class="total_main">
                                            <span class="total_price">合计</span>
                                            <span class="sum">${item.total_price}元</span>
                                        </div>
                                        <div class="btn_block">
                                            <a href="/mobile3/store_detail?f_store_id=44&f_user_id=175989&time=1487587675&token=e331fe83c7be7379a093d0d5e3c11521"><div class="tips_btn refund_btn" style="background: #1c436f;">再来一单</div></a>
                                            <a href="/act/user_coupon?f_order_no=2016120900000244&f_from_user_id=175989&f_user_id=175989&time=1487587675&token=e331fe83c7be7379a093d0d5e3c11521"><div class="tips_btn" style="background: #1c436f;">分享好友</div></a>

                                        </div>
                                    </div>

                                </c:if>
                            </c:forEach>
                        </c:when>
                        <c:when test="${allOrder.size()==0}">
                            <div class="one_order hide_order_li">
                                <div class="max_box">
                                    <div class="info_box">
                                        <img src="http://cdn.xingkeduo.com/image/mobile3/no_has_order.jpg">
                                        <p>天呐，你还没有下过单～</p>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            hahaha
                        </c:otherwise>
                    </c:choose>
                </li>

                <!--  等待中  -->
                <li class="li_list">
                    <c:choose>
                        <c:when test="${waitOrder.size()>0}">
                            <c:forEach items="${waitOrder}" var="item">
                                <div class="gap"></div>
                                <%--如果未评价--%>
                                <c:if test="${item.is_judge==0}">
                                    <div class="one_order">
                                        <p class="store_name_id">${item.store_info.title}
                                            <span class="state_label">
                                                  待评价
                                    </span></p>
                                        <div class="order_info">
                                            <div class="store_img">
                                                <img src="http://cdn.xingkeduo.com/image/mobile3/store/71/01.jpg">
                                            </div>
                                            <div class="store_text">
                                                <p>排队号：${item.queue_num}</p>
                                                <p>下单时间：${item.create_time}</p>
                                                <p>门店地址：${item.store_info.store_address}</p>
                                            </div>
                                        </div>
                                        <div class="total_main">
                                            <span class="total_price">合计</span>
                                            <span class="sum">${item.total_price}元</span>
                                        </div>
                                        <div class="btn_block">
                                            <a href="/mobile3/judgement?order_no=2017021800000619&store_id=71&f_user_id=308401&time=1486642618&token=91f0b30793ae7c55b0a49c1a0d717d37">
                                                <div class="tips_btn" style="background: #1c436f;">立即评价</div>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                                <%--如果已评价--%>
                                <c:if test="${item.is_judge==1}"></c:if>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="one_order hide_order_li">
                                <div class="max_box">
                                    <div class="info_box">
                                        <img src="http://cdn.xingkeduo.com/image/mobile3/no_has_order.jpg">
                                        <p>天呐，你还没有下过单～</p>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </li>

                <!--  待评价  -->
                <li class="li_list">
                    <c:choose>
                        <c:when test="${unjudgeOrder.size()>0}">
                            <c:forEach items="${unjudgeOrder}" var="item">
                                <div class="gap"></div>
                                <%--如果未评价--%>
                                    <div class="one_order">
                                        <p class="store_name_id">${item.store_info.title}
                                            <span class="state_label">
                                                  待评价
                                    </span></p>
                                        <div class="order_info">
                                            <div class="store_img">
                                                <img src="http://cdn.xingkeduo.com/image/mobile3/store/71/01.jpg">
                                            </div>
                                            <div class="store_text">
                                                <p>排队号：${item.queue_num}</p>
                                                <p>下单时间：${item.create_time}</p>
                                                <p>门店地址：${item.store_info.store_address}</p>
                                            </div>
                                        </div>
                                        <div class="total_main">
                                            <span class="total_price">合计</span>
                                            <span class="sum">${item.total_price}元</span>
                                        </div>
                                        <div class="btn_block">
                                            <a href="/mobile3/judgement?order_no=2017021800000619&store_id=71&f_user_id=308401&time=1486642618&token=91f0b30793ae7c55b0a49c1a0d717d37">
                                                <div class="tips_btn" style="background: #1c436f;">立即评价</div>
                                            </a>
                                        </div>
                                    </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="one_order hide_order_li">
                                <div class="max_box">
                                    <div class="info_box">
                                        <img src="http://cdn.xingkeduo.com/image/mobile3/no_has_order.jpg">
                                        <p>天呐，你还没有下过单～</p>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </li>

                <!--  已完成  -->
                <li class="li_list">
                    <c:choose>
                        <c:when test="${finishedOrder.size()>0}">
                            <c:forEach items="${finishedOrder}" var="item">
                                <div class="gap"></div>
                                <%--如果未评价--%>
                                <div class="one_order">
                                    <p class="store_name_id">${item.store_info.title}
                                        <span class="state_label">
                                                  待评价
                                    </span></p>
                                    <div class="order_info">
                                        <div class="store_img">
                                            <img src="http://cdn.xingkeduo.com/image/mobile3/store/71/01.jpg">
                                        </div>
                                        <div class="store_text">
                                            <p>排队号：${item.queue_num}</p>
                                            <p>下单时间：${item.create_time}</p>
                                            <p>门店地址：${item.store_info.store_address}</p>
                                        </div>
                                    </div>
                                    <div class="total_main">
                                        <span class="total_price">合计</span>
                                        <span class="sum">${item.total_price}元</span>
                                    </div>
                                    <div class="btn_block">
                                        <a href="/mobile/store_detail?store_id=${item.store_id}&uid=${item.uid}&time=<%=System.currentTimeMillis()%>&token=${item.token}"><div class="tips_btn refund_btn" style="background: #1c436f;">再来一单</div></a>
                                        <a href="/act/user_coupon?f_order_no=2016120900000244&f_from_user_id=175989&f_user_id=175989&time=1487587675&token=e331fe83c7be7379a093d0d5e3c11521"><div class="tips_btn" style="background: #1c436f;">分享好友</div></a>

                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="one_order hide_order_li">
                                <div class="max_box">
                                    <div class="info_box">
                                        <img src="http://cdn.xingkeduo.com/image/mobile3/no_has_order.jpg">
                                        <p>天呐，你还没有评论过订单哦～快去评价订单吧!</p>
                                        <p>小星星才能更快的进步呢～</p>
                                        <!--                                    <p>注：在微信公众帐号里评论，还有随机红包哦～</p>-->
                                    </div>
                                </div>]
                            </div>
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
        </div>
    </div>
    <div class="fix_height"></div>

    <!--  弹窗开始  -->
    <style>
        #all_opcation {
            width: 100%;
            overflow: hidden;
            height: 100%;
            background-color: #000;
            top: 0;
            opacity: 0.6;
            z-index: 2001;
            display: none;
            position: fixed !important; /*FF IE7*/
            position: absolute; /*IE6*/

        }

        .pop_alert {
            height: 164px;
            width: 272px;
            background-color: #FFFFFF;
            border-radius: 4px;
            z-index: 2002;
            position: absolute;
            margin-left: -136px;
            margin-top: -82px;
            top: 50%;
            left: 50%;
            display: none;
            position: fixed !important; /*FF IE7*/
            position: absolute; /*IE6*/
            _top: expression(eval(document.compatMode &&
            document.compatMode=='CSS1Compat') ?
            documentElement.scrollTop + (document.documentElement.clientHeight-this.offsetHeight)/2 :/*IE6*/
            document.body.scrollTop + (document.body.clientHeight - this.clientHeight)/2); /*IE5 IE5.5*/
        }

        .pop_rush_time {
            width: 278px;
            height: 376px;
            z-index: 2002;
            margin-left: -139px;
            margin-top: -232px;
            top: 50%;
            left: 50%;
            display: none;
            position: fixed !important; /*FF IE7*/
            position: absolute; /*IE6*/
            _top: expression(eval(document.compatMode &&
            document.compatMode=='CSS1Compat') ?
            documentElement.scrollTop + (document.documentElement.clientHeight-this.offsetHeight)/2 :/*IE6*/
            document.body.scrollTop + (document.body.clientHeight - this.clientHeight)/2); /*IE5 IE5.5*/
        }

        .rush_time_button {
            height: 44px;
            width: 23px;
            float: right;
            margin-right: 10px;
        }

        .rush_time_con {
            height: 332px;
            width: 278px;
            padding-top: 75px;
            background-color: #FFFFFF;
            border-radius: 4px;
        }

        /* 高峰时段样式 */
        .submit {
            display: inline-block;
            background-color: #ff5f07;
            height: 50px;
            line-height: 50px;
            text-align: center;
            color: #fff;
            font-size: 18px;
        }

        .rush_time_con .defalt {
            display: inline-block;
            color: #ff5f08;
            border: 1px solid #ff5f08;
            height: 42px;
            line-height: 42px;
            text-align: center;
            font-size: 18px;
            width: 252px;
            border-radius: 4px;
            margin-top: 10px
        }

    </style>

    <!--蒙板-->
    <div id="all_opcation"></div>

    <!--弹窗-->
    <div class="pop_alert">
        <div style="font-size: 18px;height: 60px;line-height: 60px;text-align: center"></div>
        <div style="font-size: 14px;width:94%;margin-left: 5%;color:#999999;height: 60px"></div>
        <div style="height: 44px;line-height: 44px;text-align: center;font-size: 16px;color:#ff5f08;border-top: 1px solid #dadada;"
             id="pop_alert_close">
            知道了
        </div>
    </div>

    <!--高峰时段弹窗-->
    <div class="pop_rush_time">
        <div id="close_rush_time_button" class="rush_time_button">
            <img src="http://cdn.xingkeduo.com/image/mobile/close_1.png"/>
        </div>
        <div style="clear: both"></div>
        <div id="opcation" class="rush_time_con" align="center">
            <div style="font-size: 18px;height: 26px;line-height: 26px;text-align: center;color:#000">高峰时段</div>
            <div style="font-size: 14px;width:78%;margin-left: 5%;color:#999999;margin-top: 10px;line-height: 23px"
                 align="left">现在正处于高峰时段，您可以选择特惠时段下单，享受优惠。
            </div>
            <a href="javascript:;" class="submit"
               style="width: 252px;border-radius:4px;margin-top: 70px;height: 42px;line-height: 42px">我要优惠</a>
            <a href="javascript:;" class="defalt" id="close_rush_time">不要优惠，高峰下单</a>
        </div>
    </div>    <!--  弹窗结束  -->

    <!--navbar start-->
    <!--底部导航栏-->
    <div class="fixed_menu" id="bottom_menu">
        <a href="<%=href_store_list%>"
           class="haircut">
            <!--menu_cut_on-->
            <span class="menu_bg menu_cut">剪发</span>
        </a>
        <a href="javascript:;"
           class="order">
            <span class="menu_bg menu_order">订单</span>
        </a>
        <a href="<%=href_user%>" class="personal_checked">
            <span class="menu_bg menu_user">个人</span>
        </a>
        <a href="<%=href_more_read%>"
           class="more">
            <span class="menu_bg menu_more">更多</span>
        </a>
    </div>

    <!--底部固定切换状态的js-->
    <script type="text/javascript">

        $(document).ready(function () {

            $("#bottom_menu a").click(function () {

                var _this = $(this);

                //寻找亮起节点,改为不亮的
                $('#bottom_menu a').each(function () {
                    if ($(this).hasClass("haircut_checked")) {
                        $(this).addClass("haircut").removeClass("haircut_checked");
                    }
                    else if ($(this).hasClass("order_checked")) {
                        $(this).addClass("order").removeClass("order_checked");
                    }
                    else if ($(this).hasClass("personal_checked")) {
                        $(this).addClass("personal").removeClass("personal_checked");
                    }
                    else if ($(this).hasClass("more_checked")) {
                        $(this).addClass("more").removeClass("more_checked");
                    }
                })

                //自己亮起
                if (_this.hasClass("haircut")) {
                    _this.addClass("haircut_checked").removeClass("haircut");
                }
                else if (_this.hasClass("order")) {
                    _this.addClass("order_checked").removeClass("order");
                }
                else if (_this.hasClass("personal")) {
                    _this.addClass("personal_checked").removeClass("personal");
                }
                else if (_this.hasClass("more")) {
                    _this.addClass("more_checked").removeClass("more");
                }
            })
        });
    </script>    <!--navbar end-->
</div>
<!--tab切换部分js-->

<!--[if !IE]> -->
<script
        type="text/javascript"> window.jQuery || document.write('<script src="http://cdn.xingkeduo.com/js/jquery-1.8.3.min.js">' + "<" + "/script>"); </script>
<!-- <![endif]-->
<!--[if lte IE 9]>
<script
        type="text/javascript"> window.jQuery || document.write('<script src="assets/javascripts/jquery-1.8.3.min.js">' + "<" + "/script>"); </script>
<![endif]-->

<!--  页面是否可以分享 f_can_share 0否1是  -->
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
    wx.config({
        debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        appId: 'wx8d0ca17fea670939', // 必填，公众号的唯一标识
        timestamp: 1487322886, // 必填，生成签名的时间戳
        nonceStr: 'wechat_code', // 必填，生成签名的随机串
        signature: 'f2e49f4ad4de5104bd599d3ebfe506fde93f4bac',// 必填，签名，见附录1
        jsApiList: ['checkJsApi', 'hideOptionMenu', 'showOptionMenu', 'onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
    });
</script>
<script>
    //通过ready接口处理成功验证
    wx.ready(function () {
        wx.checkJsApi({
            jsApiList: ['hideOptionMenu', 'onMenuShareTimeline', 'onMenuShareAppMessage'], // 需要检测的JS接口列表，所有JS接口列表见附录2,
            success: function (res) {
                // 以键值对的形式返回，可用的api值true，不可用为false
                // 如：{"checkResult":{"chooseImage":true},"errMsg":"checkJsApi:ok"}
            }
        });

        //0否（不可分享） 1是（可以分享）
        var f_can_share = 0;
        if (f_can_share == 1) {
            //显示右上角按钮
            wx.showOptionMenu({
                menuList: ['showOptionMenu', 'onMenuShareAppMessage']
            });
        }
        else {
            wx.hideOptionMenu();
        }
    });
</script><!--  页面是否可以分享  -->

<script type="text/javascript">
    var page = 'pagenavi';
    var mslide = 'slider';
    //    var mtitle='emtitle';
    arrdiv = 'arrdiv';

    var as = document.getElementById(page).getElementsByTagName('a');

    var tt = new TouchSlider({
        id: mslide,
        'auto': '-1',
        fx: 'ease-out',
        direction: 'left',
        speed: 300,
        timeout: 5000,
        'before': function (index) {
            var as = document.getElementById(this.page).getElementsByTagName('a');
            as[this.p].className = '';
            as[index].className = 'active';
            this.p = index;
            var txt = as[index].innerText;
//        $("javascript:;"+this.page).parent().find('.emtitle').text(txt);
            var txturl = as[index].getAttribute('href');
            var turl = txturl.split('#');
//        $("javascript:;"+this.page).parent().find('.go_btn').attr('href',turl[1]);
        }
    });

    tt.page = page;
    tt.p = 0;
    //console.dir(tt); console.dir(tt.__proto__);
    for (var i = 0; i < as.length; i++) {
        (function () {
            var j = i;
            as[j].tt = tt;
            as[j].onclick = function () {
                this.tt.slide(j);
                return false;
            }
        })();
    }
</script>

<script type="text/javascript">

    var screen_height = $(window).height() - 50 - $("#pagenavi li").height();
    $(".li_list").css({
        "min-height": screen_height + "px",
        "line-height": screen_height + "px",
        "text-algin": "center"
    });

    //调出知道了浮层
    function pop_alert(title, content) {
        $("#all_opcation,.pop_alert").show();

        $(".pop_alert").find("div:eq(0)").html(title);
        $(".pop_alert").find("div:eq(1)").html(content);
    }

    //关闭浮层
    function close_pop_alert() {
        $("#all_opcation,.pop_alert").hide();
    }

    //退款
    $(".refund_query").click(function () {
        var f_user_id = '${uid}';
        var time = <%=System.currentTimeMillis()%>;
        var token = '${token}';

        var _this = $(this);
        var f_order_no = _this.attr("order_no");
        var mobile_type = _this.attr("mobile_type");    //1微信 2支付宝

        var msg = confirm("您确定要立即退款吗？交易时间超过一年的订单无法提交退款。退款有一定延时，零钱支付退款20分钟内到账，银行卡支付退款3个工作日内到账。");
        if (msg == true) {
            //ajax请求
            $.ajax({
                //"async"     :   false,
                "url": "/mobi3/rleefund",
                "type": "post",
                "data": {f_user_id: f_user_id, time: time, token: token, f_order_no: f_order_no},
                "dataType": "json",//html json
                "beforeSend": function () {
                    pop_alert("星客多快剪退款", "系统正在退款中，请勿关闭页面。");
                    $("#pop_alert_close").css("border-top", "0px solid #dadada");
                    if (mobile_type == 2) {
                        $("#pop_alert_close").html("<iframe width='0' height='0' frameborder='0' id='mobile_refund_iframe' src=''></iframe>");
                    }
                    else {
                        $("#pop_alert_close").html('');
                    }
                },
                "success": function (res) {
                    //退款成功
                    if (res.error == 0) {
                        _this.remove();

                        if (res.html.mobile_type == 2)   //如果是支付宝退款
                        {
                            $("#mobile_refund_iframe").attr("src", "https://mapi.alipay.com/gateway.do?" + res.html.alipay_refund_url);

                            //关闭弹出层 todo 先注释掉，明天修改
                            setTimeout(function () {
                                close_pop_alert();
                                alert(res.msg);
                                location.reload();  //页面刷新
                            }, 3000);
                        }
                        else    //微信退款
                        {
                            close_pop_alert();
                            alert(res.msg);
                            location.reload();  //页面刷新
                        }
                    }
                    else {
                        close_pop_alert();
                        alert(res.msg);
                        setTimeout(function () {
                            _this.removeClass("click_btn_blue");
                        }, 500);
                    }
                }
            });
        }
        else {
            setTimeout(function () {
                _this.removeClass("click_btn_blue");
            }, 500);
        }
    });
</script>
</body>
</html>
