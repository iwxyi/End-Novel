<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="mdui-appbar mdui-appbar-fixed">
	<div class="mdui-toolbar mdui-color-indigo">
		<a mdui-drawer="{target: '#left-drawer'}" class="mdui-btn mdui-ripple mdui-btn-icon"><i class="mdui-icon material-icons">menu</i></a>

		<div class="mdui-toolbar-spacer"></div>

		<a href="javascript:;" class="mdui-typo-headline">终点小说</a>

		<div class="mdui-toolbar-spacer"></div>
		
		<div class="mdui-textfield mdui-textfield-expandable mdui-float-right" style="max-width: 500px;">
			<button type="submit" class="mdui-textfield-icon mdui-btn mdui-btn-icon" onclick="search();"><i class="mdui-icon material-icons">search</i></button>
			<input class="mdui-textfield-input" id="search" type="text" placeholder="请输入书名或者作者名" style="color: white;" onkeydown="if(event.keyCode==13) search();" />
			<button class="mdui-textfield-close mdui-btn mdui-btn-icon" onclick="searchClose();"><i class="mdui-icon material-icons">close</i></button>
		</div>

		<a mdui-menu="{target: '#menu'}" class="mdui-btn mdui-btn-icon mdui-ripple"><i class="mdui-icon material-icons">more_vert</i></a>

		<!--菜单-->
		<ul class="mdui-menu" id="menu">
			<li class="mdui-menu-item" mdui-dialog="{target: '#aboutDlg'}">
				<a class="mdui-ripple">
					<i class="mdui-menu-item-icon mdui-icon material-icons">info</i>关于本站
				</a>
			</li>
		</ul>
	</div>
</div>

<!--对话框-->
<div class="mdui-dialog" id="aboutDlg">
	<div class="mdui-dialog-title">关于</div>
	<div class="mdui-dialog-content">本项目组成员：<br><br>王鑫益<br>黄家慧<br>蒋阳名<br>蓝兴业<br>顾林伟</div>
	<div class="mdui-dialog-actions">
		<button class="mdui-btn mdui-ripple" mdui-dialog-close>取消</button>
		<button class="mdui-btn mdui-ripple" mdui-dialog-confirm>确定</button>
	</div>
</div>

<script type="text/javascript">
function search()
{
	var val = document.getElementById("search").value;
	if (val === "") return ;
	window.location.href = "./search.jsp?key=" + encodeURI(val, "UTF-8");
}
function searchClose()
{
	document.getElementById("search").value = "";
}
</script>