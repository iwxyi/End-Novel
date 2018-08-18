<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.regex.*, java.util.*, java.net.*" %>
<%@ page import="com.mysql.jdbc.Driver, java.sql.*" %>
<%@ page import="wxy.jsp.novel.*" %>

<jsp:useBean id="usero" class="wxy.jsp.novel.UserO" scope="session" />
<jsp:useBean id="sqlM" class="wxy.jsp.mysql.sqlBean" scope="session" />

<%
	String bookID = request.getParameter("bookID");
	String username = usero.getUsername();
	// if (usero.getUsername() == null || usero.getPassword() == null) return ;

	if (bookID.equals("") || bookID == null)
	{
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "homepage.jsp");

		return ;
	}

	String line = "", source = "", url = "https://book.qidian.com/info/" + bookID + "#Catalog";
	HttpURLConnection l_connection = (HttpURLConnection) (new URL(url)).openConnection();
	l_connection.connect();
	InputStreamReader isr = new InputStreamReader(l_connection.getInputStream(), "UTF-8");
	BufferedReader l_reader = new BufferedReader(isr);
	while ((line = l_reader.readLine()) != null) source+=line;
%>

<%
	String book_name = "", book_writer = "", book_intro = "", book_img = "";

	String regEx ="<a href=\"//book.qidian.com/info/" + bookID + "\">(.+?)</a>";
	Pattern p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
	Matcher m = p.matcher(source);
	if(m.find()) book_name = m.group(1);
	else book_name = "未获取到";

	regEx ="<a class=\"writer\".+?>(.+?)</a>";
	p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
	m = p.matcher(source);
	if(m.find()) book_writer = m.group(1);
	else book_writer = "未获取到";

	regEx ="<div class=\"book-intro\">\\s+<p>\\s+(.+?)\\s+</p>";
	p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
	m = p.matcher(source);
	if(m.find()) book_intro = m.group(1);
	else book_intro = "未获取到";

	int startPos = source.indexOf("<div class=\"book-img\">");
	int endPos = source.indexOf("</div>", startPos);
	String imgPart = source.substring(startPos, endPos);
	regEx ="(<img src=\")(//qidian.qpic.cn/qdbimg/\\d+/\\d+/\\d+.+?\">)";
	p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
	m = p.matcher(imgPart);
	if(m.find()) book_img = m.group(1) + "https:" + m.group(2);
	else book_img = "未获取到";

	String zan = "0";
	String sql = "SELECT zan from zans where bookID = '" + bookID + "'";
	ResultSet rs = sqlM.executeQuery(sql);
	if (rs != null && rs.next() == true)
	{
		zan = rs.getString(1);
	}
%>

<html>

	<head>
		<meta charset="utf-8" />

		<meta name="viewport" content="width=device-width" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<meta name="theme-color" content="slateblue" />

		<title>终点小说 - 作品详情</title>

		<link rel="stylesheet" href="css/mdui.min.css" />
		<script src="js/mdui.min.js"></script>
		<script src="js/jquery.min.js"></script>
		<script src="js/functions.js"></script>
	</head>

	<body class="mdui-appbar-with-toolbar mdui-drawer-body-left"><!-- mdui-drawer-close -->

		<%@include file="UIframe/UIframe.jsp" %>

		<!--正式内容-->
		<div class="mdui-card" style="left: 3%; width: 94%;">
			<ul class="mdui-list">
				<li class="mdui-list-item mdui-ripple">
					<div class="mdui-list-item-avatar"><%= book_img %></div>
					<div class="mdui-list-item-content">
					<div class="mdui-list-item-title"><%= book_name %> - <%= book_writer %> 著</div>
					<div class="mdui-list-item-text">
						<%= book_intro %>
					</div>
				</li>
				<button class="mdui-btn mdui-color-theme-accent mdui-ripple" onclick='gotoZan("<%= bookID %>", "<%= username %>");'><i class="mdui-icon material-icons">&#xe813;</i><span id="zanCount"><%= zan %>赞</span></button>
				<button class="mdui-btn mdui-color-theme-accent mdui-ripple" onclick='window.location.href="hitnow.jsp"'><i class="mdui-icon material-icons">attach_money</i>打赏</button>

			</ul>
		</div>

		<div class="mdui-card" style="left: 3%; width: 94%;">
			<ul class="mdui-list" style="padding-left: 5%; width: 90%;">
				<%
					String free_url;
					regEx ="\"([^\"]+)\">免费试读";
					p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
					m = p.matcher(source);
					if(m.find()) free_url = "https:" + m.group(1);
					else free_url = "";
				%>
				<li class="mdui-list-item mdui-ripple"><a class="mdui-list-item-content" href="<%= free_url %>">开始阅读</a></li>
				<%
					/*String chapter_url, chapter_info, chapter_name;
					regEx ="<li data-rid=\"\\d+\">\\s*<a href=\"(.+?)\" target=\"_blank\".+?title=\"(.+?)\">(.+?)</a>";
					p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
					m = p.matcher(source);
					int count = 0;
					while (m.find())
					{
						count++;

						out.print("<li class='mdui-list-item mdui-ripple' >"+m.group(1)+"</li>");

						if (count > 100)
						{
							break;
						}
					}

					FileWriter fileWriter=new FileWriter("D:\\tmp.html");
					fileWriter.write(source);
					fileWriter.flush();
					fileWriter.close();*/
					String chapter_url, chapter_info, chapter_name;
					regEx ="<li data-rid=\"\\d+\">\\s*<a href=\"(.+?)\" target=\"_blank\".+?title=\"首发时间：(.+?)\">(.+?)</a>";
					p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
					m = p.matcher(source);
					int count = 0;
					while (m.find())
					{
						count++;
						chapter_url = "http:" + m.group(1);
						chapter_info = m.group(2);
						chapter_name = m.group(3);

						out.print("<li class='mdui-list-item mdui-ripple' ><a class='mdui-list-item-content' href='"+chapter_url+"' target='_blank'>"+chapter_name+"</a><font color='gray'>"+chapter_info+"</font></li>");

						if (count > 100)
						{
							break;
						}
					}

					if (count == 0)
						out.print("<li class='mdui-list-item mdui-ripple' ><a class='mdui-list-item-content'>VIP才能查看全部目录</a></li>");
					else
						out.print("<li class='mdui-list-item mdui-ripple' ><a class='mdui-list-item-content'>展开更多目录</a>"+count+"</li>");
				%>
			</ul>
		</div>
		
		<!-- 脚本 -->
		<script type="text/javascript">
			zan = <%= zan %>;

			function gotoZan(bookID, username)
			{
				username = "123";
				var XHR = null;
				var FD = new FormData();

				if(window.XMLHttpRequest) {
					XHR = new XMLHttpRequest();
				} else if(window.ActiveXObject) {
					XHR = new ActiveXObject("Microsoft.XMLHTTP");
				}

				FD.append("username", username); // 好像并没有什么效果
				FD.append("bookID", bookID);

				XHR.onreadystatechange = function() {
					if(XHR.readyState == 4 && XHR.status == 200) {
						if (XHR.responseText == "")
						{
							mdui.snackbar({
								message: '点赞失败'
							});
						}
						else if (XHR.responseText == "not login")
						{
							mdui.snackbar({
								message: '请先登录'
							});
						}
						else if (XHR.responseText == "can't zan")
						{
							mdui.snackbar({
								message: '您今日的次数用光了，请明天再来'
							});
						}
						else if (XHR.responseText == "can't read zan")
						{
							mdui.snackbar({
								message: '无法读取用户信息'
							});
						}
						else
						{
							mdui.snackbar({
								message: '点赞成功'
								// message: XHR.responseText
							});
							document.getElementById("zanCount").innerHTML = XHR.responseText+"赞";
						}
					}
				}

				XHR.open("POST", "zan?bookID="+bookID+"&username="+username, true);

				XHR.send(FD);
			}
		</script>
		
</html>


<!-- <li data-rid="158"><a href="//vipreader.qidian.com/chapter/1010734492/404373752" target="_blank" data-eid="qd_G55" data-cid="//vipreader.qidian.com/chapter/1010734492/404373752" title="首发时间：2018-04-21 15:30:00 章节字数：3176">第二百六十三章 试验真轮</a><em class="iconfont "></em></li> -->