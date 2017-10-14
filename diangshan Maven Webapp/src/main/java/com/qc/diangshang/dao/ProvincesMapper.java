package com.qc.diangshang.dao;

import java.util.List;

import com.qc.diangshang.pojo.Provinces;

public interface ProvincesMapper {
    int deleteByPrimaryKey(Integer id);
    int insert(Provinces record);
    int insertSelective(Provinces record);
    int updateByPrimaryKeySelective(Provinces record);
    int updateByPrimaryKey(Provinces record);
    
    //查询所有省
    List<Provinces> findProvinceAll();
}