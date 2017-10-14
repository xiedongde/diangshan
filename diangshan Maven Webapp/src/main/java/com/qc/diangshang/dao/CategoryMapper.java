package com.qc.diangshang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qc.diangshang.pojo.Category;

public interface CategoryMapper {
    int deleteByPrimaryKey(Integer id);
    int insert(Category record);
    int insertSelective(Category record);
    int updateByPrimaryKeySelective(Category record);
    int updateByPrimaryKey(Category record);
    
  //获取品类子节点
    List<Category> selectByPrimaryKey(Integer parentId);
    //增加节点
    Integer addCategory(@Param("parentId")Integer parentId,@Param("categoryName")String categoryName);
    //修改品类名
    Integer updatecategoryName(@Param("categoryId")Integer categoryId,@Param("categoryName")String categoryName);
}