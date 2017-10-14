package com.qc.diangshang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qc.diangshang.pojo.Cities;

public interface CitiesMapper {
    int deleteByPrimaryKey(Integer id);
    int insert(Cities record);
    int insertSelective(Cities record);
    int updateByPrimaryKeySelective(Cities record);
    int updateByPrimaryKey(Cities record);

    //根据省id查询所有市
    List<Cities> findCitiesAll(@Param("provinceid")Integer provinceid);
}