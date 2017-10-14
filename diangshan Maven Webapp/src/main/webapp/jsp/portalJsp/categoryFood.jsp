<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<title>categoryFood</title>
<link rel="stylesheet" href="css/portalCss/style.css" type="text/css"></link>
<link rel="stylesheet" href="css/portalCss/category.css" type="text/css"></link>
</head>

<body>
	<c:if test="${empty users }">
			<jsp:forward page="userLogin.jsp"></jsp:forward>
	</c:if>
	<div class="header">
		<div class="header_left float_left">
			<ul style="margin-left: 20px;">
				<li><a href="javascript:;">华为官网</a></li>
				<li class="li">|</li>
				<li><a href="javascript:;">华为官网</a></li>
				<li class="li">|</li>
				<li><a href="javascript:;">华为官网</a></li>
				<li class="li">|</li>
				<li><a href="javascript:;">华为官网</a></li>
				<li class="li">|</li>
				<li><a href="javascript:;">华为官网</a></li>
			</ul>
		</div>
		<div class="header_right float_right">
			<ul style="margin-right: 20px;">
				<c:if test="${users ==null }">
					<li><a class="li1" href="jsp/portalJsp/userLogin.jsp">登录</a>
					</li>
					<li><a class="li1" href="jsp/portalJsp/register.jsp">注册</a>
					</li>
				</c:if>
				<c:if test="${users.role==1 }">
					<li><span>欢迎,</span> <a class="li1" href="javascript:;">${users.username }</a></li>
					<li><a class="li1" href="users/exit">退出</a></li>
				</c:if>
				<li class="li">|</li>
				<li><a href="javascript:;">华为官网</a></li>
				<li class="li">|</li>
				<li><a href="cart/cartList">购物车</a></li>
				<li class="li">|</li>
				<li><a href="javascript:;">华为官网</a></li>
			</ul>
		</div>
	</div>
	<div class="header_seek">
		<div class="logo float_left">
			<a href="javascript:;"><img src="img/portalImg/button/logo.png" />
			</a>
		</div>
		<div class="seek float_left">
			<div class="seek_box">
				<form action="product/likeName">
					<input class="seek_text float_left" type="text" name="likeName" value="${likeName }"
						placeholder="请输入商品关键字" />
					<button class="seek_submit float_right" type="submit"></button>
				</form>
			</div>
		</div>
		<div class="shopping_cart float_right">
			<div class="shoppingcart float_left">
				<ul>
					<li class="li1">
						<div class="li1_a">
							<a class="float_left" href="javascript:;">我的商城</a> <i class="i"></i>
						</div>
						<div class="shopping_box">
							<c:if test="${users.role==1 }">
							<div class="shopping_box_1">
								<span style="margin-left: -20px;">你好，&nbsp;</span> <a
									href="jsp/portalJsp/userLogin.jsp">${users.username }</a> <span>|</span> <a
									href="users/exit">退出</a>
							</div>
							</c:if>
							<c:if test="${users ==null }">
							<div class="shopping_box_1">
								<span style="margin-left: -20px;">你好，请&nbsp;</span> <a
									href="jsp/portalJsp/userLogin.jsp">登录</a> <span>|</span> <a
									href="jsp/portalJsp/register.jsp">注册</a>
							</div>
							</c:if>
							<ul>
								<li><a href="cart/cartList">我的订单</a> <span>|</span> <a
									href="javascript:;">待支付</a></li>
								<li><a href="javascript:;">待评论</a> <span>|</span> <a
									href="javascript:;">优惠券</a></li>
								<li><a href="javascript:;">站内信</a> <span>|</span> <a
									href="javascript:;"></a></li>
							</ul>
						</div></li>
					<li class="li">|</li>
					<li class="li2">
						<div class="li2_div1">
							<a class="float_left" href="cart/cartList">我的购物车</a>
							<i class="i"></i>
						</div>
						<div class="li2_div2 clear_both">
							<input id="cart" value="${cart }"/>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="nva">
		<div class="nva_left float_left" >
			<span>全部商品</span> <i class="i"></i>
			<div class="nva_box">
				<ul class="nva_box_ul">
					<%--  一级菜单<c:forEach items="${categoryList}"></c:forEach> --%>
					<c:forEach items="${categoryList }" var="y">
					<li class="li1" value="${y.id }">
						<div class="nva_box_a">
							<a class="a" href="${y.parentUrl }">${y.name }</a>
						</div> <%-- 
								<div class="nva_box_b">
									<a class="a1" href="javascript:;">荣耀</a>
									<a class="a2" href="javascript:;">HUAWEI P系列</a>
								</div>
								 <%--  二级菜单 --%>
						<div class="nva_box_c1" style="top:-59px">
							<ul class="nva_box_c1_ul">
							<%-- 
								<li><a href="javascript:;">荣耀</a></li>
								<li><a href="javascript:;">HUAWEI P系列</a></li>
								<li><a href="javascript:;">畅玩</a></li>
								<li><a href="javascript:;">HUAWEI Mate系列</a></li>
								<li><a href="javascript:;">HUAWEI nova系列</a></li>
								--%>
							</ul>
						</div>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="nva_right float_left">
			<ul>
				<li><a href="users/index">首页</a></li>
				<li><a href="product/categoryFiltrate?hotProduct=15">畅销</a></li>
				<li><a href="product/categoryFiltrate?dateDay=-20">新品</a></li>
				<li><a href="product/categoryFiltrate?phone=10010">手机</a></li>
				<li><a href="product/categoryFiltrate?computer=10011">电脑</a></li>
				<li><a href="product/categoryFiltrate?clothing=10012">服饰</a></li>
			</ul>
		</div>
	</div>
	<div class="category">
			<div class="category_box">
				<div class="brand">
					<span class="float_left">品牌：</span>
					<div class="brand_box float_left">
						<ul>
							<c:forEach items="${likeNameList }" var="l">
								<li class="float_left"><a href="product/categoryFiltrate?clothing=10012&likeName=${likeName }&brand=${l.brand }">${l.brand }</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="order">
					<span class="float_left">查看方式：</span>
					<div class="order_box float_left">
						<ul class="order_box_ul1 float_left">
							<li class="float_left"><span>价格排序：</span></li>
							<li class="float_left"><a href="product/categoryFiltrate?clothing=10012&likeName=${likeName }&orderByPrice=9">由低到高</a></li>
							<li class="float_left"><a href="product/categoryFiltrate?clothing=10012&likeName=${likeName }&jianprice=1&orderByPrice=9">由高到低</a></li>
							<li class="float_left">
								<form action="product/categoryFiltrate?dateDay=-20&likeName=${likeName }">
									<input type="text" id="minPrice" name="minPrice" placeholder="￥" value="${minPrice }" />
									<span class="span float_left">-</span>
									<input type="text" id="maxPrice" name="maxPrice" placeholder="￥" value="${maxPrice }" />
									<span class="float_left">&nbsp;&nbsp;</span>
									<input type="text"  name="clothing" placeholder="￥" value="10012" style="display: none;"/>
									<input type="submit" value="确定" class="sub"/>
								</form>
							</li>
						</ul>
					</div>
				</div>
				<div class="price">
					<div class="order_box">
						<ul class="order_box_ul2">
							<li class="float_left"><span>上线时间排序：</span></li>
							<li class="float_left"><a href="product/categoryFiltrate?clothing=10012&likeName=${likeName }&orderByTime=9">由远到近</a></li>
							<li class="float_left"><a href="product/categoryFiltrate?clothing=10012&likeName=${likeName }&jianTime=1&orderByTime=9">由近到远</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="main">
			<!-- 所有商品 -->
			<div class="main_box3 clear_both">
				<c:if test="${likeName !=null} ">
					<h2>与&nbsp;&#34;${likeName }&#34;&nbsp;相关的商品</h2>
				</c:if>
				<c:forEach items="${likeNameList }" var="l">
				<a href="product/detail.do?productId=${l.id}" class="img_box">
					<div>
						<img src="img/portalImg/index_main/${l.mainImage}" />
					</div>
					<div class="text_box">
						<p>${l.name }</p>
						<span class="span">${l.price }</span><br />
						<span>${l.subtitle }</span> 
					</div>
				</a>
				</c:forEach>
			</div>
		</div>
	<script type="text/javascript" src="js/portalJs/jquery-2.0.3.min.js"></script>
	<script type="text/javascript">
		$(function() {
				$('.sub').click(function() {
					var name = $('#minPrice').val();
					var pass = $('#maxPrice').val();
					if(name == '') {
						alert('请输入数字');
						return false;
					} else if(pass == '') {
						alert('请输入数字');
						return false;
					} else {
						$('form').submit();
					}
				});
			});
		//导航 
		$(function(){
		$(".nva_box .li1").hover(function(){
			var index = $(".nva_box .li1").index($(this));
			$(this).find(".nva_box_c1").css("display", "block");
			$(this).find(".nva_box_c1").css("margin-top",-70 * index + "px");
			var categoryId = $(this).val();
			$.ajax({
				url:"users/product?categoryId=" + categoryId,
				success:function(data){
					$(".nva_box_c1_ul").empty();
					var obj = JSON.parse(data);
					for ( var i = 0; i < obj.length; i++) {
						$(".nva_box_c1_ul").append("<li><a href='"+ obj[i]['parentUrl']+"'>"
							+ obj[i]['name']+ "</a></li>");
					}
				}
			});
			
		},function(){
			$(this).find(".nva_box_c1").css("display", "none");
		});
		});			
	</script>
</body>

</html>
