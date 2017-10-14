<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>category</title>
		<link rel="stylesheet" href="css/adminCss/result.css" />
		<link rel="stylesheet" href="css/adminCss/admin.css" />
		<link rel="stylesheet" href="layui/css/layui.css" />
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
			<div class="float_left admin_list_menu" style="width: 13%;">
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

			<div class="float_left admin_right_div" style="margin-left: 10px;width: 85%;">
				<div>
					<div class="float_left" style="">
						<h3 style="font-size: 32px;">类别管理</h3>
					</div>
					<a href="adminJsp/category_add.jsp"  class="float_right admin_product_btn" style="margin-top: 20px;">
						添加类别
					</a>
					<div>
						<table class="layui-table">
							<colgroup>
								<col width="150">
								<col width="200">
								<col>
							</colgroup>
							<thead>
								<tr>
									<th>类别ID</th>
									<th>类别名称</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${category }" var="c">
									<tr>
										<td>${c.id }</td>
										<td>${c.name }</td>
										<td>
											<a href="adminJsp/category_add.jsp">修改名称</a>
											&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;
											<a href="manage/category/get_deep_category.do">查看子类别</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
		<script src="layui/layui.js"></script>
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
