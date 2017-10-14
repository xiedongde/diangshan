<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    <title>index</title>
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/adminCss/result.css" />
		<link rel="stylesheet" href="css/adminCss/style.css" />
		<link rel="stylesheet" href="css/adminCss/admin.css" />
		<style type="text/css">
			ul,
			li {
				clear: both;
			}
		</style>
	</head>

	<body>

		<div class="top_div">
			<div class="float_left">
				<div>HXMall</div>
			</div>
			<div class="float_right top_li">
				欢迎,${users.username }&nbsp;&nbsp;&nbsp;
				<a href="users/exit">退出</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		</div>
		<div style="margin-top: 10px;">
			<!--- -->
			<div class="float_left admin_list_menu">
				<div class="admin_list_li">功能菜单</div>

				<div>
					<div style="margin-top: 10px;height: 30px;line-height: 30px;margin-left: 10px;">商品</div>
					<div>
						<div class="two_list_mune">
							<a href="product/List" class="two_list_mune_1">商品管理</a>
						</div>
						<div class="two_list_mune">
							<a href="manage/category/get_category.do" class="two_list_mune_1">类别管理</a>
						</div>
					</div>
				</div>

				<div>
					<div style="margin-top: 10px;height: 30px;line-height: 30px;margin-left: 10px;">订单</div>
					<div>
						<div class="two_list_mune">
							<a href="manage/order/search.do" class="two_list_mune_1">订单管理</a>
						</div>
					</div>
				</div>

				<div>
					<div style="margin-top: 10px;height: 30px;line-height: 30px;margin-left: 10px;">会员</div>
					<div>
						<div class="two_list_mune">
							<a href="javascript:;" class="two_list_mune_1">会员管理</a>
						</div>
					</div>
				</div>
			</div>
			<div class="float_left admin_right_div" style="margin-left: 10px;">
				<div class="float_left" style="border: 1px solid #DEDEDE;width: 300px;height: 200px;">
					今日待发货订单：100个
				</div>

				<div class="float_left" style="border: 1px solid #DEDEDE;width: 300px;height: 200px;margin-left: 30px;">
					今日退货订单：100个
				</div>

				<div class="clear_float" style="margin-top: 30px;"></div>
				<div class="float_left" style="border: 1px solid #DEDEDE;width: 300px;height: 200px;">
					本月累计订单：100个
				</div>
				
				<div class="float_left" style="border: 1px solid #DEDEDE;width: 300px;height: 200px;margin-left: 30px;">
					本周累计订单：100个
				</div>

			</div>
		</div>

		<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
		<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$(".two_list_mune").on("mouseover", function() {
					$(this).addClass("two_list_mune_back").siblings().removeClass("two_list_mune_back");
				});
			});
			$(function() {
				$(".two_list_mune").on("mouseout", function() {
					$(this).removeClass("two_list_mune_back");
				});
			});
			/*
			 	$(function(){
				$(".two_list_mune").on("click",function(){
					$(this).css({
						"background-color":"#eaeaea"
					}).siblings().css({
						"background-color":"rgb(255,255,255)"
					});
				});
			});
			 */
		</script>
	</body>

</html>
