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
<title>add_product</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/adminCss/result.css" />
<link rel="stylesheet" href="css/adminCss/style.css" />
<link rel="stylesheet" href="css/adminCss/admin.css" />
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
		<div class="float_left admin_list_menu">
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
		<div class="float_left admin_right_div" style="margin-left: 10px;">
			<h3>添加商品</h3>
			<div>
				<form action="product/save.do" method="get">

					<div class="margin_top_10">
						<div class="float_left product_left_div">商品id</div>
						<div class="float_left product_right_div">
							<input type="text" class="input_1" name="id" />
						</div>
						<div class="clear_float"></div>
					</div>

					<div class="margin_top_10">
						<div class="float_left product_left_div">所属分类</div>
						<div class="float_left product_right_div">
							<div class="float_left">
								<select style="width: 100px;" name="categoryId" id="categoryId">
									<c:forEach items="${categoryList }" var="c">
										<option value="${c.id }">${c.name }</option>
									</c:forEach>
								</select>
							</div>
							<div class="float_left" style="margin-left: 20px;">
								<select style="width: 100px;" name="category" id="category">
									<option>--请选择--</option>
								</select>
							</div>
						</div>
						<div class="clear_float"></div>
					</div>

					<div>
						<div class="float_left product_left_div">商品名称</div>
						<div class="float_left product_right_div">
							<input type="text" class="input_1" name="name" />
						</div>
						<div class="clear_float"></div>
					</div>

					<div class="margin_top_10">
						<div class="float_left product_left_div">商品描述</div>
						<div class="float_left product_right_div">
							<input type="text" class="input_1" name="subtitle" />
						</div>
						<div class="clear_float"></div>
					</div>

					<div class="margin_top_10">
						<div class="float_left product_left_div">商品库存</div>
						<div class="float_left product_right_div">
							<input type="text" class="input_1" name="stock" />
						</div>
						<div class="clear_float"></div>
					</div>

					<div class="margin_top_10">
						<div class="float_left product_left_div">商品图片</div>
						<div class="float_left product_right_div">

							<script type="text/plain" id="goodsInfo" name="subImages">
    </script>
						</div>
						<div class="clear_float"></div>
					</div>

					<div class="margin_top_10">
						<input type="submit" value="提交"
							style="margin-left: 200px;padding: 5px 20px" />
					</div>

				</form>
			</div>
		</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" src="ueditor/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript">
		var ue = UE.getEditor('goodsInfo', {
			toolbars : [ [ 'undo', //撤销
			'redo', //重做
			'simpleupload', //单图上传
			'insertimage', //多图上传
			'fullscreen', //全屏
			] ],
			initialFrameWidth : 800,//富文本宽度
			initialFrameHeight : 200,//富文本高度
		});
		//
		$('#categoryId').on("change",function(){
  			var p = $(this).val();
  			$.ajax({
  				type:"POST",
  				url:"manage/category/get_deep_category.do",
  				data:"action=categoryId="+p,
  				success:function(date){//asas=strC
  					$('#category').empty();
  					$('#category').append("<option>--请选择--</option>");
  					//js解析json数据
  					var obj = JSON.parse(date);//tate
  					// obj 
  					
  					for(var i=0;i<obj.length;i++){
  						$('#category').append("<option value='"+obj[i]['id']+"'>"+obj[i]['name']+"</option>");
  					}
  				}
  			});
  		});
		$(function() {
			if ('${add}' == 6) {
				window.location.href = "product/List";
			}
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
