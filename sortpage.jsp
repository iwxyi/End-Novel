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
		<script src="js/functions.js"></script>
	</head>

	<body class="mdui-appbar-with-toolbar mdui-drawer-body-left">

		<%@include file="UIframe/UIframe.jsp" %>

		<div class="mdui-tab mdui-tab-full-width" mdui-tab>
			<a href="homepage.jsp" class="mdui-ripple">推荐</a>
			<a href="sortpage.jsp" class="mdui-ripple mdui-tab-active">分类</a>
			<a href="rankpage.jsp" class="mdui-ripple">排行</a>
			<a href="finishpage.jsp" class="mdui-ripple">完本</a>
			<a href="freepage.jsp" class="mdui-ripple">免费</a>
			<a href="writerpage.jsp" class="mdui-ripple">作家专区</a>
			<a href="downloadpage.jsp" class="mdui-ripple">客户端</a>
		</div>

		<!--正式内容-->

		<div class="mdui-card" style="left:5%; width: 90%; margin-top: 1%;">
			
			<div class="mdui-panel mdui-panel-popout" mdui-panel>

				<%
					String[] kinds = {"玄幻", "奇幻", "武侠", "仙侠", "都市", "现实", "军事",
									"历史", "游戏", "体育", "科幻", "灵异"};
					String[] words = {"xuanhuan", "qihuan", "wuxia", "xianxia", "dushi", "xianshi", "junshi",
									"lishi", "youxi", "tiyu", "kehuan", "lingyi"};

					for (int i = 0; i < kinds.length; i++)
					{
						out.print("<div class='mdui-panel-item ' > <div class='mdui-panel-item-header'> <div class='mdui-panel-item-title'>" + kinds[i] + "</div> <i class='mdui-panel-item-arrow mdui-icon material-icons'>keyboard_arrow_down</i> </div> <div class='mdui-panel-item-body'>\n"); // mdui-panel-item-open
						
						//out.print("<div class='mdui-row-xs-3 mdui-row-sm-4 mdui-row-md-5 mdui-row-lg-6 mdui-row-xl-7 mdui-grid-list'>\n"); // 这个和下面注释掉的那句是网格样式的

						out.print("<ul class=\"mdui-list\">");

						// 取网页源码
						{
							String source = "", line = "", url = "https://www.qidian.com/"+words[i];
							HttpURLConnection l_connection = (HttpURLConnection) (new URL(url)).openConnection();
							l_connection.connect();
							InputStreamReader isr = new InputStreamReader(l_connection.getInputStream(), "UTF-8");
							BufferedReader l_reader = new BufferedReader(isr);
							while ((line = l_reader.readLine()) != null) source+=line;

							int startPos = source.indexOf("<div id=\"new-book-list\"");
							if (startPos == -1)
								startPos = source.indexOf("<div id=\"update-words-rank\"");
								
							if (startPos == -1)
							{
								out.print("</div>\n<div class='mdui-panel-item-actions'> <button class='mdui-btn mdui-ripple' mdui-panel-item-close>收起</button> <button class='mdui-btn mdui-ripple'>查看更多</button> </div> </div> </div>\n");
								continue;
							}
							int endPos = source.indexOf("<div class=\"right-rank fr\"", startPos);
							if (endPos == -1)
								endPos = source.length();

							String ulPart = source.substring(startPos, endPos);
							String[] liPart = ulPart.split("</li");

							int indexID = 0;
							while (indexID < 9 && indexID < liPart.length) // 每个 li
							{
								String bookID = "", bookUrl = "", bookname = "", bookWriter = "", bookKind = "", imgsrc = "";

								String regEx ="href=\"//book.qidian.com/info/(\\d+)\"";
								Pattern p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
								Matcher m = p.matcher(liPart[indexID]);
								if(m.find()) bookID = m.group(1);
								else bookID = "0000000000";
								//bookUrl = "catalogue.jsp?bookID=" + bookID;
								bookUrl = "sortCount?bookID=" + bookID + "&kind=" + words[i];

								regEx = "alt=\"([^\"].+?)\"";
								p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
								m = p.matcher(liPart[indexID]);
								if(m.find()) bookname = m.group(1);
								else bookname = "知名书籍";

								regEx = "<p>([^/]+)</p>";
								p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
								m = p.matcher(liPart[indexID]);
								if(m.find()) bookWriter = m.group(1);
								else bookWriter = "小编推荐";

								regEx = "src=\"//(qidian.qpic.cn/qdbimg/[^>]+?)\"";
								p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
								m = p.matcher(liPart[indexID]);
								if(m.find()) imgsrc = "http://" + m.group(1);
								else imgsrc = "img/修真聊天群.jpg";

								//out.print("<div class='mdui-col'> <div class='mdui-grid-tile'> <a href='"+bookUrl+"' target='_blank'><img src='"+imgsrc+"'/></a> <div class='mdui-grid-tile-actions'> <div class='mdui-grid-tile-text'> <div class='mdui-grid-tile-title'>"+bookname+"</div> <div class='mdui-grid-tile-subtitle'>"+bookWriter+"</div> </div> <div class='mdui-grid-tile-buttons'> <button class='mdui-btn mdui-btn-icon'><i class='mdui-icon material-icons'>star_border</i></button> </div> </div> </div> </div>\n");
								
								out.print("<a class='mdui-list-item mdui-ripple' href='"+bookUrl+"' target='_blank'><div class='mdui-list-item-avatar'><img src='"+imgsrc+"'/></div><div class='mdui-list-item-content'><div class='mdui-list-item-title'>"+bookname+"</div><div class='mdui-list-item-text mdui-list-item-one-line'>"+bookWriter+"</div></div></a>");

								indexID++;
							}
						}

						out.print("<div class='mdui-panel-item-actions'> <button class='mdui-btn mdui-ripple' mdui-panel-item-close>收起</button> <button class='mdui-btn mdui-ripple' onclick='window.location.href=\"https://www.qidian.com/"+words[i]+"\"'>查看更多</button> </div> </div> </div>\n");
					
					}

				%>

			</div>

		</div>

		


		<!-- 脚本 -->
		<script>
			
		</script>
	<body>
</html>