package com.qc.diangshang.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.qc.diangshang.pojo.Cart;
import com.qc.diangshang.pojo.Product;
import com.qc.diangshang.pojo.Shipping;
import com.qc.diangshang.pojo.User;
import com.qc.diangshang.services.CartServices;
import com.qc.diangshang.services.ProductServices;
import com.qc.diangshang.services.ShippingServices;

@Controller
@RequestMapping(value="/cart/")
public class CartController {

	@Autowired
	private CartServices cartServices;
	@Autowired
	private ProductServices productServices;
	@Autowired
	private ShippingServices shippingServices;
	
	//添加购物车
	@RequestMapping(value="addCart")
	@ResponseBody
	public int addProdctAll(Map<String, Object> map,HttpSession session,
			@RequestParam(value = "productId", defaultValue = "0")Integer productId,
			@RequestParam(value = "quantity", defaultValue = "1")Integer quantity,
			@RequestParam(value = "checked", defaultValue = "0")Integer checked){
		Cart record = new Cart();
		//获取用户id
		User users = (User) session.getAttribute("users");
		int userId = users.getId();
		//查询购物车总数
		int cart = (Integer) session.getAttribute("cart");
		//产品详情
		Product product = productServices.findProductDetails(productId);
		//当商品是同一件是增加数量
		Cart records = cartServices.findByPrimaryKey(productId, userId);
		if(records !=null){
			int quantitys = records.getQuantity();
			quantitys = quantitys+1;
			int update = cartServices.updateQuantity(quantitys, productId, userId);
			if(update>0){
				cart = cart+1;
				session.setAttribute("cart", cart);
				return cart;
			}
		}
		record.setUserId(userId);//获取用户id
		record.setProductId(productId);
		record.setQuantity(quantity);
		record.setChecked(checked);
		record.setProductImg(product.getMainImage());
		record.setSubtitle(product.getSubtitle());
		record.setFlavor(product.getFlavor());
		record.setPrice(product.getPrice());
		record.setProductIntegral(product.getProductIntegral());
		record.setFreight(product.getFreight());
		
		//添加商品到购物车
		int add = cartServices.addProdctAll(record);
		if(add>0){
			
		}
		cart = cart+1;
		session.setAttribute("cart", cart);
		return cart;
	}
	
	//删除购物车商品
	@RequestMapping(value="deleteCart")
	public String deleteCart(Map<String, Object> map,HttpSession session,
			@RequestParam(value = "cartIds", defaultValue = "0")Integer cartIds,
			@RequestParam(value = "delCheckedAll", defaultValue = "0")Integer delCheckedAll){
		User users = (User) session.getAttribute("users");
		int userId = users.getId();
		if(delCheckedAll == 6){
			//购物车选中list
			List<Cart> cartLists = cartServices.findCartCheckedAll(1, userId);
			for(Cart c:cartLists){
				int cartId = c.getId();
				int delete = cartServices.deleteByPrimaryKey(cartId);
				if(delete == 0){
					break;
				}
			}
			
		}else{
			int delete = cartServices.deleteByPrimaryKey(cartIds);
			if(delete == 0){}
		}
		return "forward:cartList";
	}
	
	//查询当前用户购物车
	@RequestMapping(value="cartList")
	public String findCartAll(Map<String, Object> map,HttpSession session,
			@RequestParam(value = "cartId", defaultValue = "0")Integer cartId,
			@RequestParam(value = "jian", defaultValue = "0")Integer jian){
		User users = (User) session.getAttribute("users");
		int userId = users.getId();
		if(cartId !=0){
			Cart cart = cartServices.findCart(cartId);
			int quantity = cart.getQuantity();
			int productId = cart.getProductId();
			int carts = (Integer) session.getAttribute("cart");
			if(jian !=0){
				quantity = quantity -1;
				carts = carts -1;
			}else{
				quantity = quantity +1;
				carts = carts +1;
			}
			int upd = cartServices.updateQuantity(quantity, productId, userId);
			if(upd>0){
				session.setAttribute("cart", carts);
			}
		}
		//购物车list
		List<Cart> cartList = cartServices.findCartAll(userId);
		map.put("cartList", cartList);
		//购物车选中list
		List<Cart> cartLists = cartServices.findCartCheckedAll(1, userId);
		//总价格
		BigDecimal numq = new BigDecimal(0);//单种商品总价格
		BigDecimal pr = new BigDecimal(0);
		for(Cart c:cartLists){
			pr = c.getPrice();
			BigDecimal ji = pr.multiply(new BigDecimal(c.getQuantity()));
			numq =  numq.add(ji);
		}
		map.put("numq", numq);
		map.put("num", cartLists.size());
		
		return "portalJsp/cart";
	}
	//购物车商品选中
	@RequestMapping(value="checkbox")
	@ResponseBody
	public String addCart(HttpSession session,
			@RequestParam(value = "cartId", defaultValue = "0")Integer cartId,
			@RequestParam(value = "checked", defaultValue = "false")Boolean checked,
			@RequestParam(value = "checkedAll", defaultValue = "0")Integer checkedAll){
		User users = (User) session.getAttribute("users");
		int userId = users.getId();
		List<Cart> cartList = cartServices.findCartAll(userId);
		if(checkedAll == 0){
			if(checked){
				int upd = cartServices.updateChecked(1,cartId);
				if(upd>0){}
			}else{
				int upd = cartServices.updateChecked(0,cartId);
				if(upd>0){}
			}
		}else if(checkedAll == 6){
			for(Cart c:cartList){
				int upd = cartServices.updateChecked(1,c.getId());
				if(upd>0){}
			}
		}else{
			for(Cart c:cartList){
				int upd = cartServices.updateChecked(0,c.getId());
				if(upd>0){}
			}
		}
		List<Cart> cartLists = cartServices.findCartAll(userId);
		List<Cart> cartListss = cartServices.findCartCheckedAll(1, userId);
		//购物车list
		//总价格
		BigDecimal numq = new BigDecimal(0);//单种商品总价格
		BigDecimal pr = new BigDecimal(0);
		for(Cart c:cartListss){
			pr = c.getPrice();
			BigDecimal ji = pr.multiply(new BigDecimal(c.getQuantity()));
			numq =  numq.add(ji);
		}
		List<Object> obj = new ArrayList<Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("numq", numq);
		map.put("num", cartListss.size());
		obj.add(cartLists);
		obj.add(map);
		String cart = JSONObject.toJSONString(obj);
		
		return cart;
	}
	
	
	
	//确定提交订单
	@RequestMapping(value="orderConfirm")
	public String orderConfirm(Map<String, Object> map,HttpSession session){
		User users = (User) session.getAttribute("users");
		int userId = users.getId();
		//查询当前用户是否有收货地址
		List<Shipping> shipping = shippingServices.findByPrimaryKey(userId);
		//当前用户选中提交商品信息
		List<Cart> cartList = cartServices.findCartCheckedAll(1, userId);
		map.put("cartList", cartList);
		//总价格
		BigDecimal numq = new BigDecimal(0);//单种商品总价格
		BigDecimal pr = new BigDecimal(0);
		//配送费
		int freight = 0;
		//积分
		int productIntegral = 0;
		for(Cart c:cartList){
			freight += c.getFreight();
			productIntegral += c.getProductIntegral();
			
			pr = c.getPrice();
			BigDecimal ji = pr.multiply(new BigDecimal(c.getQuantity()));
			numq =  numq.add(ji);
		}
		
		map.put("numq", numq);
		map.put("freight", freight);
		map.put("productIntegral", productIntegral);
		map.put("shipping", shipping);
		
		return "portalJsp/order";
	}
}







