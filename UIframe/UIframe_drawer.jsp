<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="mdui-drawer" id="left-drawer">
	<ul class="mdui-list" mdui-collapse="{accordion: true}">
		<li class="mdui-collapse-item mdui-collapse-item-open">
			<div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
				<i class="mdui-list-item-icon mdui-icon material-icons">home</i>
				<div class="mdui-list-item-content">终点小说</div>
				<i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
			</div>
			<ul class="mdui-collapse-item-body mdui-list mdui-list-dense">
				<li class="mdui-list-item mdui-ripple" onclick="openMe('homepage.jsp');">网站首页</li>
				<li class="mdui-list-item mdui-ripple" onclick="openMe('announcement.jsp');">网站公告</li>
				<!-- <li class="mdui-list-item mdui-ripple" onclick="openMe('shelf.jsp');">我的书架</li>-->
				<li class="mdui-list-item mdui-ripple" onclick="openMe('account.jsp');">账号管理</li>
			</ul>
		</li>

		<li class="mdui-collapse-item">
			<div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
				<i class="mdui-list-item-icon mdui-icon material-icons">book</i>
				<div class="mdui-list-item-content">作品管理</div>
				<i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
			</div>
			<ul class="mdui-collapse-item-body mdui-list mdui-list-dense">
				<!-- <li class="mdui-list-item mdui-ripple">发表作品</li> -->
				<li class="mdui-list-item mdui-ripple" onclick="openMe('zpgl.jsp');">作品管理</li>
				<li class="mdui-list-item mdui-ripple" onclick="openMe('comment.jsp');">书评管理</li>
				<!-- <li class="mdui-list-item mdui-ripple">订阅打赏</li> -->
				<!-- <li class="mdui-list-item mdui-ripple">分享统计</li> -->
				<li class="mdui-list-item mdui-ripple" onclick="openMe('examine.jsp');">审核结果</li>
				<li class="mdui-list-item mdui-ripple" onclick="openMe('caogao.jsp');">发表作品</li>
			</ul>
		</li>

		<li class="mdui-collapse-item">
			<div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
				<i class="mdui-list-item-icon mdui-icon material-icons">attach_money</i>
				<div class="mdui-list-item-content">财务中心</div>
				<i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
			</div>
			<ul class="mdui-collapse-item-body mdui-list mdui-list-dense">
				<li class="mdui-list-item mdui-ripple" onclick="openMe('money.jsp');">余额查询</li>
				<!-- <li class="mdui-list-item mdui-ripple">订阅记录</li> -->
				<li class="mdui-list-item mdui-ripple" onclick="openMe('hitmoney.jsp');">打赏记录</li>
				<!-- <li class="mdui-list-item mdui-ripple">分享记录</li> -->
			</ul>
		</li>

		<li class="mdui-collapse-item">
			<div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
				<i class="mdui-list-item-icon mdui-icon material-icons">insert_emoticon</i>
				<div class="mdui-list-item-content">网站服务</div>
				<i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
			</div>
			<ul class="mdui-collapse-item-body mdui-list mdui-list-dense">
				<li class="mdui-list-item mdui-ripple" onclick="openMe('gotohoutai.jsp');">后台管理</li>
				<li class="mdui-list-item mdui-ripple" onclick="openMe('letter.html');">联系我们</li>
				<li class="mdui-list-item mdui-ripple" onclick="openMe('about.jsp');">关于网站</li>
				<li class="mdui-list-item mdui-ripple" onclick="openMe('logout.jsp');">退出登录</li>
			</ul>
		</li>

	</ul>

</div>

<!-- 脚本 -->
<script>
	// var fab = new mdui.Fab('#fab'); // 初始化FAB
	var drawer = new mdui.Drawer('#left-draw', {
		swipe: true
	}); // 初始化抽屉导航
	var $$ = mdui.JQ;
</script>