<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>login</title>
	</head>
	<link rel="stylesheet" href="css/portalCss/login.css" type="text/css"></link>
	<body>
		<div class="">
			<div class="img_left">
				<img src="img/portalImg/button/login.png"></img>
			</div>
			<div class="login_right">
				<div class="login_box">
					<h1>欢迎登录华为帐号</h1>
					<form action="users/login" method="post" id="loginSubmit">
						<ul>
							<li class="li">
								<input type="text"  placeholder="手机号/邮件地址" name="name" id="name"/>
								<span id="span1">帐号不得少于 2 位数</span>
							</li>
							<li class="li">
								<input type="text"  placeholder="密码" name="password" id="psw" type="password"/>
								<span id="span2">密码不得少于 6 位数</span>
							</li>
							<li class="yzinp">
								<input type="text"  placeholder="不区分大小写" name="" />
								<div class="yangzhengma">
									
								</div>
								<i></i>
							</li>
							<li>
								<input type="checkbox" name="checkbox1" value="checkbox">
								 <span>记住帐号</span>
								<a href="javascript:;">忘记密码？</a>
							</li>
							<li class="li">
								<input type="submit" value="登录"/>
							</li>
						</ul>
					</form>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="js/portalJs/jquery-2.0.3.min.js"></script>
		<script type="text/javascript">
			$(function(){
				var fanghui1 = false;
				var fanghui2 = false;
				$("#name").focus(function(){//得到焦点
					$("#span1").css("visibility","hidden");
					fanghui1 = false;
				});
				var show1 = $("#name").val().length;
				$("#name").blur(function(){//失去焦点
					var show1 = $("#name").val().length;
					if(show1<2){
						$("#span1").css("visibility","visible");
					}else{
						$("#span1").css("visibility","hidden");
						fanghui1 = true;
					}
				});
				$("#psw").focus(function(){//得到焦点
					$("#span2").css("visibility","hidden");
					fanghui2 = false;
				});
				$("#psw").blur(function(){//失去焦点
					var show2 = $("#psw").val().length;
					if(show2<6){
						$("#span2").css("visibility","visible");
					}else{
						$("#span2").css("visibility","hidden");
						fanghui2 = true;
					}
				});
				$("#loginSubmit").on("submit",function(){
					var show1 = $("#name").val().length;
					var show2 = $("#psw").val().length;
					if(fanghui1 == true && fanghui2 == true){
						return true;
					}else if(show1>=2){
						$("#span1").css("visibility","visible");
					}else if(show2>=6){
						$("#span2").css("visibility","visible");
					}else if(show1>=2 && show2>=6){
						return false;
					}
				});
				
			});
		</script>
	</body>
</html>
