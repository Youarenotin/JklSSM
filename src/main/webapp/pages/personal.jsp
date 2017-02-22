<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2/13 0013
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>快剪发-个人中心</title>
    <link rel="stylesheet" type="text/css" href="../static/css/common.css">
    <link rel="stylesheet" type="text/css" href="../static/css/user_center.css">
    <script type="text/javascript" src="../static/js/jquery.js"></script>
    <script type="text/javascript" src="../static/js/mobile3/common.js"></script>
    <script type="text/javascript" src="../static/js/fastclick.js"></script>
    <%--消除移动设备点击延迟--%>
    <script type="text/javascript">
        $(document).ready(function () {
            FastClick.attach(document.body);
        })
    </script>
    <style type="text/css">
        span.service_date {
            background: #f8c4b2;
            padding: 1px 15px;
            border-radius: 15px;
            color: #fff;
        }

        .name img {
            width: 20px;
            height: 20px;
            display: inline;
        }

        img.set_enter {
            width: 20px;
            position: absolute;
            right: 20px;
            top: 20px;
        }
    </style>
</head>
<body>
<div class="container" align="center">
    <a href="/setting">
        <img class="set_enter" src="../static/images/personal/she_zhi.png">
    </a>
    <div class="head">
        ${headimgurl}
        <img src="<c:out value="${headimgurl}"/>">
        <div class="name">
            <span><c:out value="${nickname}"/></span>
        </div>
    </div>
    <div class="gap"></div>
    <div class="info_list">
        <a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx8b5a0818b019401c&redirect_uri=http%3A%2F%2Fyouarenotinceshi.ngrok.cc%2FgetCode&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect">
            <div class="info_one">
                <span></span><img src="http://cdn.xingkeduo.com/image/mobile3/cloud_gray_icon.png"/>
                <span class="checked_title">个人云库</span>
                <div class="checked_info_main">
                    <span></span><img src="http://cdn.xingkeduo.com/image/mobile3/checked_icon.png"/>
                </div>
            </div>
        </a>
    </div>
    <!--选择信息列表End-->
    <div class="gap"></div>
    <!--底部导航栏-->
    <div class="fixed_menu" id="bottom_menu">
        <a href="/mobile3/store_list?f_user_id=308401&time=1486642618&token=91f0b30793ae7c55b0a49c1a0d717d37"
           class="haircut">
            <!--menu_cut_on-->
            <span class="menu_bg menu_cut">剪发</span>
        </a>
        <a href="/mobile3/order_list?f_user_id=308401&time=1486642618&token=91f0b30793ae7c55b0a49c1a0d717d37"
           class="order">
            <span class="menu_bg menu_order">订单</span>
        </a>
        <a href="javascript:;" class="personal_checked">
            <span class="menu_bg menu_user">个人</span>
        </a>
        <a href="/mobile3/more_read?f_user_id=308401&time=1486642618&token=91f0b30793ae7c55b0a49c1a0d717d37"
           class="more">
            <span class="menu_bg menu_more">更多</span>
        </a>
    </div>

</div>
</body>
</html>
