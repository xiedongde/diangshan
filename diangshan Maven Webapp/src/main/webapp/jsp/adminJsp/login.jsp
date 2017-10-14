<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<title>login</title>
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/result.css" />
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="layui/css/layui.css" />
		<link rel="stylesheet" href="css/admin.css" />
	</head>

	<body>

		<div class="main_div">

			<div class="login_div">
				<div style="border-bottom: 1px solid #DEDEDE;height: 30px;line-height: 30px;">
					<div style="">请登录</div>
				</div>
				<div>
					<div class="">
						<form action="users/login" method="post">
							<div style="margin:10px 0px 0px 10px;">
								<input type="text" name="name" class="login_input" />
							</div>

							<div style="margin:10px 0px 0px 10px;">
								<input type="password" name="password" class="login_input" />
							</div>

							<div style="margin:10px 0px 0px 10px;">
								<input type="submit" value="登录" class="login_input submint_btn" />
							</div>
						</form>
					</div>

				</div>
			</div>

		</div>

		<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
		<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		<script src="layui/layui.js"></script>

		<script type="text/javascript">
			$(function() {
				var h = $(window).height() / 2 + 150;
			});
		</script>
	</body>

</html>
