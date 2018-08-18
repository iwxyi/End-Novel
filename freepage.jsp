<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.regex.*, java.util.*, java.net.*" %>

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
			<a href="freepage.jsp" class="mdui-ripple mdui-tab-active">免费</a>
			<a href="writerpage.jsp" class="mdui-ripple">作家专区</a>
			<a href="downloadpage.jsp" class="mdui-ripple">客户端</a>
		</div>

		<!--正式内容-->

		<%
			String source = "", line = "", url = "https://www.qidian.com/free";
			HttpURLConnection l_connection = (HttpURLConnection) (new URL(url)).openConnection();
			l_connection.connect();
			InputStreamReader isr = new InputStreamReader(l_connection.getInputStream(), "UTF-8");
			BufferedReader l_reader = new BufferedReader(isr);
			while ((line = l_reader.readLine()) != null) source+=line;
		%>

		<%
			int startPos = source.indexOf("<div class=\"limit-book-list\"");
			if (startPos == -1 || startPos == 0) startPos = 0;
			int endPos = source.indexOf("<h3 class=\"lang\">下期预告</h3>", startPos);
			if (startPos == -1 || startPos == 0) endPos = source.length();
			String frPart = source.substring(startPos, endPos);
		%>

		<div class="mdui-card" style="left: 5%; width: 90%; margin-top: 1%;">
			<%
				String bookID = "", bookUrl = "", bookName = "", bookWriter = "", bookIntro = "", bookKind = "", imgsrc = "";

				String regEx ="<li data-rid=\"\\d+\">.+?data-bid=\"(\\d+)\" target=\"_blank\"><img src=\"(.+?)\"></a>.+?data-bid=\"\\d+\">(.+?)</a>.+?class=\"author\">\\s*<img.+?><.+?>(.+?)</a>.+?class=\"intro\">\\s+(.+?)\\s*</p>";
				Pattern p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
				Matcher m = p.matcher(frPart);
				while (m.find())
				{
					bookID = m.group(1);
					imgsrc = "http:" + m.group(2);
					bookUrl = "catalogue.jsp?bookID=" + bookID;
					bookName = m.group(3);
					bookWriter = m.group(4);
					bookIntro = m.group(5);
					
					out.print("<a class='mdui-list-item mdui-ripple' href='"+bookUrl+"' target='_blank'><div class='mdui-list-item-avatar'><img src='"+imgsrc+"'/></div><div class='mdui-list-item-content'><div class='mdui-list-item-title'>"+bookName+"<font color='gray'> - "+bookWriter+"</font></div><div class='mdui-list-item-text mdui-list-item-one-line'>"+bookIntro+"</div></div></a>");
				}
			%>
		</div>

		


		<!-- 脚本 -->
		<script>
			
		</script>

</html>


