package com.qc.diangshang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qc.diangshang.pojo.Shipping;

public interface ShippingMapper {
    int insertSelective(Shipping record);
    int updateByPrimaryKeySelective(Shipping record);
    int updateByPrimaryKey(Shipping record);
    
    //根据用户id获取用户收货地址
    List<Shipping> findByPrimaryKey(@Param("userId")Integer userId);
    
    //添加用户收货地址
    int addShippingAll(Shipping record);

    //删除收货地址
    int deleteByPrimaryKey(@Param("id")Integer id);
}