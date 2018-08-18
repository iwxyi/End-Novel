<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.regex.*, java.util.*, java.net.*" %>
<%@ page import="wxy.jsp.novel.*" %>

<jsp:useBean id="usero" class="wxy.jsp.novel.UserO" scope="session" />

<%
	String line = "", source = "", url = "https://www.qidian.com/all";
	HttpURLConnection l_connection = (HttpURLConnection) (new URL(url)).openConnection();
	l_connection.connect();
	InputStreamReader isr = new InputStreamReader(l_connection.getInputStream(), "UTF-8");
	BufferedReader l_reader = new BufferedReader(isr);
	while ((line = l_reader.readLine()) != null) source+=line;
%>

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
		<script src="js/jquery.min.js"></script>
		<script src="js/functions.js"></script>
	</head>

	<body class="mdui-appbar-with-toolbar mdui-drawer-body-left">
		<!-- mdui-drawer-body-left 可使抽屉式导航栏占位 -->

		<%@include file="UIframe/UIframe.jsp" %>

		<div class="mdui-tab mdui-tab-full-width" mdui-tab>
			<a href="homepage.jsp" class="mdui-ripple mdui-tab-active">推荐</a>
			<a href="sortpage.jsp" class="mdui-ripple">分类</a>
			<a href="rankpage.jsp" class="mdui-ripple">排行</a>
			<a href="finishpage.jsp" class="mdui-ripple">完本</a>
			<a href="freepage.jsp" class="mdui-ripple">免费</a>
			<a href="writerpage.jsp" class="mdui-ripple">作家专区</a>
			<a href="downloadpage.jsp" class="mdui-ripple">客户端</a>
		</div>

		<!--正式内容-->
		<div class="mdui-card" style="left: 5%; width: 90%;">
			<div class="mdui-row-xs-3 mdui-row-sm-4 mdui-row-md-5 mdui-row-lg-6 mdui-row-xl-7 mdui-grid-list">

				<%
					int startPos = source.indexOf("<div class=\"all-book-list\">");
					int endPos = source.indexOf("<div class=\"page-box cf\">", startPos);
					// out.print(source.length()+"   "+startPos+"  "+endPos+"  ");
					String ulPart = source.substring(startPos, endPos);
					String[] liPart = ulPart.split("</li");

					int indexID = 0;
					while (indexID < 10 && indexID < liPart.length) // 每个 li
					{
						String bookID = "", bookUrl = "", bookname = "", bookWriter = "", bookKind = "", imgsrc = "";

							String regEx ="href=\"//book.qidian.com/info/(\\d+)\"";
							Pattern p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
							Matcher m = p.matcher(liPart[indexID]);
							if(m.find()) bookID = m.group(1);
							else bookID = "0000000000";
						//bookUrl = "http://book.qidian.com/info/" + bookID;
						bookUrl = "catalogue.jsp?bookID=" + bookID;

						regEx = "bid=\"\\d+\">(.+?)</a>";
						p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
						m = p.matcher(liPart[indexID]);
						if(m.find()) bookname = m.group(1);
						else bookname = "未获取到";

						regEx = "\"_blank\">(.{1,10})</a><em>";
						p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
						m = p.matcher(liPart[indexID]);
						if(m.find()) bookWriter = m.group(1);
						else bookWriter = "未获取到";

						regEx = "src=\"//(qidian.qpic.cn/qdbimg/[^>]+)\">";
						p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
						m = p.matcher(liPart[indexID]);
						if(m.find()) imgsrc = "http://" + m.group(1);
						else imgsrc = "未获取到";

						out.print("<div class='mdui-col'> <div class='mdui-grid-tile'> <a href='"+bookUrl+"' target='_blank'><img src='"+imgsrc+"'/></a> <div class='mdui-grid-tile-actions'> <div class='mdui-grid-tile-text'> <div class='mdui-grid-tile-title'>"+bookname+"</div> <div class='mdui-grid-tile-subtitle'>"+bookWriter+"</div> </div> <div class='mdui-grid-tile-buttons'> <button class='mdui-btn mdui-btn-icon'><i class='mdui-icon material-icons'>star_border</i></button> </div> </div> </div> </div>");

						indexID++;
					}

				%>
			</div>
		</div>

		<%
			line = source = "";
			startPos = endPos = 0;
			url = "https://www.qidian.com/rank";
			l_connection = (HttpURLConnection) (new URL(url)).openConnection();
			l_connection.connect();
			isr = new InputStreamReader(l_connection.getInputStream(), "UTF-8");
			l_reader = new BufferedReader(isr);
			while ((line = l_reader.readLine()) != null) source+=line;
		%>

		<%
			String[] rankNames = {"原创风云榜", "24小时热销榜", "新锐会员榜", "推荐票榜", "收藏榜", "完本榜", "签约作家新书榜", "公众作家新书榜"};
			for (int i = 0; i < 4 && i < rankNames.length; i++)
			{
		%>
			<div class="mdui-panel mdui-panel-popout" mdui-panel style="padding-left: 6%; width: 94%; margin-top: 1%;">
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

</html>