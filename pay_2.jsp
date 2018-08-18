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
	<body class="mdui-appbar-with-toolbar mdui-drawer-body-left mdui-color-theme-accent-pink">

		<%@include file="UIframe/UIframe.jsp" %>

		<div class="mdui-tab mdui-tab-full-width" mdui-tab>
			<a href="#example1-tab1" class="mdui-ripple">微信支付</a>
			<a href="#example1-tab2" class="mdui-ripple">支付宝支付</a>
		</div>
		
		<div id="example1-tab1" class="mdui-p-a-2">
			<div class="mdui-card">
				<div class="mdui-card-media">
					<img src="img/wx2wm.jpg" style="padding-left: 40%; width: 60%; height: 60%;" />
					<div class="mdui-card-media-covered">
						
					</div>
				</div>
			</div>
		</div>
		
		<div id="example1-tab2" class="mdui-p-a-2"><div class="mdui-card">
			<div class="mdui-card">
				<div class="mdui-card-media">
					<img src="img/zfb2wm.jpg" style="padding-left: 40%; width: 60%; height: 60%;" />
					<div class="mdui-card-media-covered">
				
					</div>
				</div>
			</div>
		</div>
		
		</div>

	</body>
</html>
