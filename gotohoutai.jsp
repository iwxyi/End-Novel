<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.mysql.jdbc.Driver, java.sql.*" %>

<jsp:useBean id="usero" class="wxy.jsp.novel.UserO" scope="session" />
<jsp:useBean id="sqlM" class="wxy.jsp.mysql.sqlBean" scope="session" />

<%
	if (usero.getUsername().equals("admin"))
	{
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "houtai/index.html");
	}
%>

<html>

<body>

<script type="text/javascript">
	alert("请使用管理员账号登陆");
</script>
您的当前账号为：<%= usero.getUsername() %>，不允许登录管理员界面
<%
	/*response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "account.jsp");*/
%>

</body>

</html>