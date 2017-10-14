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
    <title>order</title>
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
				<div class="" style="border-bottom: 1px solid #DEDEDE;width: 100%;height: 50px;">
					<h1 style="font-size: 32px;font-weight: 400;">订单管理</h1>
				</div>

				<div>
					<div>
						<form action="manage/order/search.do?orderNo=${orderNo }" >
							<select>
								<option>按照订单号查询</option>
								<option>按照订单号查询</option>
							</select>
							<input type="text" name="orderNo" value="${orderNo }"/>
							<input type="submit" value="查询" />
						</form>
					</div>
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
								<th>订单号</th>
								<th>收件人</th>
								<th>订单状态</th>
								<th>订单总价</th>
								<th>创建时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${orderList }" var="ol">
								<tr>
									<td>${ol.orderNo }</td>
									<td>${ol.recipients }</td>
									<c:if test="${ol.status ==1}">
										<td>已取消</td>
									</c:if>
									<c:if test="${ol.status ==10}">
										<td>未付款</td>
									</c:if>
									<c:if test="${ol.status ==20}">
										<td>已付款</td>
									</c:if>
									<c:if test="${ol.status ==40}">
										<td>已发货</td>
									</c:if>
									<c:if test="${ol.status ==50}">
										<td>交易成功</td>
									</c:if>
									<c:if test="${ol.status ==60}">
										<td>交易关闭</td>
									</c:if>
									<td>${ol.payment }</td>
									<td>${ol.createTime }</td>
									<td>
										<a href="manage/order/detail.do?orderNo=${ol.orderNo }">查看</a>
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
