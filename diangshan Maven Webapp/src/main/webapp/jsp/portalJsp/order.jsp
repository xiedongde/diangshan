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
<title>order</title>
<link rel="stylesheet" href="css/portalCss/style.css" type="text/css"></link>
<link rel="stylesheet" href="css/portalCss/order.css" type="text/css"></link>
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
					<li><span>欢迎,</span> <a class="li1" href="javascript:;">${users.username
							}</a></li>
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
					<input class="seek_text float_left" type="text" name="likeName"
						value="${likeName }" placeholder="请输入商品关键字" />
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
										href="jsp/portalJsp/userLogin.jsp">${users.username }</a> <span>|</span>
									<a href="users/exit">退出</a>
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
							<a class="float_left" href="cart/cartList">我的购物车</a> <i class="i"></i>
						</div>
						<div class="li2_div2 clear_both">
							<input id="cart" value="${cart }" />
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

		</div>
	</div>
	<div class="order">
		<div class="shipping_box">
			<c:if test="${empty shipping}">
				<div class="shipping_form">
					<h3>请填写收货地址</h3>
					<form action="shipping/addShipping">
						<ul>
							<li class="li1"><span>收件人：</span> <input type="text"
								name="receiverName" id="" value="" />
							</li>
							<li class="li2">
								<span>配送区域：</span> 
								<select id="provinces" name="receiverProvince">
										<option>--请选择--</option>
										<c:forEach items="${province }" var="p">
											<option value="${p.provinceid }">${p.province }</option>
										</c:forEach>
								</select> 
								<select id="cities" name="receiverCity">
										<option>--请选择--</option>
								</select> 
								<select id="areas" name="receiverDistrict">
										<option>--请选择--</option>
								</select>
							</li>
							<li class="li3"><span>详细地址：</span> <input type="text" name="receiverAddress"
								id="" value="" />
							</li>
							<li class="li4">
								<span>手机号码：</span> 
								<input type="text" name="receiverPhone"id="" value="" /> 
								<span class="or">或</span> 
								<span>固定电话：</span> 
								<input type="text" name="receiverMobile" id="" value="" />
							</li>
							<li class="li5">
								<span>邮编：</span> 
								<input type="text" name="receiverZip" value="" id="zipcodes" />
							</li>
							<li class="li6"><input type="submit" value="保存收货人信息" />
							</li>
						</ul>
					</form>
				</div>
			</c:if>
			<c:if test="${not empty shipping}">
				<c:forEach items="${shipping }" var="s">
					<div class="receiver_shipping">
						<div class="receiver_box">
							<ul>
								<li><span>收件人：</span> <span>${s.receiverName }</span>
								</li>
								<li>
									<span>收件人电话：</span> 
									<c:if test="${s.receiverPhone != null}">
										<span>${s.receiverPhone }</span>
									</c:if>
									&nbsp;&nbsp;
									<c:if test="${s.receiverMobile != null}">
										<span>${s.receiverMobile }</span>
									</c:if>
								</li>
								<li><span>收货地址：</span> 
								<span class="clear">${s.receiverProvince }${s.receiverCity }${s.receiverDistrict }${s.receiverAddress }</span>
								</li>
								<li><span>邮编：</span> <span>${s.receiverZip }</span>
								</li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
		<form action="">
			<div class="zifu">
				<h3>选择支付方式</h3>
				<div class="pay">
					<div class="pay_box">
						<span class="float_left">支付平台</span>
						<div class="zfb float_left">
							<input type="radio" name="" id="" value="" class="float_left" />
							<span class="float_left"> 
							<img src="img/portalImg/button/alipay.png"></img> </span>
						</div>
					</div>
				</div>
			</div>
			<div class="cart_product">
				<div class="cart_product_box">
					<div class="had">
						<span><b>商品信息</b> </span> <a href="cart/cartList">返回购物车&gt;&gt;</a>
					</div>
					<table cellpadding="0" cellspacing="0">
						<tr>
							<th colspan="2" class="th1">商品名称</th>
							<th class="th2">商品价格（元）</th>
							<th>购买数量</th>
							<th>小结</th>
						</tr>
						
						<tr class="tr">
							<td class="td1">
								<img src="img/portalImg/index_main/1495595549022.png"/>
							</td>
							<td class="td2">2</td>
							<td>3</td>
							<td>4</td>
							<td>5</td>
						</tr>
						<c:forEach items="${cartList }" var="c">
							<tr class="tr">
								<td class="td1">
									<img src="img/portalImg/index_main/${c.productImg }"/>
								</td>
								<td class="td2">${c.subtitle }<br/>${c.flavor }</td>
								<td>${c.price }</td>
								<td>${c.quantity }</td>
								<td>${c.price*c.quantity }</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="3"></td>
							<td>商品总价：${numq }</td>
							<td>配送费用：${freight }</td>
						</tr>
					</table>
					<div class="ddtijiao">
						<div class="tijiao_box">
							<div class="jifen float_left">
								<span>获得积分：</span> <b>${productIntegral }</b>
							</div>
							<div class="jiner float_left">
								<span>应付款金额：</span> <b>￥${numq+freight }</b>
							</div>
							<div class="sub">
								<input type="submit" name="" id="" value="提交订单" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="js/portalJs/jquery-2.0.3.min.js"></script>
	<script type="text/javascript">
  		$('#provinces').on("change",function(){
  			var p = $(this).val();
  			$.ajax({
  				type:"POST",
  				url:"shipping/ajaxSite",
  				data:"action=citys&id="+p,
  				success:function(date){//asas=strC
  					$('#cities').empty();
  					$('#cities').append("<option>--请选择--</option>");
  					//js解析json数据
  					var obj = JSON.parse(date);//tate
  					// obj 
  					
  					for(var i=0;i<obj.length;i++){
  						$('#cities').append("<option value='"+obj[i]['cityid']+"'>"+obj[i]['city']+"</option>");
  					}
  				}
  			});
  		});
  		$('#cities').on("change",function(){
  			var c = $(this).val();
  			$.ajax({
  				url:"shipping/ajaxSite",
  				data:"action=areas&id="+c,
  				success:function(dates){
  					$('#areas').empty();
  					$('#areas').append("<option>--请选择--</option>");
  					var obj = JSON.parse(dates);
  					
  					for(var i=0;i<obj.length;i++){
  						$('#areas').append("<option value='"+obj[i]['areaid']+"'>"+obj[i]['area']+"</option>");
  					}
  				}
  			});
  		});
  		
  		$('#areas').on("change",function(){
  			var z = $(this).val();
  			$.ajax({
  				url:"shipping/ajaxSite",
  				data:"action=zipcodes&id="+z,
  				success:function(datess){
  					var obj = JSON.parse(datess);
  					for(var i=0;i<obj.length;i++){
  						$('#zipcodes').val(obj[i]['zip']);
  					}
  				}
  			});
  		});
  	</script>
</body>

</html>
