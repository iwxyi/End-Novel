<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>

	<head>
		<meta charset="utf-8" />

		<meta name="viewport" content="width=device-width" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<meta name="theme-color" content="slateblue" />

		<title>终点小说 - 联系我们</title>

		<link rel="stylesheet" href="css/mdui.min.css" />
		<script src="js/mdui.min.js"></script>
		<script src="js/jquery.min.js"></script>
		<script src="js/functions.js"></script>
		<link type="text/css" rel="stylesheet" href="css/contact.css">
	</head>

	<body class="mdui-appbar-with-toolbar">

		<%@include file="UIframe/UIframe.jsp" %>


		<!--正式内容-->
		<div class="htmleaf-container">
			<div id="questions">
				<ul>
					<li class="clearfix">
						<h5><b class="UI-ask"></b>这是个什么样的网站？</h5>
						<div class="foldContent">
							<p>起点中文网精简版。</p>
							<p>作品数据（例如正文、作者、榜单等，不包括用户账号）与<a href="http://www.qidian.com" target="_blank">起点中文网</a>完全一致，但是本网站采用Material Design视觉效果，结合多项流行技术，提供给用户更佳的访问方式与视觉效果。</p>
						</div>
					</li>
					<li class="clearfix">
						<h5><b class="UI-ask"></b>开发团队？</h5>
						<div class="foldContent">
							请点击右上角菜单项，查看“关于本站”。
						</div>
					</li>
					<li class="clearfix">
						<h5><b class="UI-ask"></b>所用到的技术、思想、模式和框架？</h5>
						<div class="foldContent">
							<p>JSP<br>JavaBean<br>mySQL<br>Servlet<br>AJAX实时通讯<br>短信验证<br>HTML+JS+CSS<br><a href="https://baike.baidu.com/item/SVG/63178?fr=aladdin" target="_blank">SVG(可缩放矢量图形)</a><br>MDUI框架<br>jQuery框架<br>MVC架构<br>CSS模块化思想<br><a href="http://www.jb51.net/article/65650.htm" target="_blank">Modernizr库</a><br>imagesLoaded插件<br>howle音频库</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
		
		<!-- 脚本 -->

		<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
		<script>window.jQuery || document.write('<script src="js/jquery.min.js"><\/script>')</script>
		<script type="text/javascript">
			$(function(){
				$("li>h5","#questions").bind("click",function(){
				    var li=$(this).parent();
					if(li.hasClass("fold")){
						li.removeClass("fold");
						$(this).find("b").removeClass("UI-bubble").addClass("UI-ask");
						li.find(".foldContent").slideDown();
					}else{
						li.addClass("fold");
						$(this).find("b").removeClass("UI-ask").addClass("UI-bubble");
						li.find(".foldContent").slideUp();
					}
				});
			})
		</script>
</html>