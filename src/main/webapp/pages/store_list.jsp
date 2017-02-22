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
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String href_store_list = "/mobile/store_list?uid="+request.getAttribute("uid")+"&time="+System.currentTimeMillis()+"&token="+request.getAttribute("token");
    String href_more_read="/mobile/more_read?uid="+request.getAttribute("uid")+"&time="+System.currentTimeMillis()+"&token="+request.getAttribute("token");
    String href_order_list="/mobile/store_list?uid="+request.getAttribute("uid")+"&time="+System.currentTimeMillis()+"&token="+request.getAttribute("token");
%>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>星客多 - 成为最好的你 - 快剪门店</title>
    <script src="http://cdn.xingkeduo.com/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="http://cdn.xingkeduo.com/js/mobile3/common.js"></script>
    <link type="text/css" rel="stylesheet" href="http://cdn.xingkeduo.com/css/common.css">
    <link type="text/css" rel="stylesheet" href="http://cdn.xingkeduo.com/css/slides.css">
    <link type="text/css" rel="stylesheet" href="http://cdn.xingkeduo.com/css/index.css">
    <script type="text/javascript" src="http://cdn.xingkeduo.com/js/slides.js"></script>
    <script type="text/javascript" src="http://cdn.xingkeduo.com/js/zepto_min.js"></script>
    <script type="text/javascript" src="http://cdn.xingkeduo.com/js/touchslider.js"></script>
    <script type="text/javascript" src="http://cdn.xingkeduo.com/js/fastclick.js"></script>
    <script type="text/javascript">
        //移动设备快速响应点击事件
        $(document).ready(function(){
            FastClick.attach(document.body);
        })
    </script>
</head>

<body>
<div class="container">
    <div class="tab_switch">
        <ul id="pagenavi" class="page fixed_top">
            <li><a href="javascript:;">北京</a></li>
            <li><a  href="javascript:;">上海</a></li>
        </ul>
        <div class="addWrap mt2">
            <div class="swipe" id="mySwipe">
                <div class="swipe-wrap">
                    <div class="img_li"><a href="javascript:;"><img src="http://cdn.xingkeduo.com/image/mobile3/banner/banner_new12.jpg"/></a></div>
                    <div class="img_li"><a href="javascript:;"><img src="http://cdn.xingkeduo.com/image/mobile3/banner/banner_new3.jpg"/></a></div>
                    <div class="img_li"><a href="javascript:;"><img src="http://cdn.xingkeduo.com/image/mobile3/banner/banner_new7.jpg"/></a></div>
                    <div class="img_li"><a href="javascript:;"><img src="http://cdn.xingkeduo.com/image/mobile3/banner/banner20170215a.jpg"/></a></div>
                    <div class="img_li"><a href="javascript:;"><img src="http://cdn.xingkeduo.com/image/mobile3/banner/banner20170215b.jpg"/></a></div>
                    <div class="img_li"><a href="javascript:;"><img src="http://cdn.xingkeduo.com/image/mobile3/banner/banner20170215d.jpg"/></a></div>
                </div>

            </div>
        </div>
    </div>
    <ul id="position">
        <li class="cur"></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div><!--banner图End-->
<div id="slider" class="swipe">
    <ul class="tab_switch_list">
        <li class="li_list">
            <!--店铺显示列表-->
            <div class="bj_store" id="first_list"></div>
        </li>
        <li class="li_list">
            <!--店铺显示列表-->
            <div class="sh_store" id="second_list"></div>
        </li>
    </ul>
</div>
</div>

<!--navbar start-->
<!--底部导航栏-->
<div class="fixed_menu" id="bottom_menu">
    <a href="<%=href_store_list%>"
       class="haircut">
        <!--menu_cut_on-->
        <span class="menu_bg menu_cut">剪发</span>
    </a>
    <a href="<%=href_order_list%>>"
       class="order">
        <span class="menu_bg menu_order">订单</span>
    </a>
    <a href="javascript:;" class="personal_checked">
        <span class="menu_bg menu_user">个人</span>
    </a>
    <a href="<%=href_more_read%>"
       class="more">
        <span class="menu_bg menu_more">更多</span>
    </a>
</div>

<!--底部固定切换状态的js-->
<script type="text/javascript">

    $(document).ready(function(){

        $("#bottom_menu a").click(function(){

            var _this = $(this);

            //寻找亮起节点,改为不亮的
            $('#bottom_menu a').each(function(){
                if( $(this).hasClass("haircut_checked") )
                {
                    $(this).addClass("haircut").removeClass("haircut_checked");
                }
                else if( $(this).hasClass("order_checked") )
                {
                    $(this).addClass("order").removeClass("order_checked");
                }
                else if( $(this).hasClass("personal_checked") )
                {
                    $(this).addClass("personal").removeClass("personal_checked");
                }
                else if( $(this).hasClass("more_checked") )
                {
                    $(this).addClass("more").removeClass("more_checked");
                }
            })

            //自己亮起
            if( _this.hasClass("haircut") )
            {
                _this.addClass("haircut_checked").removeClass("haircut");
            }
            else if( _this.hasClass("order") )
            {
                _this.addClass("order_checked").removeClass("order");
            }
            else if( _this.hasClass("personal") )
            {
                _this.addClass("personal_checked").removeClass("personal");
            }
            else if( _this.hasClass("more") )
            {
                _this.addClass("more_checked").removeClass("more");
            }
        })
    });
</script>    <!--navbar end-->

<input type="hidden" id="latitude">
<input type="hidden" id="longitude">
</div>

<!--  页面是否可以分享 f_can_share 0否1是  -->
<!--  页面是否可以分享  -->
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
    wx.config({
        debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        appId: 'wx8d0ca17fea670939', // 必填，公众号的唯一标识
        timestamp: 1487322841, // 必填，生成签名的时间戳
        nonceStr: 'wechat_code', // 必填，生成签名的随机串
        signature: '2f69bc012802451d4399e90c5c96d8a21452948a',// 必填，签名，见附录1
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
</script><script type="text/javascript">
    //全局变量定义
    var f_user_id = '308401';
    var time = '1486642618';
    var token = '91f0b30793ae7c55b0a49c1a0d717d37';

    //轮播图中...定位
    var bullets = document.getElementById('position').getElementsByTagName('li');
    var banner = Swipe(document.getElementById('mySwipe'), {
        auto: 10000,
        continuous: true,
        disableScroll:false,
        callback: function(pos) {
            var i = bullets.length;
            while (i--) {
                bullets[i].className = ' ';
            }
            bullets[pos].className = 'cur';
        }
    })

    //切换高亮
    function set_high_light()
    {
        $("#pagenavi li:eq(0) a").trigger("click");
    }

    //首次加载事件
    function showPosition()
    {
        var data = {
            'lat'         :    $("#latitude").val(),
            'lon'         :    $("#longitude").val(),
            'f_user_id'   :    f_user_id,
            'time'        :    time,
            'token'   :    token
        }

        $.ajax({
            url         :   '/mobile3/ajax_store_list',
            type        :   'Post',
            data        :   data,
            dataType    :   'json',
            beforeSend  :   function()
            {
                pop_up_loading();
            },
            complete    :   function()
            {
                pop_close();
            },
            success     :   function(res)
            {
                if( res.error == 0)
                {
                    $("#first_list").html( res.content.bj );
                    $("#second_list").html( res.content.sh  );

                    if(res.content.f_province_id == 2)//北京
                    {
                        var auto = 0;
                    }
                    else
                    {
                        var auto = 1;
                    }

                    //tab切换部分js
                    var page = 'pagenavi';

                    var as = document.getElementById(page).getElementsByTagName('a');

                    var tt = new TouchSlider({
                        id          :   'slider',             //幻灯容器的id
                        fx          :   'ease-out',
                        auto        :   auto,
                        direction   :   'left',
                        speed       :   300,
                        timeout     :   360000,
                        before      :   function(index)
                        {
                            var as=document.getElementById(this.page).getElementsByTagName('a');
                            as[this.p].className = '';
                            as[index].className = 'active';
                            this.p = index;
                            var txt = as[index].innerText;
                            //$("#"+this.page).parent().find('.emtitle').text(txt);
                            var txturl = as[index].getAttribute('href');
                            var turl = txturl.split('#');
                            //$("#"+this.page).parent().find('.go_btn').attr('href',turl[1]);
                        }
                    });

                    tt.page = page;
                    tt.p = 0;
                    //console.dir(tt); console.dir(tt.__proto__);
                    for(var i=0;i<as.length;i++){
                        (function(){
                            var j=i;
                            as[j].tt = tt;
                            as[j].onclick=function(){
                                this.tt.slide(j);
                                return false;
                            }
                        })();
                    }

                    //高亮城市
                    $("#pagenavi li:eq(" + auto + ") a").trigger("click");

                }
                else
                {
                    alert(res.msg);return false;
                }

                pop_close();
            }
        })
    }

    $(document).ready(function(){

        $(".one_store").live("click",function(){
            var f_store_id = $(this).attr("f_store_id");
            var status = $(this).find(".status");
//            if( status.hasClass("suspend"))
//            {
//                alert("非常抱歉,该店铺目前非营业时段中,您可以选择其他营业中的店铺下单为您服务。");
//            }
//            else if( status.hasClass("suspend_month") )
//            {
//                alert("非常抱歉,该店铺发型师月会的时间到了，这个时间段无法为您服务,您可以选择其他营业中的店铺下单为您服务。");
//            }
//            else if( status.hasClass("at_will_pay") )
//            {
//                alert("该店铺正在随星付活动中,直接前往该店铺服务,服务完成后，价格多少由您根据服务质量决定。");
//            }
//            else if( status.hasClass("business") )
//            {
            pop_up_loading();
            window.location.href = '/mobile3/store_detail?f_store_id=' + f_store_id + '&f_user_id=' + f_user_id + '&time=' + time + '&token=' + token;
//            }
//            else
//            {
//                alert("我们正在努力完成装修。具体营业时间待定，请随时关注我们公众账号。");
//            }
        })
    });
</script>


</body>
</html>

