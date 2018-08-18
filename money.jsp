<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 

		<link rel="stylesheet" href="css/mdui.min.css" />
		<script src="js/mdui.min.js"></script>
		<script src="js/jquery.min.js"></script>
		<script src="js/functions.js"></script>
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
	</head>
	<body class="mdui-appbar-with-toolbar mdui-drawer-body-left">

		<%@include file="UIframe/UIframe.jsp" %>
		<div class="main" style="left: 20%;">
		<div class="mdui-card">
		
			<!-- 卡片头部，包含头像、标题、副标题 -->
			<div class="mdui-card-header">
				<img class="mdui-card-header-avatar" src="img/圣墟.jpg" />
				<div class="mdui-card-header-title">123</div>
			</div>
		
			<!-- 卡片的媒体内容，可以包含图片、视频等媒体内容，以及标题、副标题 -->
			<div class="mdui-card-media">
				<img src="card.jpg" />
		
				<!-- 卡片中可以包含一个或多个菜单按钮 -->
				<div class="mdui-card-menu">
					<button class="mdui-btn mdui-btn-icon mdui-text-color-white"><i class="mdui-icon material-icons">share</i></button>
				</div>
			</div>
		
			<!-- 卡片的标题和副标题 -->
			<div class="mdui-card-primary">
				<div class="mdui-card-primary-subtitle">123的个人中心</div>
			</div>
		
			<!-- 卡片的内容 -->
			<div class="mdui-card-content">子曰：「学而时习之，不亦说乎？有朋自远方来，不亦乐乎？人不知，而不愠，不亦君子乎？」</div>
		
			<!-- 卡片的按钮 -->
			<div class="mdui-card-actions">
				<button class="mdui-btn mdui-ripple mdui-ripple mdui-color-blue-200 mdui-hoverable"> <a href="pay_1.jsp" class="mdui-text-color-white-text " >充值</a></button>
				<button class="mdui-btn mdui-ripple mdui-ripple mdui-color-blue-200 mdui-hoverable"> <a href="present.jsp" class="mdui-text-color-white-text">礼物</a></button>
				
			</div>
		
		</div>
		
	
			
				
				
				<ul class="cbp_tmtimeline">
				
				<li>
					<time class="cbp_tmtime" datetime="2018-05-18 22:00"><span>18/05/18</span> <span>22:00</span></time>
					<div class="cbp_tmicon cbp_tmicon-screen"></div>
					<div class="cbp_tmlabel">
						<h2>充值</h2>
						<p>200 元，余额 1200 元</p>
					</div>
				</li>
		
		</div>
	</body>
</html>
