package com.qc.diangshang.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONObject;
import com.qc.diangshang.pojo.Category;
import com.qc.diangshang.services.CategoryServices;

@Controller
@RequestMapping(value = "/manage/category/")
public class CategoryController {

	@Autowired
	private CategoryServices categoryServices;

	// 获取品类子节点
	@RequestMapping(value = "get_category.do")
	public String selectByPrimaryKey(
			Map<String, Object> map,
			HttpSession session,
			@RequestParam(value = "categoryId", defaultValue = "0") Integer categoryId) {

		// 判断是否登录
		if (null == session.getAttribute("users")) {
			map.put("msg", "您还没登录，请登录！");
			return "adminJsp/login";
		}

		List<Category> categoryList = categoryServices.selectByPrimaryKey(categoryId);
		if (null == categoryList) {
			map.put("msg", "未找到该品类");
		} else {
			map.put("category", categoryList);
		}

		return "adminJsp/category";
	}

	// 增加节点
	@RequestMapping(value = "add_category.do")
	public String addCategory(
			Map<String, Object> map,
			HttpSession session,
			@RequestParam(value = "parentId", defaultValue = "0") Integer parentId,
			String categoryName) {
		// 判断是否登录
		if (null == session.getAttribute("users")) {
			map.put("msg", "您还没登录，请登录！");
			return "adminJsp/login";
		}

		int add = categoryServices.addCategory(parentId, categoryName);
		if (add > 0) {
			map.put("msg", "添加品类成功");
		} else {
			map.put("msg", "添加品类失败");
		}

		return "adminJsp/category_add";
	}

	// 修改品类名
	@RequestMapping(value = "set_category_name.do")
	public String updatecategoryName(Map<String, Object> map,
			HttpSession session, Integer categoryId, String categoryName) {
		// 判断是否登录
		if (null == session.getAttribute("users")) {
			map.put("msg", "您还没登录，请登录！");
			return "adminJsp/login";
		}
		int set = categoryServices.updatecategoryName(categoryId, categoryName);
		if (set > 0) {
			map.put("msg", "更新品类名字成功");
		} else {
			map.put("msg", "更新品类名字失败");
		}

		return "adminJsp/category_add";
	}

	// 11、获取当前分类id及递归子节点categoryId
	@RequestMapping(value = "get_deep_category.do")
	public String get_deep_category(Map<String, Object> map,HttpSession session,HttpServletResponse response,
			@RequestParam(value = "categoryId", defaultValue = "0") Integer categoryId,
			@RequestParam(value = "action", defaultValue = "0") Integer action) throws IOException {
		List<Category> list =new ArrayList<Category>();
		PrintWriter out = response.getWriter();
		// 判断是否登录
		if (null == session.getAttribute("users")) {
			map.put("msg", "您还没登录，请登录！");
			return "adminJsp/login";
		}
		List<Category> categoryList = categoryServices.selectByPrimaryKey(categoryId);
		if(null !=categoryList){
			for(Category c:categoryList){
				list.add(c);
			}
		}
		for(Category l:categoryList){//遍历子节点，并查询子节点的子节点
			get_deep_category(map,session,response, l.getId(),action);//递归查询子节点的子节点
		}
		map.put("categoryList", list);
		String jsonCategory = JSONObject.toJSONString(list);
		out.print(jsonCategory);

		return "adminJsp/add_product";
	}
	//
	@RequestMapping(value="getcategoty")
	public String getcategoty(Map<String, Object> map,HttpSession session,HttpServletResponse response,
			@RequestParam(value = "categoryId", defaultValue = "0") Integer categoryId) throws IOException{
		PrintWriter out = response.getWriter();
		List<Category> categoryList = categoryServices.selectByPrimaryKey(categoryId);
		map.put("categoryList", categoryList);
		if(categoryId !=null){
			String jsonCategory = JSONObject.toJSONString(categoryList);
			out.print(jsonCategory);
		}
		
		return "adminJsp/add_product";
	}

}
