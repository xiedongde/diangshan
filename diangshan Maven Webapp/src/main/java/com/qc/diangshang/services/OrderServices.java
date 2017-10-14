package com.qc.diangshang.services;

import java.util.List;
import java.util.Map;


public interface OrderServices {

	/**
	 * 订单List or 按订单号查询
	 * @param pageNum	
	 * @param pageSize 每页行数
	 * @param orderNo 订单号
	 * @return
	 */
	public List<Map<String, Object>> findOrderAll(Integer pageNum,Integer pageSize,Long orderNo);
	
	/**
	 * 订单详情
	 * @param orderNo 订单号
	 * @return
	 */
	public Map<String, Object> findOrderOrderItemShippingAll(Long orderNo);
	
	/**
	 * 订单发货
	 * @param status '订单状态:0-已取消-10-未付款，20-已付款，40-已发货，50-交易成功，60-交易关闭',
	 * @param orderNo  订单号
	 * @return
	 */
	public int updateOrderStatus(Integer status,Long orderNo);
}
