package com.qc.diangshang.services.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qc.diangshang.dao.PayInfoMapper;
import com.qc.diangshang.pojo.PayInfo;
import com.qc.diangshang.services.PayInfoServices;

@Service
public class PayInfoServicesImpl implements PayInfoServices{

	@Autowired
	private PayInfoMapper payInfoMapper;
	//日志
	Logger log = LoggerFactory.getLogger(getClass());
	
	//支付（支付宝生成订单）
	public int addPayInfoSelective(PayInfo record) {
		int add = payInfoMapper.addPayInfoSelective(record);
		if(add>0){
			log.info("支付宝生成订单成功！");
		}else{
			log.info("支付宝生成订单失败！");
		}
		return add;
	}

	
	
}
