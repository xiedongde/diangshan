package com.qc.diangshang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qc.diangshang.pojo.ProductImg;

public interface ProductImgMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProductImg record);

    int insertSelective(ProductImg record);

    int updateByPrimaryKeySelective(ProductImg record);

    int updateByPrimaryKey(ProductImg record);
    
  //添加图片
    int addSelective(List<ProductImg> list);
    
    //查询所有图片
    List<ProductImg> findProductImgAll(@Param("productId")Integer productId);
    
    
    
}