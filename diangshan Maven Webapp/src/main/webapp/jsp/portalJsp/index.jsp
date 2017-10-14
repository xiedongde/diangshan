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
<title>index</title>
<link rel="stylesheet" href="css/portalCss/style.css" type="text/css"></link>
<link rel="stylesheet" type="text/css"
	href="css/portalCss/index_bna.css" />
<link rel="stylesheet" type="text/css"
	href="css/portalCss/index_main.css" />
</head>

<body>
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
							<c:if test="${users.role==1 }" >
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
	<div class="nva clear_both">
		<div class="nva_left float_left" >
			<span>全部商品</span> <i class="i"></i>
			<div class="nva_box">
				<ul class="nva_box_ul">
					<%--  一级菜单<c:forEach items="${categoryList}"></c:forEach> --%>
					<c:forEach items="${categoryList }" var="y" >
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
	<div class="lunbo">
		<div class="jq22-container">

			<div class="flexslider">
				<ul class="slides">
					<li
						style="background:url(img/portalImg/index_bna/20170627000727761.jpg) 50% 0 no-repeat;"></li>
					<li
						style="background:url(img/portalImg/index_bna/1483001338086380522.jpg) 50% 0 no-repeat;"></li>
					<li
						style="background:url(img/portalImg/index_bna/1492154073328421051.jpg) 50% 0 no-repeat;"></li>
					<li
						style="background:url(img/portalImg/index_bna/xmad_14890540335855_wTxbY.jpg) 50% 0 no-repeat;"></li>
					<li
						style="background:url(img/portalImg/index_bna/img2016061612461806020.jpg) 50% 0 no-repeat;"></li>
				</ul>
			</div>

		</div>
	</div>
	<div class="main">
	<%--
		<div class="main_box1">
			<a href="javascript:;"> <img
				src="img/portalImg/index_main/20170616092620569.png" /> </a> <a
				href="javascript:;"> <img
				src="img/portalImg/index_main/2017062100033306.jpg" /> </a> <a
				href="javascript:;"> <img
				src="img/portalImg/index_main/20170618214623318.png" /> </a> <a
				href="javascript:;"> <img
				src="img/portalImg/index_main/2017052616312797.png" /> </a>
		</div>
		<div class="main_box2">
			<h2>热销单品</h2>
			<a href="product/categoryFiltrate?hotProduct=15" class="gengduo">更多&gt;&gt;</a>
			<a href="javascript:;" class="img_box">
				<div>
					<img src="img/portalImg/index_main/428_428_1488445580911mp.jpg" />
				</div>
				<div class="text_box">
					<p>荣耀V9</p>
					<span>最高优惠200元 送保护壳</span><br /> <span class="span">￥2599</span>
				</div> </a> <a href="javascript:;" class="img_box">
				<div>
					<img src="img/portalImg/index_main/428_428_1480922774554mp.jpg" />
				</div>
				<div class="text_box">
					<p>荣耀V9</p>
					<span>最高优惠200元 送保护壳</span><br /> <span class="span">￥2599</span>
				</div> </a> <a href="javascript:;" class="img_box">
				<div>
					<img src="img/portalImg/index_main/428_428_1495174269824mp.jpg" />
				</div>
				<div class="text_box">
					<p>荣耀V9</p>
					<span>最高优惠200元 送保护壳</span><br /> <span class="span">￥2599</span>
				</div> </a> <a href="javascript:;" class="img_box">
				<div>
					<img src="img/portalImg/index_main/1496247658418.png" />
				</div>
				<div class="text_box">
					<p>荣耀V9</p>
					<span>最高优惠200元 送保护壳</span><br /> <span class="span">￥2599</span>
				</div> </a> <a href="javascript:;" class="img_box">
				<div>
					<img src="img/portalImg/index_main/1496214523346.jpg" />
				</div>
				<div class="text_box">
					<p>荣耀V9</p>
					<span>最高优惠200元 送保护壳</span><br /> <span class="span">￥2599</span>
				</div> </a> <a href="javascript:;" class="img_box">
				<div>
					<img src="img/portalImg/index_main/1497107600300.jpg" />
				</div>
				<div class="text_box">
					<p>荣耀V9</p>
					<span>最高优惠200元 送保护壳</span><br /> <span class="span">￥2599</span>
				</div> </a> <a href="javascript:;" class="img_box">
				<div>
					<img src="img/portalImg/index_main/428_428_1491796478415mp.jpg" />
				</div>
				<div class="text_box">
					<p>荣耀V9</p>
					<span>最高优惠200元 送保护壳</span><br /> <span class="span">￥2599</span>
				</div> </a> <a href="javascript:;" class="img_box">
				<div>
					<img src="img/portalImg/index_main/1493178384684.png" />
				</div>
				<div class="text_box">
					<p>荣耀V9</p>
					<span>最高优惠200元 送保护壳</span><br /> <span class="span">￥2599</span>
				</div> </a>
		</div>
		 --%>
		<!-- 新品上市 -->
		<div class="main_box3 clear_both">
			<h2>${new1 }</h2>
			<a href="product/categoryFiltrate?dateDay=-20" class="gengduo">更多&gt;&gt;</a>
			<c:forEach items="${newProduct }" var="n">
			<a href="product/detail.do?productId=${n.id}" class="img_box">
				<div>
					<img src="img/portalImg/index_main/${n.mainImage}" />
				</div>
				<div class="text_box">
					<p>${n.name }</p> 
					<span class="span">${n.price }</span><br />
					<span>${n.subtitle }</span>
				</div>
			</a>
			</c:forEach>
		</div>
		<!-- 热卖产品 -->
		<div class="main_box3 clear_both">
			<h2>${hot1 }</h2>
			<a href="product/categoryFiltrate?hotProduct=15" class="gengduo">更多&gt;&gt;</a>
			<c:forEach items="${hotProduct }" var="h">
			<a href="product/detail.do?productId=${h.id}" class="img_box">
				<div>
					<img src="img/portalImg/index_main/${h.mainImage}" />
				</div>
				<div class="text_box">
					<p>${h.name }</p> 
					<span class="span">${h.price }</span><br />
					<span>${h.subtitle }</span>
				</div>
			</a>
			</c:forEach>
		</div>
		<!-- 电子产品 -->
		<div class="main_box3 clear_both">
			<h2>${electronic }</h2>
			<a href="product/categoryFiltrate?phone=10010" class="gengduo">更多&gt;&gt;</a>
			<c:forEach items="${electronicProducts }" var="e">
			<a href="product/detail.do?productId=${e.id}" class="img_box">
				<div>
					<img src="img/portalImg/index_main/${e.mainImage}" />
				</div>
				<div class="text_box">
					<p>${e.name }</p>
					<span class="span">${e.price }</span><br /> 
					<span>${e.subtitle }</span>
				</div>
			</a>
			</c:forEach>
		</div>
		<!-- 时尚食品 -->
		<div class="main_box3 clear_both">
			<h2>${clothing }</h2>
			<a href="product/categoryFiltrate?clothing=10012" class="gengduo">更多&gt;&gt;</a>
			<c:forEach items="${clothingFood }" var="c">
			<a href="product/detail.do?productId=${c.id}" class="img_box">
				<div>
					<img src="img/portalImg/index_main/${c.mainImage}" />
				</div>
				<div class="text_box">
					<p>${c.name }</p>
					<span class="span">${c.price }</span><br />
					<span>${c.subtitle }</span>
				</div>
			</a>
			</c:forEach>
		</div>
	</div>
	<script type="text/javascript" src="js/portalJs/jquery-2.0.3.min.js"></script>
	<script src="js/portalJs/jquery.flexslider-min.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
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
		//轮播图
		$(document).ready(function() {
			$('.flexslider').flexslider({
				directionNav : true,
				pauseOnAction : false,
				slideshowSpeed : 3000
			});
		});
	</script>
</body>

</html>
