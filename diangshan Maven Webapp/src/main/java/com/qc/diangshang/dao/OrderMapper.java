package com.qc.diangshang.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.qc.diangshang.pojo.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
 // 13、订单List or 按订单号查询
 	List<Map<String, Object>> findOrderAll(@Param("pageNum") Integer pageNum,
 			@Param("pageSize") Integer pageSize,
 			@Param("orderNo") Long orderNo);
 	
 	//订单详情
 	Map<String, Object> findOrderOrderItemShippingAll(@Param("orderNo") Long orderNo);
 	
 	//订单发货
 	int updateOrderStatus(@Param("status")Integer status,@Param("orderNo")Long orderNo);
}