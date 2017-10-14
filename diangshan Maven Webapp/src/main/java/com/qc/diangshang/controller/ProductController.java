package com.qc.diangshang.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.qc.diangshang.pojo.Product;
import com.qc.diangshang.pojo.ProductImg;
import com.qc.diangshang.pojo.User;
import com.qc.diangshang.services.ProductImgServices;
import com.qc.diangshang.services.ProductServices;
import com.qc.diangshang.util.IUsersVerify;
import com.qc.diangshang.util.Setchar;

@Controller
@RequestMapping(value = "/product/")
public class ProductController {

	@Autowired
	private ProductServices productServices;
	@Autowired
	private ProductImgServices productImgServices;

	// 关键字分页查询所有商品
	@RequestMapping(value = "List.do")
	public String findProductAll(
			Map<String, Object> map,
			HttpSession session,
			@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "productName", defaultValue = "") String productName) {
		// 判断是否登录
		if (null == session.getAttribute("users")) {
			map.put("msg", "您还没登录，请登录！");
			return "adminJsp/login";
		}
		// 判断是否是管理员 '角色0-管理员，1-普通用户',
		if (IUsersVerify.ifRole(session)) {
			map.put("msg", "对不起您不是管理员，不能访问！");
			return "portalJsp/userLogin";
		}
		productName = Setchar.charset(productName);
		pageSize = 8;
		List<Product> productList = productServices.findProductAll(pageNum,
				pageSize, productName);
		map.put("productList", productList);
		map.put("productName", productName);
		map.put("pageNum", pageNum);

		return "adminJsp/product";
	}

	// 产品详情
	@RequestMapping(value = "detail.do")
	public String findProductDetails(Map<String, Object> map,
			HttpSession session,
			@RequestParam(value = "productId", defaultValue = "0") Integer productId) {
		// 判断是否登录
		if (null == session.getAttribute("users")) {
			map.put("msg", "您还没登录，请登录！");
			return "adminJsp/userLogin";
		}
		User users = (User) session.getAttribute("users");
		int role = users.getRole();
		//商品信息
		Product product = productServices.findProductDetails(productId);
		map.put("product", product);
		//商品图片信息
		List<ProductImg> productImg = productImgServices.findProductImgAll(productId);
		map.put("productImg", productImg);
		
		if (role == 0) {
			return "adminJsp/product";
		} else {
			return "portalJsp/product";
		}
	}

	// 商品下架
	@RequestMapping(value = "set_sale_status.do")
	public String updateProductStatus(Map<String, Object> map,
			HttpSession session,
			@RequestParam(value = "status", defaultValue = "0") Integer status,
			@RequestParam(value = "id", defaultValue = "0") Integer id) {
		// 判断是否登录
		if (null == session.getAttribute("users")) {
			map.put("msg", "您还没登录，请登录！");
			return "adminJsp/userLogin";
		}

		status = 2;// 代表商品下架
		Integer i = productServices.updateProductStatus(status, id);
		if (i > 0) {
			map.put("productStatus", "下架成功！");
		}
		return "adminJsp/index";
	}

	// 6、新增OR更新产品
	@RequestMapping(value = "save.do")
	public String addProductOrUpdate(
			Map<String, Object> map,
			HttpSession session,
			@RequestParam(value = "categoryId", defaultValue = "1") Integer categoryId,
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "subtitle", defaultValue = "") String subtitle,

			@RequestParam(value = "subImages", defaultValue = "") String subImages,
			@RequestParam(value = "detail", defaultValue = "") String detail,

			@RequestParam(value = "price", defaultValue = "0") BigDecimal price,
			@RequestParam(value = "stock", defaultValue = "0") Integer stock,
			@RequestParam(value = "status", defaultValue = "1") Integer status,
			@RequestParam(value = "id", defaultValue = "0") Integer id) {
		// 判断是否登录
		if (null == session.getAttribute("users")) {
			map.put("msg", "您还没登录，请登录！");
			return "adminJsp/login";
		}
		name = Setchar.charset(name);
		subtitle = Setchar.charset(subtitle);

		Product product = productServices.findProductDetails(id);
		if (null == product) {
			// 添加产品
			Product products = new Product();
			products.setCategoryId(categoryId);
			products.setName(name);
			products.setSubtitle(subtitle);
			products.setSubImages(subImages);

			products.setPrice(price);
			products.setStock(stock);
			products.setStatus(status);
			products.setId(id);
			int add = productServices.addProductAll(products);
			if (add > 0) {
				map.put("add", 6);
			}
		} else {
			// 修改产品
			Product products = new Product();
			products.setCategoryId(categoryId);
			products.setName(name);
			products.setSubtitle(subtitle);
			products.setSubImages(subImages);

			products.setPrice(price);
			products.setStock(stock);
			products.setStatus(status);

			int upd = productServices.updateByPrimaryKeySelective(products);
			if (upd > 0) {
				map.put("upd", "修改商品信息");
			}
		}
		return "adminJsp/add_product";
	}

	// 产品搜索及动态排序List
	@RequestMapping(value = "list.do")
	public String findProductOrderBy(
			Map<String, Object> map,
			HttpSession session,
			@RequestParam(value = "categoryId", defaultValue = "0") Integer categoryId,
			@RequestParam(value = "name", defaultValue = "") String keyword,
			@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "priceDesc", defaultValue = "") String priceDesc) {
		// 判断是否登录
		if (null == session.getAttribute("users")) {
			map.put("msg", "您还没登录，请登录！");
			return "adminJsp/login";
		}
		List<Product> list = productServices.findProductOrderBy(categoryId,
				keyword, pageNum, pageSize, priceDesc);
		if (null == list) {
			map.put("msg", "参数错误");
		}
		map.put("list", list);

		return "";
	}

	// 添加图片
	public List<ProductImg> addProductImg() {

		return null;
	}

	// 18、产品detail
	@RequestMapping(value = "detail.dos")
	public String findByPrimaryKey(
			Map<String, Object> map,
			HttpSession session,
			@RequestParam(value = "productId", defaultValue = "0") Integer productId) {
		// 判断是否登录
		if (null == session.getAttribute("users")) {
			map.put("msg", "您还没登录，请登录！");
			return "adminJsp/login";
		}
		Product detail = productServices.findByPrimaryKey(productId);
		if (null == detail) {
			map.put("msg", "该商品已下架或删除");
		}
		map.put("detail", detail);

		return "adminJsp/";
	}

	// 门户 产品搜索
	@RequestMapping(value="likeName")
	public String findLikeName(Map<String, Object> map,
			@RequestParam(value = "likeName", defaultValue = "") String likeName,
			@RequestParam(value = "indexSize", defaultValue = "0") Integer indexSize) {
		// 产品搜索
		if (likeName == "") {
			likeName = null;
		}
		indexSize = 10;
		if (likeName != null) {
			likeName = Setchar.charset(likeName);
			List<Product> likeNameList = productServices.findLikeName(likeName,indexSize);
			map.put("likeNameList", likeNameList);
			map.put("likeName", likeName);
		}
		return "portalJsp/category";
	}
	
	//分类页面加载 
	@RequestMapping(value="categoryFiltrate")
	public String categoryFiltrate(Map<String, Object> map,
			@RequestParam(value = "likeName", defaultValue = "") String likeName,
			@RequestParam(value = "maxPrice", defaultValue = "0") Integer maxPrice,
			@RequestParam(value = "minPrice", defaultValue = "0") Integer minPrice,
			@RequestParam(value = "brand", defaultValue = "") String brand,
			
			@RequestParam(value = "hotProduct", defaultValue = "0") Integer hotProduct,
			
			@RequestParam(value = "phone", defaultValue = "0") Integer phone,
			@RequestParam(value = "computer", defaultValue = "0") Integer computer,
			
			@RequestParam(value = "clothing", defaultValue = "0") Integer clothing,
			@RequestParam(value = "food", defaultValue = "0") Integer food,
			
			@RequestParam(value = "dateDay", defaultValue = "0") Integer dateDay,
			
			@RequestParam(value = "orderByTime", defaultValue = "") String orderByTime,
			@RequestParam(value = "jianTime", defaultValue = "") String jianTime,
			@RequestParam(value = "orderByPrice", defaultValue = "") String orderByPrice,
			@RequestParam(value = "jianprice", defaultValue = "") String jianprice,
			@RequestParam(value = "indexPage", defaultValue = "1") Integer indexPage){
		Integer indexSize = 20;//默认每页显示行数
		if("".equals(likeName)){//模糊回显
			likeName=null;
		}
		if("".equals(brand)){//品牌
			brand=null;
		}
		if("".equals(orderByTime)){//最近时间
			orderByTime=null;
		}
		if("".equals(jianTime)){//最远时间
			jianTime=null;
		}
		if("".equals(orderByPrice)){//高价格
			orderByPrice=null;
		}
		if("".equals(jianprice)){//低价格
			jianprice=null;
		}
		likeName = Setchar.charset(likeName);
		brand = Setchar.charset(brand);
		
		
		
		//筛选后的所有产品
		List<Product> filtrateList = productServices.findNewProductClass(likeName,maxPrice, 
				minPrice, brand, hotProduct, phone, computer, clothing, food, dateDay, 
				orderByTime, jianTime, orderByPrice, jianprice, indexPage, indexSize);
		map.put("likeNameList", filtrateList);
		//筛选后的所有产品页数
		int countPage = productServices.findNewProductCount(likeName,maxPrice, minPrice, brand, 
				hotProduct, phone, computer, clothing, food, dateDay, orderByTime, 
				jianTime, orderByPrice, jianprice, indexSize);
		map.put("countPage", countPage);//总页数
		
		map.put("maxPrice", maxPrice);
		map.put("minPrice", minPrice);
		map.put("indexPage", indexPage);//页
		map.put("likeName", likeName);//回显搜索
		
		if(hotProduct !=0){
			return "portalJsp/categoryHot";
		}else if(dateDay !=0){
			return "portalJsp/category";
		}else if(phone !=0){
			return "portalJsp/categoryE";
		}else if(clothing !=0){
			return "portalJsp/categoryFood";
		}
		return "portalJsp/category";
	}

}
