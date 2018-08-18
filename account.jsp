<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, java.net.*" %>
<%@ page import="wxy.jsp.novel.*" %>

<jsp:useBean id="usero" class="wxy.jsp.novel.UserO" scope="session" />
<jsp:useBean id="sqlM" class="wxy.jsp.mysql.sqlBean" scope="session" />

<%
	String username = usero.getUsername();
	if (username == null || username.equals(""))
	{
		// 转到登录
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "login.jsp");
		
		return ;
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

		<title>终点小说 - 用户信息</title>

		<link rel="stylesheet" href="css/mdui.min.css" />
		<script src="js/mdui.min.js"></script>
		<script src="js/functions.js"></script>
		<link rel="stylesheet" type="text/css" href="css/account.css">
	</head>

	<body class="mdui-appbar-with-toolbar">

		<%@include file="UIframe/UIframe.jsp" %>


		<!--正式内容-->
		<aside class="profile-card">
		    <header>
		        <!-- here’s the avatar -->
		        <a href="homepage.jsp">
		            <img src="img/account_avatar.svg" />
		        </a>
		        <!-- the username -->
		        <h1><%= username %></h1>
		        <h2>终点读者</h2>
		    </header>
		    <div class="profile-bio">
		        <p>Even when everything is perfect, you can always make it better. Break barriers in your head, create something crazy and don't forget Code is Poetry...</p>
		    </div>
		    <!-- some social links to show off -->
		    <ul class="profile-social-links">
		        <li>
		            <a href="#">
		                <svg viewBox="0 0 24 24">
		                    <path fill="#3b5998" d="M17,2V2H17V6H15C14.31,6 14,6.81 14,7.5V10H14L17,10V14H14V22H10V14H7V10H10V6A4,4 0 0,1 14,2H17Z" />
		                </svg>
		            </a>
		        </li>
		        <li>
		            <a href="#">
		                <svg viewBox="0 0 24 24">
		                    <path fill="#82B541" d="M18.334,1.909c-0.604-0.327-2.313-0.125-4.375,0.503c-3.621,2.464-6.664,6.11-6.89,11.971c-0.05,0.148-0.402-0.025-0.478-0.053c-0.981-1.859-1.358-3.846-0.554-6.688C6.189,7.39,5.686,7.089,5.611,7.165C5.435,7.34,4.681,8.145,4.178,9c-2.464,4.249-0.855,9.733,3.445,12.122c4.299,2.389,9.733,0.855,12.12-3.445C22.533,12.695,19.969,2.814,18.334,1.909z"/>
		                </svg>
		            </a>
		        </li>
		        <li>
		            <a href="#">
		                <svg viewBox="0 0 24 24">
		                    <path fill="#000000" d="M19.45,13.29L17.5,12L19.45,10.71M12.77,18.78V15.17L16.13,12.93L18.83,14.74M12,13.83L9.26,12L12,10.17L14.74,12M11.23,18.78L5.17,14.74L7.87,12.93L11.23,15.17M4.55,10.71L6.5,12L4.55,13.29M11.23,5.22V8.83L7.87,11.07L5.17,9.26M12.77,5.22L18.83,9.26L16.13,11.07L12.77,8.83M21,9.16C21,9.15 21,9.13 21,9.12C21,9.1 21,9.08 20.97,9.06C20.97,9.05 20.97,9.03 20.96,9C20.96,9 20.95,9 20.94,8.96C20.94,8.95 20.93,8.94 20.92,8.93C20.92,8.91 20.91,8.89 20.9,8.88C20.89,8.86 20.88,8.85 20.88,8.84C20.87,8.82 20.85,8.81 20.84,8.79C20.83,8.78 20.83,8.77 20.82,8.76A0.04,0.04 0 0,0 20.78,8.72C20.77,8.71 20.76,8.7 20.75,8.69C20.73,8.67 20.72,8.66 20.7,8.65C20.69,8.64 20.68,8.63 20.67,8.62C20.66,8.62 20.66,8.62 20.66,8.61L12.43,3.13C12.17,2.96 11.83,2.96 11.57,3.13L3.34,8.61C3.34,8.62 3.34,8.62 3.33,8.62C3.32,8.63 3.31,8.64 3.3,8.65C3.28,8.66 3.27,8.67 3.25,8.69C3.24,8.7 3.23,8.71 3.22,8.72C3.21,8.73 3.2,8.74 3.18,8.76C3.17,8.77 3.17,8.78 3.16,8.79C3.15,8.81 3.13,8.82 3.12,8.84C3.12,8.85 3.11,8.86 3.1,8.88C3.09,8.89 3.08,8.91 3.08,8.93C3.07,8.94 3.06,8.95 3.06,8.96C3.05,9 3.05,9 3.04,9C3.03,9.03 3.03,9.05 3.03,9.06C3,9.08 3,9.1 3,9.12C3,9.13 3,9.15 3,9.16C3,9.19 3,9.22 3,9.26V14.74C3,14.78 3,14.81 3,14.84C3,14.85 3,14.87 3,14.88C3,14.9 3,14.92 3.03,14.94C3.03,14.95 3.03,14.97 3.04,15C3.05,15 3.05,15 3.06,15.04C3.06,15.05 3.07,15.06 3.08,15.07C3.08,15.09 3.09,15.11 3.1,15.12C3.11,15.14 3.12,15.15 3.12,15.16C3.13,15.18 3.15,15.19 3.16,15.21C3.17,15.22 3.17,15.23 3.18,15.24C3.2,15.25 3.21,15.27 3.22,15.28C3.23,15.29 3.24,15.3 3.25,15.31C3.27,15.33 3.28,15.34 3.3,15.35C3.31,15.36 3.32,15.37 3.33,15.38C3.34,15.38 3.34,15.38 3.34,15.39L11.57,20.87C11.7,20.96 11.85,21 12,21C12.15,21 12.3,20.96 12.43,20.87L20.66,15.39C20.66,15.38 20.66,15.38 20.67,15.38C20.68,15.37 20.69,15.36 20.7,15.35C20.72,15.34 20.73,15.33 20.75,15.31C20.76,15.3 20.77,15.29 20.78,15.28C20.79,15.27 20.8,15.25 20.82,15.24C20.83,15.23 20.83,15.22 20.84,15.21C20.85,15.19 20.87,15.18 20.88,15.16C20.88,15.15 20.89,15.14 20.9,15.12C20.91,15.11 20.92,15.09 20.92,15.07C20.93,15.06 20.94,15.05 20.94,15.04C20.95,15 20.96,15 20.96,15C20.97,14.97 20.97,14.95 20.97,14.94C21,14.92 21,14.9 21,14.88C21,14.87 21,14.85 21,14.84C21,14.81 21,14.78 21,14.74V9.26C21,9.22 21,9.19 21,9.16Z" />
		                </svg>
		            </a>
		        </li>
		    </ul>
		</aside>

		<!-- 脚本 -->
		<script>
			$('#drag').drag(); // 滑块条
		</script>

</html>