package com.qc.diangshang.dao;

import com.qc.diangshang.pojo.Barnner;

public interface BarnnerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Barnner record);

    int insertSelective(Barnner record);

    Barnner selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Barnner record);

    int updateByPrimaryKey(Barnner record);
}