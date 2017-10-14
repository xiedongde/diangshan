package com.qc.diangshang.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.qc.diangshang.pojo.Areas;
import com.qc.diangshang.pojo.Cities;
import com.qc.diangshang.pojo.Provinces;
import com.qc.diangshang.pojo.Shipping;
import com.qc.diangshang.pojo.User;
import com.qc.diangshang.pojo.Zipcode;
import com.qc.diangshang.services.ShippingServices;

@Controller
@RequestMapping(value="/shipping/")
public class ShippingController {
	
	@Autowired
	private ShippingServices shippingServices;
	
	//添加收货地址
	@RequestMapping(value="addShipping")
	public String addShippingAll(Map<String, Object> map,HttpSession session,
			@RequestParam(value = "receiverName", defaultValue = "")String receiverName,
			@RequestParam(value = "receiverPhone", defaultValue = "")String receiverPhone,
			@RequestParam(value = "receiverMobile", defaultValue = "")String receiverMobile,
			@RequestParam(value = "receiverProvince", defaultValue = "")String receiverProvince,
			@RequestParam(value = "receiverCity", defaultValue = "")String receiverCity,
			@RequestParam(value = "receiverDistrict", defaultValue = "")String receiverDistrict,
			@RequestParam(value = "receiverAddress", defaultValue = "")String receiverAddress,
			@RequestParam(value = "receiverZip", defaultValue = "")String receiverZip){
		//获取用户id
		User users = (User) session.getAttribute("users");
		int userId = users.getId();
		Shipping shipping = new Shipping();
		
		shipping.setUserId(userId);
		shipping.setReceiverName(receiverName);
		shipping.setReceiverPhone(receiverPhone);
		shipping.setReceiverMobile(receiverMobile);
		shipping.setReceiverProvince(receiverProvince);
		shipping.setReceiverCity(receiverCity);
		shipping.setReceiverDistrict(receiverDistrict);
		shipping.setReceiverAddress(receiverAddress);
		shipping.setReceiverZip(receiverZip);
		
		int add = shippingServices.addShippingAll(shipping);
		if(add>0){}
		
		return "portalJsp/order";
				
	}
	
	//遍历地址
	@RequestMapping(value="site",produces= "text/html;charset=utf-8")
	public String ergodicSite(Map<String, Object> map,HttpSession session){
		//查询所有省
		List<Provinces> province = shippingServices.findProvinceAll();
		map.put("province", province);
		//根据用户id获取用户收货地址
		User users = (User) session.getAttribute("users");
		int userId = users.getId();
		List<Shipping> shipping =shippingServices.findByPrimaryKey(userId);
		map.put("shipping", shipping);
		
		return "portalJsp/order";
	}
	//ajax遍历地址
	@RequestMapping(value="ajaxSite",produces= "text/html;charset=utf-8")
	@ResponseBody
	public String ajaxSite(@RequestParam(value = "action", defaultValue = "")String action,
			@RequestParam(value = "id", defaultValue = "0")Integer id){
		
		if(action.equals("citys")){
			List<Cities> cities =shippingServices.findCitiesAll(id);
			String citiess = JSONObject.toJSONString(cities);
			return citiess;
		}
		if(action.equals("areas")){
			List<Areas> areas = shippingServices.findAreasAll(id);
			String areass = JSONObject.toJSONString(areas);
			return areass;
		}
		if(action.equals("zipcodes")){
			List<Zipcode> zipcode = shippingServices.findZipcodeAll(id);
			String zipcodes = JSONObject.toJSONString(zipcode);
			return zipcodes;
		}
		
		
		return "";
	}
}
