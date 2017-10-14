package com.qc.diangshang.services.impl;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qc.diangshang.dao.CategoryMapper;
import com.qc.diangshang.pojo.Category;
import com.qc.diangshang.services.CategoryServices;

@Service
public class CategoryServicesImpl implements CategoryServices{

	@Autowired
	private CategoryMapper categoryDao;

	//日志
	Logger log = LoggerFactory.getLogger(getClass());
	
	//获取品类子节点
	public List<Category> selectByPrimaryKey(Integer parentId) {
		return categoryDao.selectByPrimaryKey(parentId);
	}

	//增加节点
	public Integer addCategory(Integer parentId, String categoryName) {
		Integer add = categoryDao.addCategory(parentId, categoryName);
		if (add > 0) {
			log.info("msg", "添加品类成功");
		} else {
			log.info("msg", "添加品类失败");
		}
		return add;
	}

	//修改品类名
	public Integer updatecategoryName(Integer categoryId, String categoryName) {
		Integer upd = categoryDao.updatecategoryName(categoryId, categoryName);
		if (upd > 0) {
			log.info("msg", "更新品类名字成功");
		} else {
			log.info("msg", "更新品类名字失败");
		}
		return upd;
	}

}
