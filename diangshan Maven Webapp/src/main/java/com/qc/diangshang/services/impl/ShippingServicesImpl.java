package com.qc.diangshang.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qc.diangshang.dao.AreasMapper;
import com.qc.diangshang.dao.CitiesMapper;
import com.qc.diangshang.dao.ProvincesMapper;
import com.qc.diangshang.dao.ShippingMapper;
import com.qc.diangshang.dao.ZipcodeMapper;
import com.qc.diangshang.pojo.Areas;
import com.qc.diangshang.pojo.Cities;
import com.qc.diangshang.pojo.Provinces;
import com.qc.diangshang.pojo.Shipping;
import com.qc.diangshang.pojo.Zipcode;
import com.qc.diangshang.services.ShippingServices;

@Service
public class ShippingServicesImpl implements ShippingServices{

	@Autowired
	private ShippingMapper shippingDao;
	@Autowired
	private ProvincesMapper provincesDao;
	@Autowired
	private CitiesMapper citiesDao;
	@Autowired
	private AreasMapper areasDao;
	@Autowired
	private ZipcodeMapper zipcodeDao;
	
	
	
	//根据用户id获取用户收货地址
	public List<Shipping> findByPrimaryKey(Integer userId) {
		return shippingDao.findByPrimaryKey(userId);
	}
	//添加用户收货地址
	public int addShippingAll(Shipping record) {
		return shippingDao.addShippingAll(record);
	}
	//删除收货地址
	public int deleteByPrimaryKey(Integer id) {
		return shippingDao.deleteByPrimaryKey(id);
	}
	
	
	//查询所有省
	public List<Provinces> findProvinceAll() {
		return provincesDao.findProvinceAll();
	}
	//市
	public List<Cities> findCitiesAll(Integer provinceid) {
		return citiesDao.findCitiesAll(provinceid);
	}
	//区
	public List<Areas> findAreasAll(Integer cityId) {
		return areasDao.findAreasAll(cityId);
	}
	//邮编
	public List<Zipcode> findZipcodeAll(Integer areaId) {
		return zipcodeDao.findZipcodeAll(areaId);
	}

}
