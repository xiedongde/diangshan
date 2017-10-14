package com.qc.diangshang.dao;

import com.qc.diangshang.pojo.ProductColor;

public interface ProductColorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProductColor record);

    int insertSelective(ProductColor record);

    ProductColor selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProductColor record);

    int updateByPrimaryKey(ProductColor record);
}