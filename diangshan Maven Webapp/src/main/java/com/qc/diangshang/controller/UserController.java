package com.qc.diangshang.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.qc.diangshang.pojo.Cart;
import com.qc.diangshang.pojo.Category;
import com.qc.diangshang.pojo.Product;
import com.qc.diangshang.pojo.User;
import com.qc.diangshang.services.CartServices;
import com.qc.diangshang.services.CategoryServices;
import com.qc.diangshang.services.ProductServices;
import com.qc.diangshang.services.UsersServices;
import com.qc.diangshang.util.Setchar;

@Controller
@RequestMapping(value = "/users/")
public class UserController {

	@Autowired
	private UsersServices usersServices;
	@Autowired
	private ProductServices productServices;
	@Autowired
	private CategoryServices categoryServices;
	@Autowired
	private CartServices cartServices;

	// 用户登录
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(HttpSession session, Map<String, Object> map,
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "password", defaultValue = "") String password) {
		User users = usersServices.userLogin(name, password);
		if (null == users) {
			map.put("loginno", "帐号或密码错误，请重新登录！");
			return "portalJsp/userLogin";
		} else {
			String psw = users.getPassword();
			psw = null;
			password = null;
			session.setAttribute("users", users);
			map.put("login", 5);
			//查询购物车总数
			int userId = users.getId();
			List<Cart> cartList = cartServices.findCartAll(userId);
			int[] quantity = new int[cartList.size()];
			int cart = 0;
			int j=0;
			for(Cart cartl:cartList){
				int num = cartl.getQuantity();
				quantity[j] = num;
				j++;
			}
			for(int i=0;i<quantity.length;i++){
				cart += quantity[i];
			}
			session.setAttribute("cart", cart);
			
			int role = users.getRole();
//			// 所有产品
//			List<Product> productList = productServices.findProductAll(1, 0,null);
//			map.put("productList", productList);

			if (role == 0) {
				return "adminJsp/index";
			} else {
				return "forward:index";
			}
		}
	}

	// 用户退出
	@RequestMapping(value = "exit")
	public String userExit(HttpSession session) {
		session.removeAttribute("users");
		return "portalJsp/userLogin";
	}


	// 登录管网  ajax 商品导航加载
	@RequestMapping(value = "product", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String nvaindexs(Map<String, Object> map,
			@RequestParam(value = "categoryId", defaultValue = "0") Integer categoryId){
		// 二级
		List<Category> categoryList = null;
		if(categoryId !=0){
			categoryList = categoryServices.selectByPrimaryKey(categoryId);
		}
		String producs = JSONObject.toJSONString(categoryList);
		return producs;
	}
	
	//用户注册
	@RequestMapping(value="register")
	public String userRegister(Map<String, Object> map,
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "password", defaultValue = "") String password,
			@RequestParam(value = "phone", defaultValue = "") String phone){
		
		
		return "";
	}
	
	// 官网加载
	@RequestMapping(value="index")
	public String index(Map<String, Object> map,HttpSession session,
			@RequestParam(value = "parentId", defaultValue = "0") Integer parentId,
			@RequestParam(value = "likeName", defaultValue = "") String likeName){
		
		//导航类别
		List<Category> categoryList = categoryServices.selectByPrimaryKey(parentId);
		session.setAttribute("categoryList", categoryList);
		//最新商品
		List<Product> newProduct = productServices.findNewProduct(-20,10);
		map.put("newProduct", newProduct);
		map.put("new1", "新品上市");
		//热卖商品
		List<Product> hotProduct = productServices.findHotProduct(15,10);
		map.put("hotProduct", hotProduct);
		map.put("hot1", "热销单品");
		//电子产品
		List<Product> electronicProducts = productServices.findElectronicProducts(10010, 10011,10);
		map.put("electronicProducts", electronicProducts);
		map.put("electronic", "电子产品");
		//时尚食品
		List<Product> ClothingFood = productServices.findClothingFood(10012, 10013,10);
		map.put("clothingFood", ClothingFood);
		map.put("clothing", "时尚/食品");
		
		return "portalJsp/index";
	}
}