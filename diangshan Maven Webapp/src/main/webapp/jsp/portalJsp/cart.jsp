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
<title>cart</title>
<link rel="stylesheet" href="css/portalCss/style.css" type="text/css"></link>
<link rel="stylesheet" href="css/portalCss/cart.css" type="text/css"></link>
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
	<!-- 购物车 -->
	<div class="cart">
			<div class="cart_box">
				<div class="cart_header">
					<div class="chakan float_left">
						1、<b>查看购物车</b>
					</div>
					<span class="float_left">&gt;&gt;</span>
					<div class="tijiao float_left">
						2、<b>提交订单</b>
					</div>
					<span class="float_left">&gt;&gt;</span>
					<div class="chenggong float_left">
						3、<b>成功提交订单</b>
					</div>
				</div>
				<div class="cart_nva">
					<div class="table_header">
						<ul>
							<li class="li1">
								<input type="checkbox" name="checkbox1" value="checkbox" class="checkedAll">
								<span>全选</span>
							</li>
							<li class="li1">
								<span>商品信息</span>
							</li>
							<li>单价(元)</li>
							<li>数量</li>
							<li>小计(元)</li>
							<li>积分</li>
							<li>操作</li>
						</ul>
					</div>
					
					<div class="prodct_main">
						<c:forEach items="${cartList }" var="c">
						<div class="table_prodct">
							<ul>
								<li class="li1">
									<input type="checkbox" name="${c.checked}" value="${c.id}" class="checkbox">
									<img src="img/portalImg/index_main/${c.productImg }"></img>
								</li>
								<li class="li2">
									<span>${c.subtitle }<br/>${c.flavor }</span>
								</li>
								<li class="li3"><span>￥${c.price }</span></li>
								<li>
									<c:if test="${c.quantity >1}">
										<a href="cart/cartList?jian=6&cartId=${c.id}" class="jian" id="${c.id }">-</a>
									</c:if>
									<c:if test="${c.quantity ==1}">
										<a href="javascript:;" class="jian" id="${c.id }">-</a>
									</c:if>
									<input type="text" value="${c.quantity }" class="num"/>
									<input type="text" value="${c.id }" style="display: none;" />
									<input type="text" value="${c.productId }" style="display: none;"  />
									<a href="cart/cartList?cartId=${c.id}" class="span_box" id="add${c.id }">+</a>
								</li>
								<li class="li4"><span>￥${c.price*c.quantity }</span></li>
								<li><span>${c.productIntegral }</span></li>
								<li class="lastli"><a href="cart/deleteCart?cartIds=${c.id}">删除</a></li>
							</ul>
						</div>
						</c:forEach>
					</div>
					
					<div class="table_submit">
						<ul>
							<li class="li1">
								<input type="checkbox" name="checkbox1" value="checkbox" class="checkedAll">
								<span>全选</span>
							</li>
							<li>
								<a href="cart/deleteCart?delCheckedAll=6">删除</a>
							</li>
							<li class="li2">已选商品：</li>
							<li><b class="n">${num }</b></li>
							<li>合计金额(元)：</li>
							<li class="li3">￥<b class="b">${numq }</b></li>
							<li>
								<a href="shipping/site" class="catr_sub">提交订单</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
		</div>

	<script type="text/javascript" src="js/portalJs/jquery-2.0.3.min.js"></script>
	<script type="text/javascript">
	//添加
		$(function() {
				var s = $(".checkbox[class='checkbox']");
				s.each(function(i) {
					if(this.name == 0){
						this.checked = false;
					}else{
						this.checked = true;
					}
					$(this).click(function() {
						var checked = this.checked;
						var id = this.value;
						$.ajax({
							url:"cart/checkbox?checked="+checked+"&cartId="+id,
							success:function(data){
								var obj = JSON.parse(data);
							    $(".b").text(obj[1]['numq']);
							    $(".n").text(obj[1]['num']);
							    if(obj[1]['num'] > 0){
							    	$(".catr_sub").css("background-color","orangered");
							    }else{
							    	$(".catr_sub").css("background-color","darkgray");
							    }
								for ( var i = 0; i < obj[0].length; i++){
									if(obj[0][i]['checked'] == 0){
										this.checked = false;
									}else{
										this.checked = true;
									}
								}
								var c = $(".checkedAll[class='checkedAll']");
								var f = false;
								var y = true;
								for(var i=0;i<s.length;i++){
									if(s.get(i).checked){
										f = true;
									}else{
										y = false;
									}
								}
								if(y){
									for(var i=0;i<c.length;i++){
										c.get(i).checked = true;
									}
									$(".catr_sub").css("background-color","orangered");
								}else{
									for(var i=0;i<c.length;i++){
										c.get(i).checked = false;
									}
								}
							}
						});
					});
				});
				var c = $(".checkedAll[class='checkedAll']");
				var f = false;
				var y = true;
				for(var i=0;i<s.length;i++){
					if(s.get(i).checked){
						f = true;
					}else{
						y = false;
					}
				}
				if(y){
					for(var i=0;i<c.length;i++){
						c.get(i).checked = true;
					}
					$(".catr_sub").css("background-color","orangered");
				}else{
					for(var i=0;i<c.length;i++){
						c.get(i).checked = false;
					}
				}
			});
			//选中
		$(function(){
			var c = $(".checkedAll[class='checkedAll']");
			c.each(function(i) {
			$(this).click(function(){
				var p = this.checked;
				var s = $(".checkbox[class='checkbox']");
				if(p == true){
					$.ajax({
						url:"cart/checkbox?checkedAll="+6,
						success:function(data){
							var obj = JSON.parse(data);
							$(".b").text(obj[1]['numq']);
							$(".n").text(obj[1]['num']);
							if(data == "checked"){
								$(".catr_sub").css("background-color","darkgray");
							}else{
								$(".catr_sub").css("background-color","orangered");
								var a = s.length;
								$(".b").val(a);
							}
						}
					});
					$(".checkedAll").get(1).checked = true;
					$(".checkedAll").get(0).checked = true;
					for(var i=0;i<s.length;i++){
						s.get(i).checked = true;
					}
				}else{
					$.ajax({
						url:"cart/checkbox?checkedAll="+1,
						success:function(data){
							var obj = JSON.parse(data);
							$(".b").text(obj[1]['numq']);
							$(".n").text(obj[1]['num']);
							if(data == "checkbox"){
								$(".catr_sub").css("background-color","orangered");
							}else{
								$(".catr_sub").css("background-color","darkgray");
							}
						}
					});
					$(".checkedAll").get(1).checked = false;
					$(".checkedAll").get(0).checked = false;
					for(var i=0;i<s.length;i++){
						s.get(i).checked = false;
					}
				}
			});
			});
		});
		$(function(){
			
		});
	</script>
</body>

</html>
