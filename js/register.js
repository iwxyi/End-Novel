var VERIFY = RndNum(4);

(function($) {
	$.fn.drag = function(options) {
		var x, drag = this,
			isMove = false,
			defaults = {};
		var options = $.extend(defaults, options);
		//添加背景，文字，滑块
		var html = '<div class="drag_bg"></div>' +
			'<div class="drag_text" onselectstart="return false;" unselectable="on">拖动滑块发送短信</div>' +
			'<div class="handler handler_bg"></div>';
		this.append(html);

		var handler = drag.find('.handler');
		var drag_bg = drag.find('.drag_bg');
		var text = drag.find('.drag_text');
		var maxWidth = drag.width() - handler.width(); //能滑动的最大间距

		//鼠标按下时候的x轴的位置
		handler.mousedown(function(e) {
			isMove = true;
			x = e.pageX - parseInt(handler.css('left'), 10);
		});

		//鼠标指针在上下文移动时，移动距离大于0小于最大间距，滑块x轴位置等于鼠标移动距离
		$(document).mousemove(function(e) {
			var _x = e.pageX - x;
			if(isMove) {
				if(_x > 0 && _x <= maxWidth) {
					handler.css({
						'left': _x
					});
					drag_bg.css({
						'width': _x
					});
				} else if(_x > maxWidth) { //鼠标指针移动距离达到最大时清空事件
					dragOk();
				}
			}
		}).mouseup(function(e) {
			isMove = false;
			var _x = e.pageX - x;
			if(_x < maxWidth) { //鼠标松开时，如果没有达到最大距离位置，滑块就返回初始位置
				handler.css({
					'left': 0
				});
				drag_bg.css({
					'width': 0
				});
			}
		});

		//清空事件
		function dragOk() {
			handler.removeClass('handler_bg').addClass('handler_ok_bg');
			text.text('验证短信已经发送');
			drag.css({
				'color': '#fff'
			});
			handler.unbind('mousedown');
			$(document).unbind('mousemove');
			$(document).unbind('mouseup');
			sendCode();
		}
	};

})(jQuery);

function RndNum(n) {
	var rnd = "";
	for(var i = 0; i < n; i++)
		rnd += Math.floor(Math.random() * 10);
	return rnd;
}

function checkName() { // 没必要

	var username = document.getElementById("username").value;

	if(username == "" || username == null) {
		document.getElementById("username_helper").innerHTML = "";
		return false;
	}

	var myreg = /^([a-zA-Z0-9_])+/;
	if(!myreg.test(username)) {
		document.getElementById("username_helper").innerHTML = "<font color='red'>请输入正确的用户名</font>";
	} else {
		document.getElementById("username_helper").innerHTML = "";
	}
}

function checkNames() { // 检查用户名是否已存在
	return -1;
	
	var XHR = null;
	var FD = new FormData();
	var name = document.getElementById("username").value;
	
	if (name == "" || name == null)
	{
		document.getElementById("username").innerHTML = "";
		return false;
	}

	if(window.XMLHttpRequest) {
		XHR = new XMLHttpRequest();
	} else if(window.ActiveXObject) {
		XHR = new ActiveXObject("Microsoft.XMLHTTP");
	}

	FD.append("username", name);

	XHR.onreadystatechange = function() {
		if(XHR.status == 200) {
			if (XHR.responseText.indexOf("<username>" + name + "</username>") > -1)
				document.getElementById("username").innerHTML = "<font color='red'>用户名已存在</font>";
		}
	}

	XHR.open("GET", "", true);

	XHR.send(FD);
}

function checkEmail() {

	var email = document.getElementById("email").value;

	if(email == "" || email == null) {
		document.getElementById("email_helper").innerHTML = "";
		return false;
	}

	var myreg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	if(!myreg.test(email)) {
		document.getElementById("email_helper").innerHTML = "<font color='red'>请输入正确的邮箱</font>";
	} else {
		document.getElementById("email_helper").innerHTML = "";
	}
}

function checkPassword() {

	var password = document.getElementById("password").value;

	if(password == "" || password == null) {
		document.getElementById("password_helper").innerHTML = "";
		return false;
	}

	var myreg = /^([a-zA-Z0-9_])+/;
	if(!myreg.test(password)) {
		document.getElementById("password_helper").innerHTML = "<font color='red'>请输入正确的密码</font>";
	} else {
		document.getElementById("password_helper").innerHTML = "";
	}
}

function beforePassword2() {
	var password = document.getElementById("password").value;
	if(password == "" || password == null) {
		document.getElementById("password").focus();
		document.getElementById("password_helper").innerHTML = "<font color='red'>请先输入密码</font>";
	}
}

function checkPassword2() {

	var password = document.getElementById("password").value;
	var password2 = document.getElementById("password2").value;

	if(password == "" || password == null) {
		document.getElementById("password2_helper").innerHTML = "";
		return false;
	}

	if(password == password2) {
		document.getElementById("password2_helper").innerHTML = "";
	} else {
		document.getElementById("password2_helper").innerHTML = "<font color='red'>两次密码不一致</font>";
	}
}

function checkTel() {

	var tel = document.getElementById("tel").value;

	if(tel == "" || tel == null) {
		document.getElementById("tel_helper").innerHTML = "";
		document.getElementById("drag_container").style.display = "none";
		return false;
	}

	var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
	if(myreg.test(tel)) {
		document.getElementById("drag_container").style.display = "inherit";
		return true;
	} else {
		document.getElementById("tel_helper").innerHTML = "<font color='red'>请输入正确的号码</font>";
		return false;
	}
}

function sendCode() {
	
	var XHR = null;
	var FD = new FormData();
	var tel = document.getElementById("tel").value;

	if(window.XMLHttpRequest) {
		XHR = new XMLHttpRequest();
	} else if(window.ActiveXObject) {
		XHR = new ActiveXObject("Microsoft.XMLHTTP");
	}

	//	FD.append("aimcodes", tel);

	XHR.onreadystatechange = function() {
		if(XHR.status == 200) {
			mdui.snackbar({
				message: '短信发送成功'
			});
		}
	}

	XHR.open("GET", "http://www.lx198.com/sdk/send?accName=13588775890&accPwd=E6DD2B6DDA8E722E4E8E7B3898ABEB61&aimcodes=" + tel + "&content=您好，您的验证码为" + VERIFY + ",该码有效期为2分钟，该码只能使用一次，请勿告知他人！【zafu计算机162】&dataType=string", true);

	XHR.send(FD);
}

function checkCode()
{
	var code = document.getElementById("code").value;

	if(code == "" || code == null) {
		document.getElementById("code_helper").innerHTML = "";
		return false;
	}

	if(code == VERIFY) {
		document.getElementById("code_helper").innerHTML = "";
		document.getElementById("submit").disabled = false;
		return true;
	} else {
		document.getElementById("code_helper").innerHTML = "验证码错误";
		document.getElementById("submit").disabled = true;
		return false;
	}
}

function Register()
{
	var email = document.getElementById("email").value;
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var password2 = document.getElementById("password2").value;
	var tel = document.getElementById("tel").value;
	var code = document.getElementById("code").value;
	
	if (email && username && password && password == password2 && tel && code == VERIFY) {
		alert("注册成功！");
		//register( email, username, password, tel);
		window.location.href="homepage.jsp";
	}
	else {
		alert("您还有未填写的表单！");
	}
}

function register(email, username, password, tel)
{
	var XHR = null;
	var FD = new FormData();
	var tel = document.getElementById("tel").value;

	if(window.XMLHttpRequest) {
		XHR = new XMLHttpRequest();
	} else if(window.ActiveXObject) {
		XHR = new ActiveXObject("Microsoft.XMLHTTP");
	}

	FD.append("email", email);
	FD.append("username", username);
	FD.append("password", password);
	FD.append("tel", tel);

	XHR.onreadystatechange = function() {
		if(XHR.status == 200) {
			mdui.snackbar({
				message: '注册成功'
			});
			window.location.href="homepage.jsp";
		}
	}

	XHR.open("GET", "http://www.lx198.com/sdk/send?accName=13588775890&accPwd=E6DD2B6DDA8E722E4E8E7B3898ABEB61&aimcodes=" + tel + "&content=您好，您的验证码为" + VERIFY + ",该码有效期为2分钟，该码只能使用一次，请勿告知他人！【zafu计算机162】&dataType=string", true);

	XHR.send(FD);
}