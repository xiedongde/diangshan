package com.qc.diangshang.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.qc.diangshang.pojo.PayInfo;
import com.qc.diangshang.pojo.User;
import com.qc.diangshang.services.PayInfoServices;

@Controller
@RequestMapping(value = "/payInfo/")
public class PayInfoContrller {

	@Autowired
	private PayInfoServices payInfoServices;

	@RequestMapping(value = "pay.do")
	public String addPayInfoSelective(Map<String, Object> map,HttpSession session,
			@RequestParam(value = "orderNo", defaultValue = "0") Long orderNo) {
		// 判断是否登录
		if (null == session.getAttribute("users")) {
			map.put("msg", "您还没登录，请登录！");
			return "adminJsp/login";
		}
		User user = (User) session.getAttribute("users");
		Integer userId = user.getId();
		
		PayInfo record = new PayInfo();
		record.setUserId(userId);
		record.setOrderNo(orderNo);
		
		int add = payInfoServices.addPayInfoSelective(record);
		if(add>0){
			map.put("msg","支付宝生成订单成功！");
		}else{
			map.put("msg","支付宝生成订单失败！");
		}
		return "";
	}
}
