package com.qc.diangshang.dao;

import org.apache.ibatis.annotations.Param;

import com.qc.diangshang.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User userLogin(@Param("name")String name,@Param("password")String password);



}