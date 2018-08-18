<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>

<html>

	<head>
		<meta charset="utf-8" />

		<meta name="viewport" content="width=device-width" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<meta name="theme-color" content="slateblue" />

		<title>终点小说</title>

		<link rel="stylesheet" href="css/mdui.min.css" />
		<script src="js/mdui.min.js"></script>
		<script src="js/yunj.js"></script>
		<link rel="stylesheet" href="css/yunj.css" />
		<link rel="stylesheet" href="css/register.css" />
		<script src="js/jquery.min.js"></script>
		<script src="js/register.js"></script>
		<script src="js/functions.js"></script>
	</head>

	<body class="mdui-appbar-with-toolbar mdui-drawer-body-left">

		<%@include file="UIframe/UIframe.jsp" %>

		<div class="mdui-tab mdui-tab-full-width" mdui-tab>
			<a href="homepage.jsp" class="mdui-ripple">推荐</a>
			<a href="sortpage.jsp" class="mdui-ripple">分类</a>
			<a href="rankpage.jsp" class="mdui-ripple">排行</a>
			<a href="finishpage.jsp" class="mdui-ripple">完本</a>
			<a href="freepage.jsp" class="mdui-ripple">免费</a>
			<a href="writerpage.jsp" class="mdui-ripple mdui-tab-active">作家专区</a>
			<a href="downloadpage.jsp" class="mdui-ripple">客户端</a>
		</div>

		<!--正式内容-->

		<div class="mdui-card" style="left: 5%; width: 90%; margin-top: 1%;">
			<div class="mdui-panel mdui-panel-popout" mdui-panel>

				

			</div>

		</div>

		


		<!-- 脚本 -->
		<script>
			
		</script>

</html>