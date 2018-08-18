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
			<ul class="cbp_tmtimeline">
				<li>
					<time class="cbp_tmtime" datetime="2018-06-01 22:00"><span>18/06/01</span> <span>24:00</span></time>
					<div class="cbp_tmicon cbp_tmicon-screen"></div>
					<div class="cbp_tmlabel">
						<h2>进度报告（三）</h2>
						<p>使用servlet等技术，增加点赞功能</p>
						<p>规则：类似于QQ，每个用户每天都有10次点赞机会，可以给喜欢的作品点赞。同一作品可以多次点赞。</p>
					</div>
				</li>
				<li>
					<time class="cbp_tmtime" datetime="2018-05-18 22:00"><span>18/05/18</span> <span>22:00</span></time>
					<div class="cbp_tmicon cbp_tmicon-screen"></div>
					<div class="cbp_tmlabel">
						<h2>进度报告（二）</h2>
						<p>已完成完整的账号注册、登录、恢复流程，通过cookie、session、mySQL等存储数据。</p>
					</div>
				</li>
				<li>
					<time class="cbp_tmtime" datetime="2018-05-09 16:00"><span>18/05/09</span> <span>16:00</span></time>
					<div class="cbp_tmicon cbp_tmicon-screen"></div>
					<div class="cbp_tmlabel">
						<h2>进度报告（一）</h2>
						<p>已完成注册界面、首页（封面），通过正则表达式和网络爬虫从起点中文网获取对应的数据，并加载到本网站上。</p>
					</div>
				</li>
				<li>
					<time class="cbp_tmtime" datetime="2018-03-17 10:00"><span>18/03/17</span> <span>10:00</span></time>
					<div class="cbp_tmicon cbp_tmicon-mail"></div>
					<div class="cbp_tmlabel">
						<h2>终点小说网团队开始组建</h2>
						<p>为顺利完成J2EE课程设计，终点小说网开发团队于今日成立，即日起正式着手于网站开发！</p>
					</div>
				</li>
			</ul>
		</div>
	</body>
</html>
