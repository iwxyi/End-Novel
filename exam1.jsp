<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>

	<head>
		<meta charset="utf-8" />

		<meta name="viewport" content="width=device-width" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<meta name="theme-color" content="slateblue" />

		<title>终点小说-审核结果 </title>

		<link rel="stylesheet" href="css/mdui.min.css" />
		<script src="js/mdui.min.js"></script>
		<script src="js/jquery.min.js"></script>
		<script src="js/functions.js"></script>
		<link type="text/css" rel="stylesheet" href="css/contact.css">
	</head>

	<body class="mdui-appbar-with-toolbar mdui-drawer-body-left">

		<%@include file="UIframe/UIframe.jsp" %>


		<!--正式内容-->
			<div class="mdui-tab mdui-tab-full-width" mdui-tab>

    <a href="examine.jsp" class="mdui-ripple">全部稿件(2)</a>
    <a href="exam1.jsp" class="mdui-ripple mdui-tab-active">审核中</a>
    <a href="exam2.jsp" class="mdui-ripple">已通过(2)</a>
    <a href="exam3.jsp" class="mdui-ripple">未通过(NULL)</a>
  </div>

		

</html>