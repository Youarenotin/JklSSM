<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2/22 0022
  Time: 13:01
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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <base href="/">
    <title>星客多 - 成为最好的你 - 全部评价</title>
    <!-- Pixel Admin's stylesheets -->
    <link href="http://cdn.xingkeduo.com/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet" href="http://cdn.xingkeduo.com/css/common.css" />
    <link href="http://cdn.xingkeduo.com/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.xingkeduo.com/css/judgement_list.css" rel="stylesheet" type="text/css">
    <script src="http://cdn.xingkeduo.com/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="http://cdn.xingkeduo.com/js/mobile3/common.js"></script>
    <script type="text/javascript" src="http://cdn.xingkeduo.com/js/fastclick.js"></script>
    <script type="text/javascript">
        //移动设备快速响应点击事件
        $(document).ready(function(){
            FastClick.attach(document.body);
        })
    </script>
    <style type="text/css">
        .max_box{max-width: 640px;padding-top: 50%;font-family: "microsoft yahei", Arial, sans-serif}
        .info_box img{width: 30%;display: block;margin: 0 auto}
        .info_box{color: #999;font-size: 1rem;text-align: center;}
        .evaluate_label{margin-left: 4.5rem; margin-top: 10px;margin-right: 3%;font-size: 1rem;color: #333333; display: inline-block;}
        .evaluate_label span{float: left;margin-right: 8px;border: 1px solid #dadada;border-radius:10px;color: #999;padding: 0 6px;margin-bottom:8px;}
        span.label_on{border: 1px solid #f8c4b2;color: #f8c4b2}
        span.label_title{border: none;padding: 0;}
        .evaluate_time{margin-bottom: 1rem;}
    </style>
</head>
<body>
<div class="container">
    <c:choose>
        <c:when test="${commentHistoryList.size()>0}">
            <c:forEach items="${commentHistoryList}" var="item">
                <div class="one_evaluate">
                    <div class="store_img"><img src="${item.store_img}"></div>
                    <div class="store_info">
                        <span class="store_name">${item.store_name}</span>
                        <span class="evaluate_star">星级&nbsp;
                                            <i class="fa fa-star star_on"></i>
                                            <i class="fa fa-star star_on"></i>
                                            <i class="fa fa-star star_on"></i>
                                            <i class="fa fa-star star_on"></i>
                                            <i class="fa fa-star star_on"></i>
                                    </span>
                    </div>
                    <!-- 评价增加了标签 -->
                    <div class="evaluate_label">
                        <span class="label_title">标签</span>
                        <c:forEach items="${item.labels}" var="label">
                            <span class="one_label ">${label}</span>
                        </c:forEach>
                        <%--<span class="one_label label_on">剪发技术超赞</span>--%>
                        <%--<span class="one_label label_on">服务超棒</span>--%>
                        <%--<span class="one_label ">店内舒适干净</span>--%>
                        <%--<span class="one_label ">购票体验好</span>--%>
                        <%--<span class="one_label ">网络很快</span>--%>
                    </div>
                    <!-- 评价增加了标签 end-->
                    <div class="evaluate_text">
                        <%--默认好评                <!--如果没有评价内容显示  默认好评-->--%>
                        <c:when test="${item.defaultComment}">
                            默认好评
                        </c:when>
                        <c:when test="${item.defaultComment}">
                            ${item.comment}
                        </c:when>
                    </div>
                    <div class="evaluate_time">
                        ${item.create_time}           </div>
                    <!--客服回复部分-->
                    <!--客服回复部分-->
                    <hr style="width: 94%;height: 1px;background: #dadada;margin-bottom: 0;border: none;">
                </div>
            </c:forEach>
        </c:when>
    </c:choose>

    <%--<div class="one_evaluate">--%>
        <%--<div class="store_img"><img src="http://cdn.xingkeduo.com/image/mobile3/store/44/01.jpg"></div>--%>
        <%--<div class="store_info">--%>
            <%--<span class="store_name">知春路店</span>--%>
            <%--<span class="evaluate_star">星级&nbsp;--%>
                                            <%--<i class="fa fa-star star_on"></i>--%>
                                            <%--<i class="fa fa-star star_on"></i>--%>
                                            <%--<i class="fa fa-star star_on"></i>--%>
                                            <%--<i class="fa fa-star star_on"></i>--%>
                                            <%--<i class="fa fa-star star_on"></i>--%>
                                    <%--</span>--%>
        <%--</div>--%>
        <%--<!-- 评价增加了标签 -->--%>
        <%--<div class="evaluate_label">--%>
            <%--<span class="label_title">标签</span>--%>
            <%--<span class="one_label ">剪发技术超赞</span>--%>
            <%--<span class="one_label ">服务超棒</span>--%>
            <%--<span class="one_label ">店内舒适干净</span>--%>
            <%--<span class="one_label ">购票体验好</span>--%>
            <%--<span class="one_label ">网络很快</span>--%>
        <%--</div>--%>
        <%--<!-- 评价增加了标签 end-->--%>
        <%--<div class="evaluate_text">--%>
            <%--默认好评                <!--如果没有评价内容显示  默认好评-->--%>
        <%--</div>--%>
        <%--<div class="evaluate_time">--%>
            <%--2016-07-26 14:03:28            </div>--%>
        <%--<!--客服回复部分-->--%>
        <%--<!--客服回复部分-->--%>
        <%--<hr style="width: 94%;height: 1px;background: #dadada;margin-bottom: 0;border: none;">--%>
    <%--</div>--%>
    <%--<div class="one_evaluate">--%>
        <%--<div class="store_img"><img src="http://cdn.xingkeduo.com/image/mobile3/store/53/01.jpg"></div>--%>
        <%--<div class="store_info">--%>
            <%--<span class="store_name">上地百度店</span>--%>
            <%--<span class="evaluate_star">星级&nbsp;--%>
                                            <%--<i class="fa fa-star star_on"></i>--%>
                                            <%--<i class="fa fa-star star_on"></i>--%>
                                            <%--<i class="fa fa-star star_on"></i>--%>
                                            <%--<i class="fa fa-star star_on"></i>--%>
                                            <%--<i class="fa fa-star star_on"></i>--%>
                                    <%--</span>--%>
        <%--</div>--%>
        <%--<!-- 评价增加了标签 -->--%>
        <%--<div class="evaluate_label">--%>
            <%--<span class="label_title">标签</span>--%>
            <%--<span class="one_label ">剪发技术超赞</span>--%>
            <%--<span class="one_label ">服务超棒</span>--%>
            <%--<span class="one_label ">店内舒适干净</span>--%>
            <%--<span class="one_label ">购票体验好</span>--%>
            <%--<span class="one_label ">网络很快</span>--%>
        <%--</div>--%>
        <%--<!-- 评价增加了标签 end-->--%>
        <%--<div class="evaluate_text">--%>
            <%--小哥剪的非常棒，很用心！                <!--如果没有评价内容显示  默认好评-->--%>
        <%--</div>--%>
        <%--<div class="evaluate_time">--%>
            <%--2016-07-02 17:47:19            </div>--%>
        <%--<!--客服回复部分-->--%>
        <%--<!--客服回复部分-->--%>
        <%--<hr style="width: 94%;height: 1px;background: #dadada;margin-bottom: 0;border: none;">--%>
    <%--</div>--%>
    <!--        <div class="one_evaluate">-->
    <!--            <div class="store_img"><img src="http://cdn.xingkeduo.com/demo/m/store_demo_pic.jpg"></div>-->
    <!--            <div class="store_info">-->
    <!--                <span class="store_name">南三环凯德</span>-->
    <!--                <span class="evaluate_star">星级&nbsp;-->
    <!--                        <i class="fa fa-star star_on"></i>-->
    <!--                        <i class="fa fa-star star_on"></i>-->
    <!--                        <i class="fa fa-star star_on"></i>-->
    <!--                        <i class="fa fa-star star_on"></i>-->
    <!--                        <i class="fa fa-star star_on"></i>-->
    <!--                </span>-->
    <!--            </div>-->
    <!--            <div class="evaluate_text">-->
    <!--                在南三环凯德上班，中午有时间去剪了个帅帅的发型，觉得自己瞬间帅啦一个高度。-->
    <!--            </div>-->
    <!--            <div class="evaluate_time">-->
    <!--                2016-03-12 09:12:22-->
    <!--            </div>-->
    <!--            <hr style="width: 94%;height: 1px;background: #dadada;margin-bottom: 0;border: none">-->
    <!--        </div>-->
    <!--    <div class="one_evaluate">-->
    <!--        <div class="store_img"><img src="http://cdn.xingkeduo.com/demo/m/store_demo_pic.jpg"></div>-->
    <!--        <div class="store_info">-->
    <!--            <span class="store_name">南三环凯德</span>-->
    <!--            <span class="evaluate_star">星级&nbsp;-->
    <!--                    <i class="fa fa-star star_on"></i>-->
    <!--                    <i class="fa fa-star star_on"></i>-->
    <!--                    <i class="fa fa-star star_on"></i>-->
    <!--                    <i class="fa fa-star star_on"></i>-->
    <!--                    <i class="fa fa-star"></i>-->
    <!--            </span>-->
    <!--        </div>-->
    <!--        <div class="evaluate_text">-->
    <!--            发型师娴熟的剪发技术，店内干净舒适的现代简约风格，让人很舒服！-->
    <!--        </div>-->
    <!--        <div class="evaluate_time">-->
    <!--            2016-03-12 09:12:22-->
    <!--        </div>-->
    <!--        <hr style="width: 94%;height: 1px;background: #dadada;margin-bottom: 0;border: none">-->
    <!--    </div>-->
</div>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
    wx.config({
        debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        appId: 'wx8d0ca17fea670939', // 必填，公众号的唯一标识
        timestamp: 1487734146, // 必填，生成签名的时间戳
        nonceStr: 'wechat_code', // 必填，生成签名的随机串
        signature: '1d1e22d77e5a0f16df19157c655799fee0ae5008',// 必填，签名，见附录1
        jsApiList: ['checkJsApi','hideOptionMenu','showOptionMenu','onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
    });
</script>
<script>
    //通过ready接口处理成功验证
    wx.ready(function(){
        wx.checkJsApi({
            jsApiList: ['hideOptionMenu','onMenuShareTimeline','onMenuShareAppMessage'], // 需要检测的JS接口列表，所有JS接口列表见附录2,
            success: function(res) {
                // 以键值对的形式返回，可用的api值true，不可用为false
                // 如：{"checkResult":{"chooseImage":true},"errMsg":"checkJsApi:ok"}
            }
        });

        //0否（不可分享） 1是（可以分享）
        var f_can_share = 0;
        if(f_can_share == 1)
        {
            //显示右上角按钮
            wx.showOptionMenu({
                menuList: ['showOptionMenu','onMenuShareAppMessage']
            });
        }
        else
        {
            wx.hideOptionMenu();
        }
    });
</script></body>
</html>
