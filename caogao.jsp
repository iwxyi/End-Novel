<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.mysql.jdbc.Driver, java.sql.*" %>
<%
String url="jdbc:mysql://localhost/novel?user=root&password=root";
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn=DriverManager.getConnection(url);
Statement stmt = conn.createStatement();%>
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

		<form action="caogao2.jsp">
 <div class="mdui-textfield mdui-textfield-floating-label">
    <label class="mdui-textfield-label">书籍ID</label>
    <textarea class="mdui-textfield-input" name="bookID"></textarea>
    <%

	
	%>
  </div>

 <div class="mdui-textfield mdui-textfield-floating-label">
    <label class="mdui-textfield-label">书籍名字</label>
    <textarea class="mdui-textfield-input" name="bookName"></textarea>
    <%

	
	%>
  </div>

  <div class="mdui-textfield mdui-textfield-floating-label">
    <label class="mdui-textfield-label">作者</label>
    <textarea class="mdui-textfield-input" name="bookWriter"></textarea>
    <%

	
	%>
  </div>

  <div class="mdui-textfield mdui-textfield-floating-label">
    <label class="mdui-textfield-label">简介</label>
    <textarea class="mdui-textfield-input" name="bookInfo"></textarea>
    <%

	
	%>
  </div>

    <div class="mdui-textfield mdui-textfield-floating-label">
    <label class="mdui-textfield-label">封面</label>
    <textarea class="mdui-textfield-input" name="img"></textarea>
    <%
    %>
  </div>

  <input type=submit value="提交" class="mdui-btn mdui-btn-raised mdui-color-indigo mdui-ripple" >

</form>
</div>
		
		


		<!-- 脚本 -->
		<script>
			
		</script>

</html>
