package com.qc.diangshang.dao;

import com.qc.diangshang.pojo.Grade;

public interface GradeMapper {
    int deleteByPrimaryKey(Integer code);

    int insert(Grade record);

    int insertSelective(Grade record);

    Grade selectByPrimaryKey(Integer code);

    int updateByPrimaryKeySelective(Grade record);

    int updateByPrimaryKey(Grade record);
}