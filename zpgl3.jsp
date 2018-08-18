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
    <a href="zpgl3.jsp" class="mdui-ripple mdui-tab-active">草稿箱</a>
  </div>
</div>
<div class="mdui-container" id="del">
  <div class="mdui-row">
    <div class="mdui-col-sm-6 mdui-col-md-4">
      <div class="mdui-card">
        <div class="mdui-card-media">
          <img src="https://qidian.qpic.cn/qdbimg/349573/1011546340/150"/>
          <div class="mdui-card-media-covered mdui-card-media-covered-transparent">
            <div class="mdui-card-primary">
              <div class="mdui-card-primary-title">沧海商田</div>
              <div class="mdui-card-primary-subtitle">纪茗</div>
            </div>
          </div>
        </div>
        <div class="mdui-card-actions">
          <button class="mdui-btn mdui-ripple">编辑信息</button>
          <button class="mdui-btn mdui-ripple" onclick="deldel();">删除</button>
        </div>
      </div>
    </div>
  </div>
</div>


		


		<!-- 脚本 -->
		<script>
			function deldel()
			{
				alert('删除成功');
				document.getElementById("del").innerHTML='';
			}
		</script>

</html>