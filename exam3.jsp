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
    <a href="exam1.jsp" class="mdui-ripple">审核中</a>
    <a href="exam2.jsp" class="mdui-ripple">已通过(2)</a>
    <a href="exam3.jsp" class="mdui-ripple mdui-tab-active">未通过(NULL)</a>
  </div>
  
  
<div class="mdui-container">
  <div class="mdui-row">
    <div class="mdui-col-sm-4">
      <div class="mdui-grid-tile">
        <img src="https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3579078760,3264702847&fm=200&gp=0.jpg"/>
        <div class="mdui-grid-tile-actions">
          <div class="mdui-grid-tile-text">
            <div class="mdui-grid-tile-title">全体通过</div>
            <div class="mdui-grid-tile-subtitle"><i class="mdui-icon material-icons">grid_on</i>为吸引新人作者，所有作品一律通过审核</div>
          </div>

        </div>
      </div>
    </div>
  </div>
</div>

		
		<!-- 脚本 -->


</html>