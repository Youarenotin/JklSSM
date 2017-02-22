<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2/20 0020
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <base href="/">
    <title>即客来 - 成为最好的你 - 用户评价</title>
    <!-- Pixel Admin's stylesheets -->
    <link href="http://cdn.xingkeduo.com/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet" href="http://cdn.xingkeduo.com/css/common.css">
    <link href="http://cdn.xingkeduo.com/css/judgement.css" rel="stylesheet" type="text/css">
    <script src="http://cdn.xingkeduo.com/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="http://cdn.xingkeduo.com/js/mobile3/btn_active.js"></script>
</head>
<body>
<div class="container" style="position:relative;">
    <div class="store_info">
        <img src="http://cdn.xingkeduo.com/image/mobile3/store/71/01.jpg"/>
        <span>${store_name}</span>
        <span class="word_text">据说长得好看的人，才会在意自己的发型</span>
    </div>
    <br>
    <h3 class="title"><span>匿名评价</span></h3>
    <div class="evaluate_box">
        <div class="star all_star">
            <div class="one_star unchecked" number="1">
                <div class="stars"></div>
            </div>
            <div class="one_star unchecked" number="2">
                <div class="stars"></div>
            </div>
            <div class="one_star unchecked" number="3">
                <div class="stars"></div>
            </div>
            <div class="one_star unchecked" number="4">
                <div class="stars"></div>
            </div>
            <div class="one_star unchecked" number="5">
                <div class="stars"></div>
            </div>
        </div>
        <p class="evaluate_title" id="evaluate_title1" style="display:none">非常不满意，各方面都很差</p>
        <div class="evaluate_label" id="evaluate_label1" style="display:none">
            <p>请选择标签：</p>
            <a href="javascript:;">
                <div class="one_label ">剪发技术差</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">服务态度差</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">店内卫生差</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">购票体验差</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">网络差</div>
            </a>
        </div>
        <div style="clear: both"></div>
        <p class="evaluate_title" id="evaluate_title2" style="display:none">不满意，比较差</p>
        <div class="evaluate_label" id="evaluate_label2" style="display:none">
            <p>请选择标签：</p>
            <a href="javascript:;">
                <div class="one_label ">剪发技术差</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">服务态度不好</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">店内卫生差</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">购票体验差</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">网络差</div>
            </a>
        </div>
        <div style="clear: both"></div>
        <p class="evaluate_title" id="evaluate_title3" style="display:none">一般，需要改善</p>
        <div class="evaluate_label" id="evaluate_label3" style="display:none">
            <p>请选择标签：</p>
            <a href="javascript:;">
                <div class="one_label ">剪发一般</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">服务态度一般</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">店内卫生一般</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">购票体验一般</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">网络一般</div>
            </a>
        </div>
        <div style="clear: both"></div>
        <p class="evaluate_title" id="evaluate_title4" style="display:none">较满意，但仍可改善</p>
        <div class="evaluate_label" id="evaluate_label4" style="display:none">
            <p>请选择标签：</p>
            <a href="javascript:;">
                <div class="one_label ">剪发技术较满意</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">服务不错喔</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">卫生需要打扫</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">购票赞</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">网络可以再快点</div>
            </a>
        </div>
        <div style="clear: both"></div>
        <p class="evaluate_title" id="evaluate_title5" style="display:none">非常满意，会推荐给朋友</p>
        <div class="evaluate_label" id="evaluate_label5" style="display:none">
            <p>请选择标签：</p>
            <a href="javascript:;">
                <div class="one_label ">剪发技术超赞</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">服务超棒</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">店内舒适干净</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">购票体验好</div>
            </a>
            <a href="javascript:;">
                <div class="one_label ">网络很快</div>
            </a>
        </div>
        <div style="clear: both"></div>
    </div>
    <textarea placeholder="其他意见和建议（内容匿名，可放心填写）" rows="3" class="form-control"></textarea>
    <div class="mobile" id="mobile">
        <input type="tel" id="f_mobile" class="mobile_text" placeholder="请留下您的电话号码，方便我们更好的为您服务"/>
    </div>
    <div class="fixed_bottom">
        <a href="javascript:;" class="pink_btn cancel_button" onclick="history.go(-1)">取消</a>
        <a href="javascript:;" class="blue_btn confirm_button" id="confirm_button">确定</a>
    </div>

</div>
<!-- Get jQuery from Google CDN -->
<!--[if !IE]> -->
<%--<script--%>
<!--type="text/javascript"> window.jQuery || document.write('<script src="http://cdn.xingkeduo.com/js/jquery-1.8.3.min.js">' + "<" + "/script>"); </script>-->
<!-- <![endif]-->
<!--[if lte IE 9]>
<!--<script-->
<!--type="text/javascript"> window.jQuery || document.write('<script src="assets/javascripts/jquery-1.8.3.min.js">' + "<" + "/script>"); </script>-->
<![endif]-->
<!-- Pixel Admin's javascripts -->
<script type="text/javascript" src="http://cdn.xingkeduo.com/js/mobile3/common.js"></script>
<script type="text/javascript" src="http://cdn.xingkeduo.com/js/fastclick.js"></script>
<script type="text/javascript">
    //移动设备快速响应点击事件
    $(document).ready(function () {
        FastClick.attach(document.body);
    })
</script>
<script src="http://cdn.xingkeduo.com/js/bootstrap.min.js"></script>
<script src="http://cdn.xingkeduo.com/js/pixel-admin.min.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
    wx.config({
        debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        appId: 'wx8d0ca17fea670939', // 必填，公众号的唯一标识
        timestamp: 1487580257, // 必填，生成签名的时间戳
        nonceStr: 'wechat_code', // 必填，生成签名的随机串
        signature: 'f20da57df17e9d39acc27615e70419dd1809cf07',// 必填，签名，见附录1
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
</script>
<script type="text/javascript">
    $(document).ready(function () {
        //评价标签选择
        $(".one_label").click(function () {
            if ($(this).hasClass("label_on")) {
                $(this).removeClass("label_on");
            }
            else {
                $(this).removeClass("label_on").addClass("label_on");
            }
        });

        //点击星星
        $(".star div").click(function () {
            var number = $(this).attr("number");
            if ($(this).parent().hasClass("star")) {
                $(".star .stars").each(function () {
                    if ($(this).parent().attr("number") <= number) {
                        $(this).css("background-position", "0 22px");
                        $(".evaluate_title").hide();
                        $("#evaluate_title" + number).show();
                        $(".evaluate_label").hide();
                        $("#evaluate_label" + number).show();
                        $(this).attr("select", "1");
                    }
                    else {
                        $(this).css("background-position", "0 0");
                        $(this).removeAttr("select");
                    }
                });
            }
        });

        //提交
        $("#confirm_button").click(function () {
            var uid = ${uid};
            var time = <%=System.currentTimeMillis()%>;
            var token = "${token}";
            var order_no = ${order_id};
            var f_store_id = "${store_id}";

            var labels_str = "";
            var f_mobile = $("#f_mobile").val();  //获取电话号码
            var stars = $(".star .stars[select]").length; //获取服务评价
            var f_comment = $("textarea").val();//获取评论
            //获取标签
            $("#evaluate_label" + stars + " .one_label").each(function () {
                if ($(this).hasClass("label_on")) {
                    labels_str += $(this).text() + ",";
                }
            });

            if (f_mobile != null && f_mobile != "") {
                if (!(/^[1][34578][0-9]{9}$/.test(f_mobile))) {
                    alert("请填写正确的手机号码！");
                    return false;
                }

            }
            if (labels_str == null || labels_str == "") {
                alert("您还没有选择标签！");
                return false;
            }

            if ((f_comment == null || f_comment == "") && stars <= 3) {
                alert("请留下您宝贵的建议，我们将继续改进");
                return false;
            }

            //开始提交评价
            $.ajax({
                url: "/mobile/ajax_judgement",
                type: "POST",
                dataType: "json",
                data: {
                    "uid": uid,
                    "time": time,
                    "token": token,
                    "order_id": order_no,
                    "store_id": f_store_id,
                    "comment": f_comment,
                    "mobile": f_mobile,
                    stars: stars,
                    labels_str: labels_str
                },
                beforeSend: function () {
                    pop_up_loading();
                },
                success: function (content) {
                    pop_close();

                    if (content.error == 0) {
                        alert(content.msg);

                        //评价成功后跳转到分享页面
//                        if(content.uid > 0)
//                        {
//                            location.href = "http://m.xingkeduo.com/act/user_coupon?f_order_no="+content.html.f_order_no+"&f_from_user_id="+content.html.f_from_user_id;
//                        }
//                        else
//                        {
                        location.href = "/mobile/order_list?&uid=" + uid + '&time=' + time + '&token=' + token;
//                        }
                    }
                    else {
                        alert(content.msg);
                    }
                },
                error: function () {
                    pop_close();
                    alert('出错了');
                }
            });
        });
    });
</script>
</body>
</html>
