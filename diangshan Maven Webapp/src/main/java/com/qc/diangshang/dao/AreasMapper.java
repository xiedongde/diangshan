package com.qc.diangshang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qc.diangshang.pojo.Areas;

public interface AreasMapper {
    int deleteByPrimaryKey(Integer id);
    int insert(Areas record);
    int insertSelective(Areas record);
    int updateByPrimaryKeySelective(Areas record);
    int updateByPrimaryKey(Areas record);

    //根据市id查询所有区
    List<Areas> findAreasAll(@Param("cityId")Integer cityId);
}