package com.qc.diangshang.services;

import java.util.List;

import com.qc.diangshang.pojo.Areas;
import com.qc.diangshang.pojo.Cities;
import com.qc.diangshang.pojo.Provinces;
import com.qc.diangshang.pojo.Shipping;
import com.qc.diangshang.pojo.Zipcode;

public interface ShippingServices {
	
	/**
	 * 根据用户id获取用户收货地址
	 * @param userId
	 * @return
	 */
	public List<Shipping> findByPrimaryKey(Integer userId);
	/**
	 * 添加用户收货地址
	 * @param record
	 * @return
	 */
	public int addShippingAll(Shipping record);
	/**
	 * 删除收货地址
	 * @param id
	 * @return
	 */
	public  int deleteByPrimaryKey(Integer id);
	
	
	/**
	 * 查询所有省
	 * @return
	 */
	public List<Provinces> findProvinceAll();
	/**
	 * 根据省id查询所有市
	 * @param provinceid
	 * @return
	 */
	public List<Cities> findCitiesAll(Integer provinceid);
	/**
	 * 根据市id查询所有区
	 * @param cityId
	 * @return
	 */
	public List<Areas> findAreasAll(Integer cityId);
	/**
	 * 根据区id查询邮编
	 * @param areaId
	 * @return
	 */
	public List<Zipcode> findZipcodeAll(Integer areaId);
}
