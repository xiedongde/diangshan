package com.qc.diangshang.services;

import java.util.List;

import com.qc.diangshang.pojo.ProductImg;

public interface ProductImgServices {

	/**
	 * 添加图片
	 * @param record
	 * @return
	 */
	public int addSelective(List<ProductImg> record);
	/**
	 * 根据商品id查询所有商品图片信息
	 * @param productId 商品id
	 * @return
	 */
	public List<ProductImg> findProductImgAll(Integer productId);
}
