package com.qc.diangshang.dao;

import com.qc.diangshang.pojo.PayInfo;

public interface PayInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PayInfo record);

    int insertSelective(PayInfo record);

    PayInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PayInfo record);

    int updateByPrimaryKey(PayInfo record);
    
  //支付（支付宝生成订单）
    int addPayInfoSelective(PayInfo record);
}