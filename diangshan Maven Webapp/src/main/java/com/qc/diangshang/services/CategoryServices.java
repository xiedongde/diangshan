package com.qc.diangshang.services;


import java.util.List;

import com.qc.diangshang.pojo.Category;

public interface CategoryServices {
	
	/**
	 * 获取品类子节点
	 * @param id 品类id
	 * @return
	 */
	public List<Category> selectByPrimaryKey(Integer parentId);
	
	/**
	 * 增加节点
	 * @param parentId 节点id
	 * @param categoryName 品类名
	 * @return
	 */
	public Integer addCategory(Integer parentId, String categoryName);
	
	/**
	 * 修改品类名
	 * @param categoryId 品类id
	 * @param categoryName 品类名
	 * @return
	 */
	public Integer updatecategoryName(Integer categoryId,String categoryName);
}
