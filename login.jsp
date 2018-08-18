<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.mysql.jdbc.Driver, java.sql.*" %>

<jsp:useBean id="usero" class="wxy.jsp.novel.UserO" scope="session" />
<jsp:useBean id="sqlM" class="wxy.jsp.mysql.sqlBean" scope="session" />

<%
	String username = request.getParameter("username");
	String password = null;
	Cookie cookie = null;
	Cookie[] cookies = null;
	String MSG = "";
	if (username == null || username.equals("")) // 直接进来的
	{
		// 读取 cookie
		cookies = request.getCookies();
		if (cookies != null)
		{
			for (int i = 0; i < cookies.length; i++)
			{
				cookie = cookies[i];
				
				if (cookie.getName().equals("username"))
				{
					username = java.net.URLDecoder.decode(cookie.getValue(), "utf-8");
				}
				else if (cookie.getName().equals("password"))
				{
					password = java.net.URLDecoder.decode(cookie.getValue(), "utf-8");
				}
			}
		}
		if (username == null) username = "";
		if (password == null) password = "";

		if (username != null && password != null && !username.equals("") && !password.equals("")) // 带参数
		{
			if (sqlM.SafeCheck(username) == false || sqlM.SafeCheck(password) == false)
			{
				MSG = "alert('非法账号/密码输入!');";
			}
			else
			{
				// 搜索数据库
				String sql = "SELECT * from users where username = '" + username + "' and password = '" + password + "'";
				ResultSet rs = sqlM.executeQuery(sql);
				if (rs != null && rs.next() == true)
				{
					usero.setUsername(username);
					usero.setPassword(password);

					String username_code = java.net.URLEncoder.encode(username, "UTF-8");
					String password_code = java.net.URLEncoder.encode(password, "UTF-8");
					Cookie username_cookie = new Cookie("username", username_code);
					Cookie password_cookie = new Cookie("password", password_code);
					username_cookie.setMaxAge(60*60*24*3);
					password_cookie.setMaxAge(60*60*24*3);
					response.addCookie(username_cookie);
					response.addCookie(password_cookie);

					response.setStatus(response.SC_MOVED_TEMPORARILY);
					response.setHeader("Location", "account.jsp");

					return ;
				}
			}

			
		}
	}
	else // 带参数，表示要进行登录
	{
		password = request.getParameter("password");
		
		if (sqlM.SafeCheck(username) == false || sqlM.SafeCheck(password) == false)
		{
			MSG = "alert('非法账号/密码输入');";
		}
		else
		{
			// 搜索数据库
			String sql = "SELECT username from users where username = '" + username + "' and password = '" + password + "'";
			ResultSet rs = sqlM.executeQuery(sql);
			if (rs != null && rs.next() == true && username.equals(rs.getString(1))) // 好像数据库结果的下标是从 1 开始的
			{
				usero.setUsername(username);
				usero.setPassword(password);

				String username_code = java.net.URLEncoder.encode(username, "UTF-8");
				String password_code = java.net.URLEncoder.encode(password, "UTF-8");
				Cookie username_cookie = new Cookie("username", username_code);
				Cookie password_cookie = new Cookie("password", password_code);
				username_cookie.setMaxAge(60*60*24*3);
				password_cookie.setMaxAge(60*60*24*3);
				response.addCookie(username_cookie);
				response.addCookie(password_cookie);

				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", "welcome.jsp");

				return ;
			}
			else
			{
				MSG = "alert('账号或者密码出错');";
			}
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

		<title>终点小说 - 登陆</title>

		<link rel="stylesheet" href="css/mdui.min.css" />
		<script src="js/mdui.min.js"></script>
		<script src="js/functions.js"></script>
		<script src="js/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/login.css">
		<link rel="stylesheet" href="css/MewBg.css">
	</head>

	<body class="mdui-appbar-with-toolbar">

		<!-- 梦幻气泡背景 -->
		<canvas id="c1"></canvas>
		<canvas id="c2"></canvas>
		<script src="js/MewBg.js"></script>

		<!-- < % @include file="UIframe/UIframe.jsp" %> -->

		<!-- 正式内容 -->

		<div class="wrapper">
			<div class="container">
				<h1>Welcome</h1>
				<%
					cookies = request.getCookies();
					if (cookies != null)
					{
						for (int i = 0; i < cookies.length; i++)
						{
							cookie = cookies[i];
							
							if (username == null && cookie.getName().equals("username"))
							{
								username = java.net.URLDecoder.decode(cookie.getValue(), "utf-8");
							}
							else if (password == null && cookie.getName().equals("password"))
							{
								password = java.net.URLDecoder.decode(cookie.getValue(), "utf-8");
							}
						}
					}
				%>
				<form class="form" action="login.jsp" method="post">
					<input type="text" name="username" placeholder="Username" value="<%= username %>">
					<input type="password" name="password" placeholder="Password"  value="<%= password %>">
					<button type="submit" id="login-button">Login</button>
					<div><a href='register.jsp'>register</a></div>
					<!-- <input type="submit" id="login-button" /> -->
				</form>
			</div>
		</div>

		<!-- 脚本 -->
		<script>
		<%= MSG %> //弹出消息
		$('#login-button').click(function (event) {
		    // event.preventDefault();
		    $('form').fadeOut(500);
		    $('.wrapper').addClass('form-success');
		});
		</script>


</html>