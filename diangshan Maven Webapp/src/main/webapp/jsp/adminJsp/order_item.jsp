<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>order_item</title>
<link rel="stylesheet" href="css/adminCss/result.css" />
<link rel="stylesheet" href="css/adminCss/admin.css" />
<link rel="stylesheet" href="layui/css/layui.css" />
<style type="text/css">
ul,li {
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
			欢迎,${users.username }&nbsp;&nbsp;&nbsp; <a href="users/exit">退出</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
	<div style="margin-top: 10px;">
		<!--- -->
		<div class="float_left admin_list_menu" style="width: 13%;">
			<div class="admin_list_li">功能菜单</div>

			<div>
				<div
					style="margin-top: 10px;height: 30px;line-height: 30px;margin-left: 10px;">商品</div>
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
				<div
					style="margin-top: 10px;height: 30px;line-height: 30px;margin-left: 10px;">订单</div>
				<div>
					<div class="two_list_mune">
						<a href="manage/order/search.do" class="two_list_mune_1">订单管理</a>
					</div>
				</div>
			</div>

			<div>
				<div
					style="margin-top: 10px;height: 30px;line-height: 30px;margin-left: 10px;">会员</div>
				<div>
					<div class="two_list_mune">
						<a href="javascript:;" class="two_list_mune_1">会员管理</a>
					</div>
				</div>
			</div>
		</div>

		<div class="float_left admin_right_div"
			style="margin-left: 10px;width: 85%;">
			<div class=""
				style="border-bottom: 1px solid #DEDEDE;width: 100%;height: 50px;">
				<h1 style="font-size: 32px;font-weight: 400;">订单详情</h1>
			</div>

			<div>
				<div class="margin_top_10">
					<div class="float_left order_item_left">订单号：</div>
					<div class="float_left order_item_right">${detail.order_no }
					</div>
					<div class="clear_float"></div>
				</div>

				<div class="margin_top_10">
					<div class="float_left order_item_left">创建时间：</div>
					<div class="float_left order_item_right">
						${detail.create_time }</div>
					<div class="clear_float"></div>
				</div>

				<div class="margin_top_10">
					<div class="float_left order_item_left">收件人：</div>
					<div class="float_left order_item_right">${detail.recipients
						}</div>
					<div class="clear_float"></div>
				</div>

				<div class="margin_top_10">
					<div class="float_left order_item_left">订单状态：</div>
					<div class="float_left order_item_right">
						<c:if test="${detail.status ==1}">
							<span>已取消</span>
						</c:if>
						<c:if test="${detail.status ==10}">
							<span>未付款</span>
						</c:if>
						<c:if test="${detail.status ==20}">
							<span>已付款</span>
						</c:if>
						<c:if test="${detail.status ==40}">
							<span>已发货</span>
						</c:if>
						<c:if test="${detail.status ==50}">
							<span>交易成功</span>
						</c:if>
						<c:if test="${detail.status ==60}">
							<span>交易关闭</span>
						</c:if>
						<c:if test="${detail.status ==20}">
							<a href="manage/order/send_goods.do?orderNo=${detail.order_no }" style="margin-left: 20px;border: 1px solid #DEDEDE;">立即发货</a>
						</c:if>
					</div>
					<div class="clear_float"></div>
				</div>

				<div class="margin_top_10">
					<div class="float_left order_item_left">支付方式：</div>
					<div class="float_left order_item_right">
						<c:if test="${detail.payment_type ==1}">
								在线支付
							</c:if>
					</div>
					<div class="clear_float"></div>
				</div>

				<div class="margin_top_10">
					<div class="float_left order_item_left">订单金额：</div>
					<div class="float_left order_item_right">
						${detail.total_price }</div>
					<div class="clear_float"></div>
				</div>

				<div class="margin_top_10">
					<table class="layui-table">
						<colgroup>
							<col width="150">
							<col width="200">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>商品图片</th>
								<th>商品信息</th>
								<th>单价</th>
								<th>数量</th>
								<th>合计</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${detail.product_image }</td>
								<td>${detail.product_name }</td>
								<td>${detail.payment }</td>
								<td>人生就像是一场修行</td>
								<td>人生就像是一场修行</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>

	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="layui/layui.js"></script>
	<script type="text/javascript">
			if('${msg}'==6){
				alert("发货成功！");
			}
		$(function() {
		
			$(".two_list_mune").on(
					"mouseover",
					function() {
						$(this).addClass("two_list_mune_back").siblings()
								.removeClass("two_list_mune_back");
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
