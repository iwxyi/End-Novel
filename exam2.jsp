<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.mysql.jdbc.Driver, java.sql.*" %>

<jsp:useBean id="usero" class="wxy.jsp.novel.UserO" scope="session" />
<jsp:useBean id="sqlM" class="wxy.jsp.mysql.sqlBean" scope="session" />

<html>

	<head>
		<meta charset="utf-8" />

		<meta name="viewport" content="width=device-width" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<meta name="theme-color" content="slateblue" />

		<title>终点小说-审核结果 </title>

		<link rel="stylesheet" href="css/mdui.min.css" />
		<script src="js/mdui.min.js"></script>
		<script src="js/jquery.min.js"></script>
		<script src="js/functions.js"></script>
		<link type="text/css" rel="stylesheet" href="css/contact.css">
	</head>

	<body class="mdui-appbar-with-toolbar mdui-drawer-body-left">

		<%@include file="UIframe/UIframe.jsp" %>


		<!--正式内容-->
			<div class="mdui-tab mdui-tab-full-width" mdui-tab>
    <a href="examine.jsp" class="mdui-ripple">全部稿件</a>
    <a href="exam1.jsp" class="mdui-ripple">审核中</a>
    <a href="exam2.jsp" class="mdui-ripple mdui-tab-active">已通过</a>
    <a href="exam3.jsp" class="mdui-ripple">未通过</a>
  </div>

<div class="mdui-row-xs-3 mdui-row-sm-4 mdui-row-md-5 mdui-row-lg-6 mdui-row-xl-7 mdui-grid-list">
<%
  String sql = "SELECT bookName, img from novels";
  ResultSet rs = sqlM.executeQuery(sql);
  int index = 0;
  while (rs != null && rs.next() == true)
  {
    index++;
    String bookname = rs.getString(1);
    String img = rs.getString(2);
    if (img == null || img == ""|| img.indexOf("://") < 0)
      img = "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2966343010,1048527137&fm=27&gp=0.jpg";
  %>
   <div class="mdui-col">
        <div class="mdui-grid-tile" title="审核通过">
         <img src="<%= img %>"/>
          <div class="mdui-grid-tile-actions">
            <div class="mdui-grid-tile-text">
              <div class="mdui-grid-tile-title"><%=bookname%></div>
              <div class="mdui-grid-tile-subtitle"><i class="mdui-icon material-icons">grid_on</i>审核通过</div>
            </div>
           </div>
        </div>
    </div>

  <%
  }
%>
</div>
</body>
<!-- 脚	本 -->

</html>