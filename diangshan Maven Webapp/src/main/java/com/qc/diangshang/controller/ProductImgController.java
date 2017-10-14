package com.qc.diangshang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qc.diangshang.pojo.ProductImg;
import com.qc.diangshang.services.ProductImgServices;

@Controller
@RequestMapping(value="")
public class ProductImgController {
	
	@Autowired
	private ProductImgServices ProductImgServices;
	
	@RequestMapping(value="")
	public String addProductImg(List<ProductImg> record){
		ProductImgServices.addSelective(record);
		
		return "";
	}

}
