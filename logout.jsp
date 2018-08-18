<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, java.net.*" %>
<%@ page import="wxy.jsp.novel.*" %>

<jsp:useBean id="usero" class="wxy.jsp.novel.UserO" scope="session" />
<jsp:useBean id="sqlM" class="wxy.jsp.mysql.sqlBean" scope="session" />

<%
	
	usero.setUsername("");
	usero.setPassword("");

	Cookie username_cookie = new Cookie("username", "");
	Cookie password_cookie = new Cookie("password", "");
	username_cookie.setMaxAge(0);
	password_cookie.setMaxAge(0);
	response.addCookie(username_cookie);
	response.addCookie(password_cookie);

	//response.setStatus(response.SC_MOVED_TEMPORARILY);
	//response.setHeader("Location", "homepage.jsp");
%>

<script type="text/javascript">
	alert("退出成功！")
	window.location.href = "homepage.jsp";
</script>