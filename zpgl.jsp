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

	<div class="mdui-container">
  <div class="mdui-tab mdui-tab-centered" mdui-tab>
    <a href="zpgl1.jsp" class="mdui-ripple">已发表作品</a>
    <a href="zpgl2.jsp" class="mdui-ripple">未发表作品</a>
    <a href="zpgl3.jsp" class="mdui-ripple">草稿箱</a>
  </div>
</div>
		
		


		<!-- 脚本 -->
		<script>
			
		</script>

</html>