package com.qc.diangshang.services.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qc.diangshang.dao.OrderMapper;
import com.qc.diangshang.services.OrderServices;

@Service
public class OrderServicesImpl implements OrderServices{

	@Autowired
	private OrderMapper OrderDao;
	//日志
	Logger log = LoggerFactory.getLogger(getClass());
	// 13、订单List or 按订单号查询
	public List<Map<String, Object>> findOrderAll(Integer pageNum, Integer pageSize,
			Long orderNo) {
		pageNum = (pageNum-1)*pageSize;
		return OrderDao.findOrderAll(pageNum, pageSize, orderNo);
	}

	//订单详情
	public Map<String, Object> findOrderOrderItemShippingAll(Long orderNo) {
		return OrderDao.findOrderOrderItemShippingAll(orderNo);
	}

	//订单发货
	public int updateOrderStatus(Integer status, Long orderNo) {
		int upd = OrderDao.updateOrderStatus(status, orderNo);
		if(upd>0){
			log.info("msg", "发货成功");
		}else{
			log.info("msg", "发货失败");
		}
		return upd;
	}

}
