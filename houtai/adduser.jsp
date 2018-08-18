<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.mysql.jdbc.Driver, java.sql.*" %>

<jsp:useBean id="usero" class="wxy.jsp.novel.UserO" scope="session" />
<jsp:useBean id="sqlM" class="wxy.jsp.mysql.sqlBean" scope="session" />

<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	if (request.getParameter("username") == null && (username == null || username == "")) // 直接进来的
	{
		
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
			response.setHeader("Location", "useradd.html");
			return ;
		}
		else
		{
			sql="INSERT into users (username, password, email, tel) values ('"+username+"', '"+password+"', '"+email+"', '"+tel+"')";
			sqlM.executeU(sql);
		}
	}
%>

<script type="text/javascript">
alert("添加成功！");
window.location.href="useradd.html";
</script>