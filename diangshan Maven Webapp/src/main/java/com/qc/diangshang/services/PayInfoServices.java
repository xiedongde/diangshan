package com.qc.diangshang.services;

import com.qc.diangshang.pojo.PayInfo;

public interface PayInfoServices {

	/**
	 * 支付（支付宝生成订单）
	 * @param record
	 * @return
	 */
	public int addPayInfoSelective(PayInfo record);
}
