<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Hello MUI</title>
		<meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<link rel="stylesheet" href="../static/css/mui.min.css">
		<style type="text/css">
			body,.mui-content{
			  	background-color: #333;
			  	color:#fff;
			  }
			  .title{
			  	margin: 35px 15px 10px;
			  }
			  .title+.content{
			  	margin: 10px 15px 35px;
			  	color: #bbb;
			  	text-indent: 1em;
			  	font-size: 14px;
			  	line-height: 24px;
			  }
			  .mui-table-view{
			  	margin-bottom: 35px;
			  }
		</style>
	</head>

	<body>
		<div class="mui-content">
			<div class="title">侧滑导航</div>
			<div class="content">
				这是首页侧滑导航示例，你可以在这里放置任何内容；关闭侧滑菜单有多种方式：
				1.点击本侧滑菜单页之外的任意位置;
				2.点击如下红色按钮<span id="android-only">；3.Android手机按back键；4.Android手机按menu键
				</span>。
				<p style="margin: 10px 15px;">
					<button id="close-btn" type="button" class="mui-btn mui-btn-danger mui-btn-block" style="padding: 5px 20px;">关闭侧滑菜单</button>
				</p>
				
			</div>
			<div class="title" style="margin-bottom: 25px;">mui典型控件</div>
			<ul class="mui-table-view mui-table-view-chevron mui-table-view-inverted" style="color: #ddd;">
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right" open-type="common" href="examples/pullrefresh_main.html">
						下拉刷新
					</a>
				</li>
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right" open-type="common" href="examples/offcanvas-drag-left.html">
						侧滑导航
					</a>
				</li>
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right" href="examples/switches.html">
						开关控件
					</a>
				</li>
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right" href="examples/tableviews-with-swipe.html">
						列表左滑菜单
					</a>
				</li>
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right" href="examples/tab-with-viewpagerindicator.html">
						可拖动式选项卡
					</a>
				</li>
			</ul>
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" charset="utf-8">
			var aniShow = "slide-in-right";
			//关于backbutton和menubutton两个按键的说明，在iOS平台不存在，故需隐藏
			if(!mui.os.android){
				var span = document.getElementById("android-only")
				if(span){
					span.style.display = "none";
				}
				aniShow = "pop-in";
			}
			var subWebview=null,template=null,index=null;
			mui.plusReady(function () {
				//获得主页面webview引用；
				index = plus.webview.currentWebview().opener();
			})
			mui('.mui-table-view').on('tap', 'a', function() {
				var id = this.getAttribute("href");
				var type = this.getAttribute("open-type");
				var href = this.href;
				if(type=="common"||mui.os.ios){
					var webview_style = {
						popGesture: "close"
					};
					mui.openWindow({
						id: id,
						url: href,
						styles: webview_style,
						show: {
							aniShow: aniShow
						},
						waiting: {
							autoShow: false
						}
					});
				}else{
					var href = this.href;
					var title = this.innerText;
					template = plus.webview.getWebviewById("default-main");
					//获得共用子webview
					subWebview = template.children()[0];
					
					//通知模板修改标题，并显示隐藏右上角图标；
					mui.fire(template,'updateHeader',{title:title,showMenu:false});
					if (subWebview.getURL() != href) {
						subWebview.loadURL(href);
					} else {
						 subWebview.show();
					}
					template.show('slide-in-right', 150);
				}
			});
			
			/**
			 * 关闭侧滑菜单
			 */
			function close() {
				mui.fire(mui.currentWebview.opener(),"menu:close");
			}
			
			//点击“关闭侧滑菜单”按钮处理逻辑
			document.getElementById("close-btn").addEventListener("tap",close);
			//在android4.4.2中的swipe事件，需要preventDefault一下，否则触发不正常
			window.addEventListener('dragstart',function(e){
				mui.gestures.touch.lockDirection = true; //锁定方向
				mui.gestures.touch.startDirection = e.detail.direction;
			});
			window.addEventListener('dragleft', function(e) {
				if(!mui.isScrolling){
					e.detail.gesture.preventDefault();	
				}
			});
			//监听左滑事件，若菜单已展开，左滑要关闭菜单；
			window.addEventListener("swipeleft",function (e) {
				if(Math.abs(e.detail.angle)>170){
					close();						
				}
			});
		</script>
	</body>

</html>