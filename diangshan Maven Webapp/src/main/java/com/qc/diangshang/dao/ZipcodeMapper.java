package com.qc.diangshang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qc.diangshang.pojo.Zipcode;

public interface ZipcodeMapper {
    int deleteByPrimaryKey(Integer id);
    int insert(Zipcode record);
    int insertSelective(Zipcode record);
    int updateByPrimaryKeySelective(Zipcode record);
    int updateByPrimaryKey(Zipcode record);

    //根据区id查询邮编
    List<Zipcode> findZipcodeAll(@Param("areaId")Integer areaId);
}