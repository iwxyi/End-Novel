<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.regex.*, java.util.*, java.net.*" %>
<%@ page import="wxy.jsp.novel.*" %>

<jsp:useBean id="usero" class="wxy.jsp.novel.UserO" scope="session" />
<jsp:useBean id="sqlM" class="wxy.jsp.mysql.sqlBean" scope="session" />

<%
	String key = new String(request.getParameter("key").getBytes("iso8859_1"),"UTF-8");
	String maxPageS;
	String booknamePat; // 有没有找到结果的 pattern不一样
	int maxPage = 1, dotPos;
	if (key == "" || key == null)
	{
		booknamePat = "\\d+\">([^<>]+?)</a>";
	}
	else
	{
		//key = java.net.URLDecoder.decode(key, "UTF-8");
		key = java.net.URLEncoder.encode(key, "UTF-8");
		booknamePat = "data-algrid=\"0.0.0\">(.+?)</a>";

		String source = "", line = "", url = "https://www.qidian.com/search?kw="+key;
		HttpURLConnection l_connection = (HttpURLConnection) (new URL(url)).openConnection();
		l_connection.connect();
		InputStreamReader isr = new InputStreamReader(l_connection.getInputStream(), "UTF-8");
		BufferedReader l_reader = new BufferedReader(isr);
		while ((line = l_reader.readLine()) != null) source+=line;

		/*FileWriter fileWriter=new FileWriter("D:\\tmp.txt");
		fileWriter.write(source);
		fileWriter.flush();
		fileWriter.close();*/

		if (source.indexOf("没有输入有效关键词") > 0)
		{
			booknamePat = "\\d+\">([^<>]+?)</a>";
		}
		else
		{
			// 最大页码筛选
			String regEx = "data-pageMax=\"(\\d+)\"";
			Pattern p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
			Matcher m = p.matcher(source);
			if(m.find()) maxPageS = m.group(1);
			else maxPageS = "1";
			maxPage = Integer.parseInt(maxPageS);
			if (maxPage < 1) maxPage = 1;
		}

		
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

		<title>终点小说 - 搜索</title>

		<link rel="stylesheet" href="css/mdui.min.css" />
		<script src="js/mdui.min.js"></script>
		<script src="js/functions.js"></script>

		<style type="text/css">
			.red-kw {
				color:red;
			}
		</style>
	</head>

	<body class="mdui-appbar-with-toolbar mdui-drawer-body-left">

		<%@include file="UIframe/UIframe.jsp" %>


		<!--正式内容-->
		<div class="mdui-card" style="left: 5%; width: 90%;">
			<div class="mdui-row-xs-3 mdui-row-sm-4 mdui-row-md-5 mdui-row-lg-6 mdui-row-xl-7 mdui-grid-list">
				
				<%
					for (int i = 1; i < 10 && i <= maxPage; i++)
					{
						// ==== 获取每一页的源码 ====
						String source = "", line = "", url = "https://www.qidian.com/search?kw="+key;
						if (i > 1) url = url + "&page=" + i;
						HttpURLConnection l_connection = (HttpURLConnection) (new URL(url)).openConnection();
						l_connection.connect();
						InputStreamReader isr = new InputStreamReader(l_connection.getInputStream(), "UTF-8");
						BufferedReader l_reader = new BufferedReader(isr);
						while ((line = l_reader.readLine()) != null) source+=line;

						// ==== 加载每一页 ====
						int startPos = source.indexOf("<div id=\"result-list\"");
						int endPos = source.indexOf("<div class=\"page-box cf\"", startPos);
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
							bookUrl = "http://book.qidian.com/info/" + bookID;

							regEx = booknamePat;
							p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
							m = p.matcher(liPart[indexID]);
							if(m.find()) bookname = m.group(1);
							else bookname = "未获取到";

							regEx = ">([^<>]{1,10})</a>\\s*<em>";
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

					}

				%>


			</div>
		</div>

		<!-- 脚本 -->
	</body>
</html>