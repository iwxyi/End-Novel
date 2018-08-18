<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 

		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/mdui.min.css" />		
		<script src="js/mdui.min.js"></script>
		<script src="js/jquery.min.js"></script>
		<script src="js/functions.js"></script>
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
	</head>
	<body class="mdui-appbar-with-toolbar mdui-drawer-body-left">
	<div class="main">
			<font size=4>
				<form action="hitmoneytext" method="post" class="">
					<div class="text-white mdui-color-indigo">打赏</div>
					<div class="form-group">
					<BR><label for="Inputmoney">打赏金额:</label>
					<input type=text name="money" class="form-control" id="Inputmoney" placeholder="打赏金额" size=4> 
					</div>
					<div class="form-group">
					<BR><label for="Inputnum" >打赏数目:</label>
					<input type=text name="number" class="form-control" id="Inputnum" placeholder="打赏数目" size=4>
					</div>      	
					<input type=submit value="提交" class="mdui-btn mdui-btn-raised mdui-color-indigo mdui-ripple">
		          <%@include file="UIframe/UIframe.jsp" %>
			</form>
	  </font>
	</div>
	</body>
</html>
