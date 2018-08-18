<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mysql.jdbc.Driver, java.sql.*" %>

<jsp:useBean id="usero" class="wxy.jsp.novel.UserO" scope="session" />
<jsp:useBean id="sqlM" class="wxy.jsp.mysql.sqlBean" scope="session" />
<jsp:useBean id="digitBean" class="myservlet.control.hitmoneybean" scope="session"/>

<!DOCTYPE html>
<html lang="en" class="no-js">
 
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 

		<link rel="stylesheet" href="css/mdui.min.css" />
		<script src="js/mdui.min.js"></script>
		<script src="js/jquery.min.js"></script>
		<script src="js/functions.js"></script>
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
	</head>
	<body class="mdui-appbar-with-toolbar">
		
	<div class="main">	
			<div class="mdui-row">
				<div class="mdui-row">
					<h2 class="mdui-col-xs-6 mdui-text-left ">打赏:</h2>
				</div>
			
				<div class="mdui-row mdui-table-fluid">
					<table class="mdui-table">
						<thead>
						<tr>
							<th class="mdui-text-center">最近打赏金额</th>
							<th class="mdui-text-center">打赏数量</th>
							<th class="mdui-text-center">打赏总金额</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td class="mdui-text-center"><jsp:getProperty name="digitBean" property="latestmoney"/></td>
							<td class="mdui-text-center"><jsp:getProperty name="digitBean" property="moneynum"/></td>
							<td class="mdui-text-center"><jsp:getProperty name="digitBean" property="allmoney"/></td>
						</tr>
						</tbody>
					</table>
				</div>


			<div class="mdui-row">			
				<h2 class="mdui-col-xs-6 mdui-text-left">流水记录:</h2>
			</div>
			
			<div class="mdui-appbar">			
				<div class="mdui-tab mdui-color-indigo mdui-tab-full-width" mdui-tab>
					<a id = "tab-1" href="hitmoney.jsp?month=1" class="mdui-ripple mdui-text-color-white">1月</a>
					<a id = "tab-2" href="hitmoney.jsp?month=2" class="mdui-ripple mdui-text-color-white">2月</a>
					<a id = "tab-3" href="hitmoney.jsp?month=3" class="mdui-ripple mdui-text-color-white">3月</a>
					<a id = "tab-4" href="hitmoney.jsp?month=4" class="mdui-ripple mdui-text-color-white">4月</a>
					<a id = "tab-5" href="hitmoney.jsp?month=5" class="mdui-ripple mdui-text-color-white">5月</a>
					<a id = "tab-6" href="hitmoney.jsp?month=6" class="mdui-ripple mdui-text-color-white">6月</a>
					<a id = "tab-7" href="hitmoney.jsp?month=7" class="mdui-ripple mdui-text-color-white">7月</a>
					<a id = "tab-8" href="hitmoney.jsp?month=8" class="mdui-ripple mdui-text-color-white">8月</a>
					<a id = "tab-9" href="hitmoney.jsp?month=9" class="mdui-ripple mdui-text-color-white">9月</a>
					<a id = "tab-10" href="hitmoney.jsp?month=10" class="mdui-ripple mdui-text-color-white">10月</a>
					<a id = "tab-11" href="hitmoney.jsp?month=11" class="mdui-ripple mdui-text-color-white">11月</a>
					<a id = "tab-12" href="hitmoney.jsp?month=12" class="mdui-ripple mdui-text-color-white">12月</a>				
				</div>			
			</div>

			<div class="mdui-row mdui-table-fluid">


				<table class="mdui-table">
					<thead>
					<tr>
						<th class="mdui-text-center">序号</th>
						<th class="mdui-text-center">书籍ID</th>
						<th class="mdui-text-center">支出</th>
						<th class="mdui-text-center">收入</th>
					</tr>
					</thead>
					<tbody>
						<%
							String month = request.getParameter("month");
							if (month == null) month = "1";
							String sql = "create view v_hit as select * from hitmoney";
							sqlM.executeUpdate(sql);
							sql = "create proc @m varchar(255) as select * from v_hit";
							sqlM.executeUpdate(sql);
							sql = "SELECT bookID, money from v_hit where month = '" + month + "'";
							ResultSet rs = sqlM.executeQuery(sql);
							int index = 0;
							while (rs != null && rs.next() == true)
							{
								index++;
								String bookID = rs.getString(1);
								String money = rs.getString(2);
							%>
								<tr>
									<td class="mdui-text-center"><%= index %></td>
									<td class="mdui-text-center"><%= bookID %></td>
									<td class="mdui-text-center"><%= money %></td>
									<td class="mdui-text-center">0</td>
								</tr>
							<%
							}
						%>
					</tbody>
				</table>

			</div>			
			
	</div>

	<script type="text/javascript">
		document.getElementById("left-drawer").className += " mdui-drawer-close";
		document.getElementById("tab-<%= month %>").className += " mdui-tab-active";
	</script>
</body>
</html>
