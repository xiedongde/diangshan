<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>register</title>
		<link rel="stylesheet" href="css/portalCss/register.css" type="text/css"></link>
	</head>

	<body>
		<div class="header">
			<div class="header_login float_left">
				<img src="img/portalImg/button/logo2.png"></img>
			</div>
			<div class="header_text float_left">
				<b class="float_left">|&nbsp;&nbsp;华图商城</b>
			</div>
		</div>
		<div class="main">
			<div class="main_box">
				<h1>用户注册</h1>
				<form name="myform" method="post" action="__URL__/register">
					<ul>
						<li>
							<span>用户名：</span>
							<input type="text" name="name" value="" id="name" />
						</li>
						<li>
							<span>密码：</span>
							<input type="password" value="" id="pass" />
						</li>
						<li>
							<span>确认密码：</span>
							<input type="password" name="password" value="" id="npass" />
						</li>
						<li>
							<span>手机号：</span>
							<input type="text" name="phone" value="" id="phone" />
						</li>
					</ul>
					<div class="lastli">
						<input type="submit" name="" value="用户注册" id="register" />
						<span></span>
						<input type="button" name="" value="返回" id="fanhui" />
					</div>
				</form>
			</div>
		</div>
		<script type="text/javascript" src="js/portalJs/jquery-2.0.3.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$('#register').click(function() {
					var name = $('#name').val();
					var pass = $('#pass').val();
					var npass = $('#npass').val();
					var phone = $('#phone').val();
					if(name == '') {
						alert('用户名不能为空');
						return false;
					} else if(pass == '') {
						alert('密码不能为空。');
						return false;
					} else if(phone == '') {
						alert('手机号码不能为空');
						return false;
					} else if(pass != npass) {
						alert('两次密码不一致');
						return false;
					} else if(phone != '') {
						var reg = /^1[3458]\d{9}$/;
						if(!reg.test(phone)) {
							alert('手机号码格式不正确');
							return false;
						}
					} else {
						$('form').submit();
					}
				});
				//返回登录
				$('#fanhui').click(function() {
					window.location="jsp/portalJsp/userLogin.jsp"; 
				});
			});
		</script>
	</body>

</html>
