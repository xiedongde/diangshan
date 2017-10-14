package com.qc.diangshang.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qc.diangshang.dao.ProductImgMapper;
import com.qc.diangshang.pojo.ProductImg;
import com.qc.diangshang.services.ProductImgServices;

@Service
public class ProductImgServicesImpl implements ProductImgServices{
	
	@Autowired
	private ProductImgMapper productImgDao;

	//添加图片
	public int addSelective(List<ProductImg> record) {
		return productImgDao.addSelective(record);
	}
	//查询所有图片
	public List<ProductImg> findProductImgAll(Integer productId) {
		return productImgDao.findProductImgAll(productId);
	}

	
}
