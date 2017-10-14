package com.qc.diangshang.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.qc.diangshang.services.OrderServices;

@Controller
@RequestMapping(value = "/manage/order/")
public class OrderController {

	@Autowired
	private OrderServices orderServices;

	// 13、订单List or 按订单号查询
	@RequestMapping(value = "search.do")
	public String findOrderAll(
			Map<String, Object> map,
			HttpSession session,
			@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "orderNo", defaultValue = "") Long orderNo) {
		// 判断是否登录
		if (null == session.getAttribute("users")) {
			map.put("msg", "您还没登录，请登录！");
			return "adminJsp/login";
		}
		List<Map<String, Object>> orderList = orderServices.findOrderAll(pageNum, pageSize,
				orderNo);
		if (null == orderList) {
			map.put("msg", "没有找到订单");
		}
		map.put("orderList", orderList);
		map.put("pageNum", pageNum);
		map.put("pageSize", pageSize);
		map.put("orderNo", orderNo);
		return "adminJsp/order";
	}

	// 订单详情
	@RequestMapping(value = "detail.do")
	public String orderDetail(Map<String, Object> map, HttpSession session,
			@RequestParam(value = "orderNo", defaultValue = "") Long orderNo) {
		// 判断是否登录
		if (null == session.getAttribute("users")) {
			map.put("msg", "您还没登录，请登录！");
			return "adminJsp/login";
		}
		Map<String, Object> maps = orderServices.findOrderOrderItemShippingAll(orderNo);
		if (null == maps) {
			map.put("msg", "没有找到订单");
		}
		map.put("detail", maps);

		return "adminJsp/order_item";
	}

	// 订单发货
	@RequestMapping(value = "send_goods.do")
	public String updateOrderStatus(Map<String, Object> map,
			HttpSession session,
			@RequestParam(value = "orderNo", defaultValue = "") Long orderNo) {
		// 判断是否登录
		if (null == session.getAttribute("users")) {
			map.put("msg", "您还没登录，请登录！");
			return "adminJsp/login";
		}
		Integer status = 40;//表示订单发货
		int upd = orderServices.updateOrderStatus(status, orderNo);
		if(upd>0){
			map.put("msg", 6);
		}
		map.put("msg", "发货失败");

		return "adminJsp/order_item";
	}
	
	
	
	
}
