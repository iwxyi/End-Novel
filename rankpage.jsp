<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, java.util.regex.*, java.net.*" %>

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
			<a href="rankpage.jsp" class="mdui-ripple mdui-tab-active">排行</a>
			<a href="finishpage.jsp" class="mdui-ripple">完本</a>
			<a href="freepage.jsp" class="mdui-ripple">免费</a>
			<a href="writerpage.jsp" class="mdui-ripple">作家专区</a>
			<a href="downloadpage.jsp" class="mdui-ripple">客户端</a>
		</div>

		<!--正式内容-->

		<%
			String line = "", source = "", url = "https://www.qidian.com/rank";
			HttpURLConnection l_connection = (HttpURLConnection) (new URL(url)).openConnection();
			l_connection.connect();
			InputStreamReader isr = new InputStreamReader(l_connection.getInputStream(), "UTF-8");
			BufferedReader l_reader = new BufferedReader(isr);
			while ((line = l_reader.readLine()) != null) source+=line;
		%>

		<%
			String[] rankNames = {"原创风云榜", "24小时热销榜", "新锐会员榜", "推荐票榜", "收藏榜", "完本榜", "签约作家新书榜", "公众作家新书榜"};
			int startPos = 0, endPos = 0;
			for (int i = 0; i < rankNames.length; i++)
			{
		%>
			<div class="mdui-panel mdui-panel-popout" mdui-panel style="padding-left: 8%; width: 90%; margin-top: 1%;">
				<div class="mdui-panel-item mdui-panel-item-open" >
					<div class="mdui-panel-item-header">
						<div class="mdui-panel-item-title"><%= rankNames[i] %></div>
						<i class="mdui-panel-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
					</div>
					<div class="mdui-panel-item-body">
						<%
							startPos = source.indexOf("<h3 class=\"wrap-title lang\">", endPos);
							endPos = source.indexOf("<h3 class=\"wrap-title lang\">", startPos+10);
							if (endPos == 0 || endPos == -1)
								endPos = source.length();
							String rankPart = source.substring(startPos, endPos);

							String bookID, bookUrl, bookName;
							String regEx = "<a (class=\"name\" )?href=\"//book.qidian.com/info/(\\d+)\" target=\"_blank\" data-eid=\"[^ ]+?\" data-bid=\"\\d+\">(.+?)</a>";
							Pattern p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
							Matcher m = p.matcher(rankPart);

							out.print("<ul class=\"mdui-list\">");

							while (m.find())
							{
								bookID = m.group(2);
								bookName = m.group(3);
								// bookUrl = "http://book.qidian.com/info/" + bookID;
								bookUrl = "catalogue.jsp?bookID=" + bookID;

								out.print("<a class='mdui-list-item mdui-ripple' href='"+bookUrl+"' target='_blank'>"+bookName+"</a>");
							}

							out.print("</div>\n");
						%>
						<div class="mdui-panel-item-actions">
							<button class="mdui-btn mdui-ripple" mdui-panel-item-close>收起</button>
							<button class="mdui-btn mdui-ripple">查看更多</button>
						</div>
					</div>
				</div>
			</div>

		<%
			}
		%>

		<!-- 脚本 -->
		<script>
			
		</script>

</html>