<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2/13 0013
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title>星客多 - 成为最好的你 - 个人中心</title>
    <link rel="stylesheet" type="text/css" href="http://cdn.xingkeduo.com/css/common.css">
    <link rel="stylesheet" type="text/css" href="http://cdn.xingkeduo.com/css/user_center.css"/>
    <script type="text/javascript" src="http://cdn.xingkeduo.com/js/jquery.js"></script>
    <script type="text/javascript" src="http://cdn.xingkeduo.com/js/mobile3/common.js"></script>
    <script type="text/javascript" src="http://cdn.xingkeduo.com/js/fastclick.js"></script>
    <script type="text/javascript">
        //移动设备快速响应点击事件
        $(document).ready(function () {
            FastClick.attach(document.body);
        })
    </script>
    <style type="text/css">
        .checked_info_main span {
            color: #999;
            margin-right: 5px;
        }

        /*.info_list_main{display: none;}*/
        span.checked_title {
            margin-left: 0;
        }

        .revise_box {
            display: none;
        }

        .last_row {
            border-bottom: 1px solid rgba(241, 241, 241, 0.9);
        }

        .revise_box p {
            line-height: 50px;
            padding: 0 3%;
            background: #F1F1F1
        }

        hr {
            background: #f2f2f2;
            height: 1px;
            border: none
        }

        .option {
            display: none
        }

        .option {
            float: right;
            height: 3rem;
        }

        .option img {
            height: 1.1rem;
            width: auto;
            vertical-align: middle;
        }

        .option_select {
            display: block
        }

        .single {
            width: 94%;
            margin: 0 auto;
            height: 3.2rem;
            line-height: 3rem;
            padding: 0 3%;
        }

        .single img {
            width: 1.1rem;
            height: auto;
            display: inline-block;
            vertical-align: middle;
        }
    </style>
    <style>
        .sign_up {
            width: 100%;
            margin-bottom: 1rem
        }

        form.sign_up_main {
            width: 100%;
            margin: 0 auto;
        }

        .sign_up_main .field_set {
            position: relative;
            margin: 1.5rem auto 1rem;
            background: none;
        }

        p.field_set {
            border-bottom: 1px solid rgba(241, 241, 241, 0.9);
            margin: 1.5rem auto;
        }

        .field_set input {
            padding: 0 5px;
            border: none;
            background: rgba(255, 255, 255, 0);
            line-height: 3rem;
            outline: none;
            font-size: 1.1rem;
            font-family: "microsoft yahei", Arial, sans-serif
        }

        input.identifying {
            width: 50%;
            position: relative
        }

        input.btn-xs {
            width: 30%;
            margin-top: 10px;
            padding: 0 10px;
            height: 30px;
            line-height: normal;
            cursor: pointer;
            border-left: 1px solid #1c436f;
            border-radius: 0;
            color: #1c436f;
            font-size: 1.1rem;
        }

        input.btn-xs:hover {
            color: #f2dede
        }

        .voice span {
            color: #1c436f;
            padding: 0 3%;
        }

        .not_border {
            border-bottom: none
        }

        .btn_box {
            width: 85%;
            margin: 6rem auto;
            text-align: center;
        }

        .btn_box a {
            color: #fff;
            font-size: 1.2rem;
        }

        p.one_btn {
            line-height: 3rem;
            border-radius: 5px;
            letter-spacing: 3px;
            border: 1px solid #1c436f;
            background: none;
        }

        p.confirm {
            background: #1c436f;
        }

        p.cancel {
            color: #1c436f;
            margin: 15px 0;
        }
    </style>
</head>
<body>
<div class="container">
    <input type="hidden" value="223.223.203.210" name="f_ip"/>
    <input type="hidden" value="e07b85de0915a9bcc0ecf9a3641e6611" name="ip_token"/>
    <input type="hidden" value="1486972268" name="ip_time"/>
    <input type="hidden" value="308401" name="f_user_id"/>
    <input type="hidden" value="91f0b30793ae7c55b0a49c1a0d717d37" name="token"/>
    <input type="hidden" value="1486642618" name="time"/>

    <div class="info_list_main">
        <div class="info_list">
            <div class="single">
                <span class="checked_title">用户名</span>
                <div class="checked_info_main">
                    <span></span>
                </div>
            </div>
        </div>
        <div class="gap"></div>
        <div class="info_list">
            <div class="info_one" position="sex">
                <span class="checked_title">年龄</span>
                <div class="checked_info_main" id="sex_span">
                    <span>90后</span><img src="http://cdn.xingkeduo.com/image/mobile3/checked_icon.png"/>
                </div>
            </div>
            <div class="info_one" position="cellphone">
                <hr/>
                <span class="checked_title">更改手机号</span>
                <div class="checked_info_main" id="cellphone_span">
                    <span>18401205020</span><img src="http://cdn.xingkeduo.com/image/mobile3/checked_icon.png"/>
                </div>
            </div>
        </div><!--选择信息列表End-->
        <div class="gap"></div>
        <div class="info_list">
            <div class="info_one" position="style">
                <span class="checked_title">风格定位(可多选)</span>
                <div class="checked_info_main" id="style_span">
                    <span>未选择</span><img src="http://cdn.xingkeduo.com/image/mobile3/checked_icon.png"/>
                </div>
            </div>
            <div class="info_one" position="work">
                <hr/>
                <span class="checked_title">职业属性</span>
                <div class="checked_info_main" id="work_span">
                    <span>其它</span><img src="http://cdn.xingkeduo.com/image/mobile3/checked_icon.png"/>
                </div>
            </div>
            <div class="info_one" position="care">
                <hr/>
                <span class="checked_title">到店距离</span>
                <div class="checked_info_main" id="care_span">
                    <span>15分钟以上</span><img src="http://cdn.xingkeduo.com/image/mobile3/checked_icon.png"/>
                </div>
            </div>
        </div><!--选择信息列表End-->
        <!--navbar start-->
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
            <a href="/mobile3/user?f_user_id=308401&time=1486642618&token=91f0b30793ae7c55b0a49c1a0d717d37"
               class="personal">
                <span class="menu_bg menu_user">个人</span>
            </a>
            <a href="/mobile3/more_read?f_user_id=308401&time=1486642618&token=91f0b30793ae7c55b0a49c1a0d717d37"
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
        </script>        <!--navbar end-->
    </div>
    <div class="revise_box" id="style">
        <p>风格定位(可多选)</p>
        <div class="info_one">
            <hr/>
            <span class="checked_title">干燥缺水</span>
            <div class="option " type="1">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="info_one">
            <hr/>
            <span class="checked_title">稀薄缺型</span>
            <div class="option " type="2">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="info_one">
            <hr/>
            <span class="checked_title">有过多白发</span>
            <div class="option " type="3">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="info_one">
            <hr/>
            <span class="checked_title">有烫发</span>
            <div class="option " type="4">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="info_one">
            <hr/>
            <span class="checked_title">有染发</span>
            <div class="option " type="5">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="info_one">
            <hr/>
            <span class="checked_title">有掉发情况</span>
            <div class="option " type="6">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="info_one">
            <hr/>
            <span class="checked_title">有出油情况</span>
            <div class="option " type="7">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="info_one">
            <hr/>
            <span class="checked_title">其它</span>
            <div class="option " type="8">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="btn_box">
            <a href="javascript:;"><p class="one_btn confirm">确 定</p></a>
        </div>
    </div>
    <div class="revise_box" id="sex">
        <p>性别</p>
        <div class="single">
            <hr/>
            <span class="checked_title">70后</span>
            <div class="option " type="1">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="single">
            <hr/>
            <span class="checked_title">80后</span>
            <div class="option " type="2">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="single">
            <hr/>
            <span class="checked_title">90后</span>
            <div class="option option_select" type="3">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="single">
            <hr/>
            <span class="checked_title">00后</span>
            <div class="option " type="4">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="single">
            <hr/>
            <span class="checked_title">其它</span>
            <div class="option " type="5">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>

        <div class="btn_box">
            <a href="javascript:;"><p class="one_btn confirm">确 定</p></a>
        </div>
    </div>
    <div class="revise_box" id="work">
        <p>职业性质</p>
        <div class="single">
            <hr/>
            <span class="checked_title">专业白/金领</span>
            <div class="option " type="1">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="single">
            <hr/>
            <span class="checked_title">自由职业者</span>
            <div class="option " type="2">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="single">
            <hr/>
            <span class="checked_title">学生/求职者</span>
            <div class="option " type="3">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="single">
            <hr/>
            <span class="checked_title">居家人士</span>
            <div class="option " type="4">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="single">
            <hr/>
            <span class="checked_title">其它</span>
            <div class="option option_select" type="14">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="btn_box">
            <a href="javascript:;"><p class="one_btn confirm">确 定</p></a>
        </div>
    </div>
    <div class="revise_box" id="care">
        <p>到店距离</p>
        <div class="single">
            <hr/>
            <span class="checked_title">5分钟以内</span>
            <div class="option  " type="1">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="single">
            <hr/>
            <span class="checked_title">5~10分钟</span>
            <div class="option  " type="2">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="single">
            <hr/>
            <span class="checked_title">15分钟以上</span>
            <div class="option  option_select" type="3">
                <img src="http://mcdn.xingkeduo.com/image/set_select.png"/>
            </div>
        </div>
        <div class="btn_box">
            <a href="javascript:;"><p class="one_btn confirm">确 定</p></a>
        </div>
    </div>
    <div class="revise_box not_border" id="cellphone">
        <p>更改手机号码</p>
        <div class="sign_up"> <!-- 注册表单 -->
            <form class="sign_up_main">
                <p class="field_set">
                    <input class="" id="sign_up_mobile" name="f_mobile" type="tel" placeholder="请输入您新的手机号">
                </p>
                <p class="field_set">
                    <label class="image-replace cd-username identifying" for="sign_up_identifying">验证码</label>
                    <input class="identifying" id="sign_up_identifying" name="f_code" type="text" autocomplete="off"
                           placeholder="请输入验证码">
                    <input type="button" id="J_code_btn" class="btn-xs" value="获取验证码"/>
                </p>
                <div class="voice" id="voice_code"><a href="javascript:;"><span>收不到验证码？试试语音验证码</span></a></div>
            </form>
        </div>
        <div class="btn_box">
            <a href="javascript:;"><p class="one_btn confirm">更换手机号码</p></a>
            <a href="javascript:;"><p class="one_btn cancel">取消</p></a>
        </div>
    </div>
</div>
<script type="text/javascript">
    var f_user_id = '308401';
    var time = <%=System.currentTimeMillis()%>;
    var token = '91f0b30793ae7c55b0a49c1a0d717d37';
    var second_count = 60;  //倒数计时
    var counting = 0;  //是否正在倒计时中
    var timer;  //定时器
    //点击获取验证码事件
    function do_get_code(obj) {
        var mobile_no = $("#sign_up_mobile").val();
        var f_ip = $("input[name='f_ip']").val();
        var ip_token = $("input[name='ip_token']").val();
        var ip_time = $("input[name='ip_time']").val();

        var f_user_id = $("input[name='f_user_id']").val();
        var token = $("input[name='token']").val();
        var time = $("input[name='time']").val();

        //验证手机号码是否存在
        if (mobile_no == '') {
            alert("请填写手机号码！");
            return false;
        }

        //验证手机号码是否符合规范
        if (!(/^[1][34578][0-9]{9}$/.test(mobile_no))) {
            alert("请填写正确的手机号码！");
            return false;
        }

        var _this = obj;

        $.ajax({
            url: '/mobile3/ajax_send_sms_vertify_code',
            type: 'post',
            dataType: 'json',
            data: {
                "mobile_no": mobile_no,
                "ip_token": ip_token,
                'ip_time': ip_time,
                "f_ip": f_ip,
                "f_user_id": f_user_id,
                "token": token,
                "time": time
            },
            beforeSend: function () {
                _this.unbind("click");
                _this.html("获取中...");
                _this.css("color", "gray");
            },
            success: function (content) {
                if (content.error == 0) {
                    var i = second_count;
                    //验证码60秒后重新获取
                    timer = setInterval(function () {
                        counting = 1;
                        _this.val(i + '秒后重试');
                        i--;
                        if (i < 0) {
                            _this
                                .val("获取验证码")
                                .css("color", '#1c436f');
                            $("#J_code_btn").unbind().bind("click", function () {
                                do_get_code($("#J_code_btn"));
                            })
                            counting = 0;
                            clearInterval(timer);
                        }
                    }, 1000)
                }
                else {
                    _this.val("获取验证码");
                    _this.css("color", "#1c436f");
                    $("#J_code_btn").unbind().bind("click", function () {
                        do_get_code($("#J_code_btn"));
                    })
                    alert(content.msg);
                }
            }
        });
    }

    $(document).ready(function () {
        $(".info_one,.list_default").mouseover(function () {
            $(".info_one,.list_default").removeClass("info_one_active");//移除所有.handle的active类
            $(this).addClass("info_one_active");//再将滑倒的这个添加上active类
        });

        $(".info_one,.list_default").mouseout(function () {
            $(this).removeClass("info_one_active");
        });
        $(".info_one").click(function () {
            $(this).find(".option").toggleClass("option_select");
            $(".info_list_main").hide();
            var name = $(this).attr("position");
            $("#" + name).show();
        });
        $(".single").click(function () {
            //$(this).find(".option").toggleClass("option_select");
            $(".single").find(".option").removeClass("option_select");
            $(this).find(".option").addClass("option_select");
        });

        //性别修改
        $("#sex .confirm").click(function () {
            var type = $("#sex .option_select").attr("type");
            var sex = $("#sex .option_select").parent().find(".checked_title").html();
            if (type > 0) {
                //开始提交评价
                $.ajax({
                    url: "/setSex",
                    type: "POST",
                    dataType: "json",
                    data: {"f_user_id": f_user_id, "time": time, "token": token, "type": type},
                    beforeSend: function () {
                        pop_up_loading();
                    },
                    success: function (content) {
                        pop_close();
                        if (content.error == 0) {
                            $("#sex_span span").html(sex);
                            $("#sex").hide();
                            $(".info_list_main").show();
                        }
                        else {
                            alert(content.msg);
                        }

                    }
                });
            }
            else {
                alert("请选择性别");
            }
        });

        //职业修改
        $("#work .confirm").click(function () {
            var type = $("#work .option_select").attr("type");
            var work = $("#work .option_select").parent().find(".checked_title").html();
            if (type > 0) {
                //开始提交评价
                $.ajax({
                    url: "/mobile3/ajax_update_work",
                    type: "POST",
                    dataType: "json",
                    data: {"f_user_id": f_user_id, "time": time, "token": token, "type": type},
                    beforeSend: function () {
                        pop_up_loading();
                    },
                    success: function (content) {
                        pop_close();
                        if (content.error == 0) {
                            $("#work_span span").html(work);
                            $("#work").hide();
                            $(".info_list_main").show();
                        }
                        else {
                            alert(content.msg);
                        }

                    }
                });
            }
            else {
                alert("请选择职业");
            }
        });

        //频次修改
        $("#care .confirm").click(function () {
            var type = $("#care .option_select").attr("type");
            var care = $("#care .option_select").parent().find(".checked_title").html();
            if (type > 0) {
                //开始提交评价
                $.ajax({
                    url: "/mobile3/ajax_update_care",
                    type: "POST",
                    dataType: "json",
                    data: {"f_user_id": f_user_id, "time": time, "token": token, "type": type},
                    beforeSend: function () {
                        pop_up_loading();
                    },
                    success: function (content) {
                        pop_close();
                        if (content.error == 0) {
                            $("#care_span span").html(care);
                            $("#care").hide();
                            $(".info_list_main").show();
                        }
                        else {
                            alert(content.msg);
                        }

                    }
                });
            }
            else {
                alert("请选择打理频次");
            }
        });

        //风格修改
        $("#style .confirm").click(function () {
            var types = "";
            var styles = "";
            $("#style .option_select").each(function () {
                if (types == "") {
                    types = $(this).attr("type");
                    styles = $(this).parent().find(".checked_title").html();
                }
                else {
                    types = types + "," + $(this).attr("type");
                    styles = $(this).parent().find(".checked_title").html() + "等";
                }

            });

            if (types != "") {
                //开始提交评价
                $.ajax({
                    url: "/mobile3/ajax_update_style",
                    type: "POST",
                    dataType: "json",
                    data: {"f_user_id": f_user_id, "time": time, "token": token, "types": types},
                    beforeSend: function () {
                        pop_up_loading();
                    },
                    success: function (content) {
                        pop_close();
                        if (content.error == 0) {
                            $("#style_span span").html(styles);
                            $("#style").hide();
                            $(".info_list_main").show();
                        }
                        else {
                            alert(content.msg);
                        }

                    }
                });
            }
            else {
                alert("请选择风格定位");
            }
        });


        //发送验证码
        $("#sign_up_mobile")
            .keyup(function () {
                mobile_keyup_act();
            })
            .blur(function () {
                mobile_keyup_act();
            })

        //电话号码keyup、blur事件
        function mobile_keyup_act() {
            var mobile_no = $("#sign_up_mobile").val();

            //验证手机号码是否符合规范
            if ((/^[1][34578][0-9]{9}$/.test(mobile_no))) {
                $("#J_code_btn").css("color", "#1c436f").unbind().bind("click", function () {
                    do_get_code($("#J_code_btn"));
                })
            }
            else {
                if (counting == 0) {
                    $("#J_code_btn").css("color", "#999").unbind("click");
                }
            }
        }


        //发送语音通知
        $('#voice_code').on('click', function () {
            var mobile_no = $("#sign_up_mobile").val();
            var f_ip = $("input[name='f_ip']").val();
            var ip_token = $("input[name='ip_token']").val();
            var ip_time = $("input[name='ip_time']").val();

            var f_user_id = $("input[name='f_user_id']").val();
            var token = $("input[name='token']").val();
            var time = $("input[name='time']").val();
            if (/^[1][34578][0-9]{9}$/.test(mobile_no)) {
                $.ajax({
                    url: '/mobile3/ajax_send_voice_vertify_code',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        "mobile_no": mobile_no,
                        "ip_token": ip_token,
                        'ip_time': ip_time,
                        "f_ip": f_ip,
                        "f_user_id": f_user_id,
                        "token": token,
                        "time": time
                    },
                    success: function (content) {
                        if (content.error == 0) {
                            alert("发送成功！");
                        }
                        else {
                            alert(content.msg);
                        }
                    }
                });
            }
            else {
                alert('请输入正确的手机号码');
            }
        });


        //提交修改
        $("#cellphone .confirm").click(function () {
            var mobile_no = $("#sign_up_mobile").val();
            var code = $("#sign_up_identifying").val();
            var f_ip = $("input[name='f_ip']").val();
            var ip_token = $("input[name='ip_token']").val();
            var ip_time = $("input[name='ip_time']").val();

            var f_user_id = $("input[name='f_user_id']").val();
            var token = $("input[name='token']").val();
            var time = $("input[name='time']").val();
            if (mobile_no == '') {
                alert("请填写手机号码！");
                return false;
            }
            if (!(/^[1][34578][0-9]{9}$/.test(mobile_no))) {
                alert("请填写正确的手机号码！");
                return false;
            }
            if (code == '') {
                alert("请填写验证码！");
                return false;
            }

            $.ajax({
                url: '/mobile3/ajax_update_mobile',
                type: 'post',
                dataType: 'json',
                data: {
                    "mobile_no": mobile_no,
                    "ip_token": ip_token,
                    'ip_time': ip_time,
                    "f_ip": f_ip,
                    "f_user_id": f_user_id,
                    "code": code,
                    "token": token,
                    "time": time
                },
                success: function (content) {
                    if (content.error == 0) {
                        $("#cellphone_span span").html(mobile_no);
                        $("#cellphone").hide();
                        $(".info_list_main").show();
                        clearInterval(timer);
                        $("#sign_up_mobile").val("");
                        $("#sign_up_identifying").val("");
                        $("#J_code_btn").val("获取验证码").css("color", '#1c436f');
                    }
                    else {
                        alert(content.msg);
                    }
                }
            });
        });


        $("#cellphone .cancel").click(function () {
            $("#cellphone").hide();
            $(".info_list_main").show();
        });
    });
</script>
</body>
</html>
