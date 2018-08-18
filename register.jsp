<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.mysql.jdbc.Driver, java.sql.*" %>

<jsp:useBean id="usero" class="wxy.jsp.novel.UserO" scope="session" />
<jsp:useBean id="sqlM" class="wxy.jsp.mysql.sqlBean" scope="session" />

<%
	String username = request.getParameter("username");
	String password = "";
	if (request.getParameter("username") == null && (username == null || username == "")) // 直接进来的
	{
		
	}
	else if (request.getParameter("username_helper") != null)
	{

	}
	else // 点了注册进来的
	{
		password = request.getParameter("password");
		if (password == null) password = "";
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");

		// 安全检查
		if (1 < 0 && (sqlM.SafeCheck(username) == false || sqlM.SafeCheck(password) == false || sqlM.SafeCheck(email) == false || sqlM.SafeCheck(tel) == false))
		{
			%>
				<script type="text/javascript">
					alert("请输入安全的账号密码！");
				</script>
			<%
			/*response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", "register.jsp");
			return ;*/

			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", "balance.jsp");
			return ;
		}
		else
		{
			String sql = "SELECT * from users where username = '" + username + "'";
			ResultSet rs = sqlM.executeQuery(sql);
			if (rs != null && rs.next() == true)
			{
				%>
					<script type="text/javascript">
						alert("用户名已存在");
					</script>
				<%
				if (username == null) username = "";
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", "register.jsp?username_helper=already_exist&username="+username);
				return ;
			}
		}

		// 保存到 javabean
		usero.setUsername(username);
		usero.setPassword(password);
		usero.setEmail(email);
		usero.setTel(tel);

		// 保存到数据库

		String sql="INSERT into users (username, password, email, tel) values ('"+username+"', '"+password+"', '"+email+"', '"+tel+"')";
		sqlM.executeU(sql);

		// 保存到 cookie，3天，用于直接恢复登录
		String username_code = java.net.URLEncoder.encode(username, "UTF-8");
		String password_code = java.net.URLEncoder.encode(password, "UTF-8");
		Cookie username_cookie = new Cookie("username", username_code);
		Cookie password_cookie = new Cookie("password", password_code);
		username_cookie.setMaxAge(60*60*24*3);
		password_cookie.setMaxAge(60*60*24*3);
		response.addCookie(username_cookie);
		response.addCookie(password_cookie);
		

		// 网址重定向
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "welcome.jsp");

		return ;
	}

	if (username == null) username = "";
	if (password == null) password = "";
%>

<html>

	<head>
		<meta charset="utf-8" />

		<meta name="viewport" content="width=device-width" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<meta name="theme-color" content="slateblue" />

		<title>终点小说 - 注册</title>

		<link rel="stylesheet" href="css/mdui.min.css" />
		<script src="js/mdui.min.js"></script>
		<link rel="stylesheet" href="css/register.css" />
		<script src="js/jquery.min.js"></script>
		<script src="js/register.js"></script>
		<script src="js/functions.js"></script>
	</head>

	<body class="mdui-appbar-with-toolbar">

		<%@include file="UIframe/UIframe.jsp" %>

		<!--正式内容-->
		<form action="register.jsp" method="get">
			<div class="mdui-card" style="left:30%;width:40%;min-width: 300px;">
				<div class="mdui-card-media">
				    <img src="img/register_bg.jpg"/>
				    <div class="mdui-card-media-covered">
				      <div class="mdui-card-primary">
				        <div class="mdui-card-primary-title">用户注册</div>
				      </div>
				    </div>
				 </div>

				<div class="mdui-card-actions">

					<div class="mdui-textfield mdui-textfield-floating-label">
						<i class="mdui-icon material-icons">account_circle</i>
						<label class="mdui-textfield-label">User name</label>
						<input id="username" name="username" class="mdui-textfield-input" onblur="checkNames();" type="text" value='<%= username %>' onfocus="document.getElementById('username_helper').innerHTML = '';" />
						<div id="username_helper" class="mdui-textfield-helper"><font color='red'><%= request.getParameter("username_helper") == null ? "" : request.getParameter("username_helper") %></font></div>
					</div>

					<div class="mdui-textfield mdui-textfield-floating-label">
						<i class="mdui-icon material-icons">lock</i>
						<label class="mdui-textfield-label">Password</label>
						<input id="password" name="password" class="mdui-textfield-input" onblur="checkPassword();" type="password" value='<%= password %>' />
						<div id="password_helper" class="mdui-textfield-helper">密码支持数字、字母、下划线</div>
					</div>

					<div class="mdui-textfield mdui-textfield-floating-label">
						<i class="mdui-icon material-icons">lock</i>
						<label class="mdui-textfield-label">Password again</label>
						<input id="password2" class="mdui-textfield-input" onblur="checkPassword2();" onfocus="beforePassword2();" type="password" />
						<div id="password2_helper" class="mdui-textfield-helper"></div>
					</div>

					<div class="mdui-textfield mdui-textfield-floating-label">
						<i class="mdui-icon material-icons">email</i>
						<label class="mdui-textfield-label">Email</label>
						<input id="email" name="email" class="mdui-textfield-input" onblur="checkEmail();" type="email" />
						<div id="email_helper" class="mdui-textfield-helper"></div>
					</div>

					<div class="mdui-textfield mdui-textfield-floating-label">
						<i class="mdui-icon material-icons">phone</i>
						<label class="mdui-textfield-label">Phone number</label>
						<input id="tel" name="tel" class="mdui-textfield-input" type="text" onblur="checkTel();" />
						<div id="tel_helper" class="mdui-textfield-helper"></div>
					</div>

					<div id="drag_container">
						<center>
							<div id="drag"></div>
						</center>
					</div>

					<div class="mdui-textfield mdui-textfield-floating-label">
						<i class="mdui-icon material-icons">textsms</i>
						<label class="mdui-textfield-label">Code</label>
						<input id="code" onblur="checkCode();" class="mdui-textfield-input" type="text" />
						<div id="code_helper" class="mdui-textfield-helper"></div>
					</div>

					<center><input id="submit" class="mdui-btn mdui-ripple" type="submit" /></center>

				</div>
			</div>
		</form>

		<!-- 脚本 -->
		<script>
			$('#drag').drag(); // 滑块条
		</script>

</html>