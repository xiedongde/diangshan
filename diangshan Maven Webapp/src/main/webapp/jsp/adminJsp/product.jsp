<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<title>所有商品prodct</title>
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
							<a href="product/List.do" class="two_list_mune_1">商品管理</a>
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
						<h5>商品管理</h5>
					</div>
					<a href="manage/category/get_deep_category.do" class="float_right admin_product_btn" style="margin-top: 20px;">
						添加商品
					</a>
				</div>
				<div class="clear_float">
					<form class="" action="product/List.do?productName=${productName }">
						<div class="form-item float_left">
							<div class="input-block">
								<select name="city">
									<option value="0">商品名称查询</option>
									<option value="4">商品ID查询</option>
								</select>
							</div>
						</div>

						<div class="input-block float_left">
							<input type="text" name="productName" value="${productName }"/>
						</div>

						<div class="form-item float_left">
							<div class="input-block">
								<button class="btn" lay-submit lay-filter="formDemo">查询</button>
							</div>
						</div>
						<div class="clear_float"></div>
					</form>
				</div>

				<div>
					<table class="layui-table">
						<colgroup>
							<col width="150">
							<col width="200">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>ID</th>
								<th>产品名</th>
								<th>信息</th>
								<th>价格</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${productList }" var="p">
								<tr>
									<td>${p.id }</td>
									<td>${p.name }</td>
									<td>${p.subtitle }</td>
									<td>${p.price }</td>
									<c:if test="${p.status ==1}">
										<td>在售</td>
									</c:if>
									<c:if test="${p.status ==2}">
										<td>下架</td>
									</c:if>
									<c:if test="${p.status ==3}">
										<td>删除</td>
									</c:if>
									<td>
										<a href="product/detail.do?id=${p.id}">详情</a>
										&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;
										<a href="jsp/add_product.jsp">编辑</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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
