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
	<body class="mdui-appbar-with-toolbar">

		<%@include file="UIframe/UIframe.jsp" %>

		<div class="main">
			
				<div class="mdui-card">
				
					<!-- 卡片头部，包含头像、标题、副标题 -->
					<div class="mdui-card-header">
						<img class="mdui-card-header-avatar" src="img/admin.jpg" />
						<div class="mdui-card-header-title">admin</div>
						<div class="mdui-card-header-subtitle">12级</div>
					</div>
				
					<!-- 卡片的媒体内容，可以包含图片、视频等媒体内容，以及标题、副标题 -->
					<div class="mdui-card-media">
						<img src="img/admin_1.jpg" />
				
						<!-- 卡片中可以包含一个或多个菜单按钮 -->
					
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
				<li>
					<time class="cbp_tmtime" datetime="2018-05-09 16:00"><span>18/05/09</span> <span>16:00</span></time>
					<div class="cbp_tmicon cbp_tmicon-screen"></div>
					<div class="cbp_tmlabel">
						<h2>支出</h2>
						<p>-500 元，余额 1000 元</p>
					</div>
				</li>
				<li>
					<time class="cbp_tmtime" datetime="2018-03-17 10:00"><span>18/03/17</span> <span>10:00</span></time>
					<div class="cbp_tmicon cbp_tmicon-mail"></div>
					<div class="cbp_tmlabel">
						<h2>活动收入</h2>
						<p>200元，余额 1500 元</p>
					</div>
				</li>
			</ul>
		</div>
	</body>
</html>
