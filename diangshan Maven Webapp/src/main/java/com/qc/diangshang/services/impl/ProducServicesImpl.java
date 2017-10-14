package com.qc.diangshang.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qc.diangshang.dao.ProductImgMapper;
import com.qc.diangshang.dao.ProductMapper;
import com.qc.diangshang.pojo.Product;
import com.qc.diangshang.pojo.ProductImg;
import com.qc.diangshang.services.ProductServices;

@Service
public class ProducServicesImpl implements ProductServices {

	@Autowired
	private ProductMapper ProductDao;
	
	@Autowired
	private ProductImgMapper productImgMapper;
	// 日志
	Logger log = LoggerFactory.getLogger(getClass());

	// 模糊分页查询所有商品
	public List<Product> findProductAll(Integer pageNum, Integer pageSize,
			String productName) {
		pageNum = (pageNum - 1) * pageSize;
		return ProductDao.findProductAll(pageNum, pageSize, productName);
	}

	// 模糊查询总行数
	public Integer findProductCount(String productName) {
		return ProductDao.findProductCount(productName);
	}

	// 模糊查询总页数
	public Integer findProductPage(Integer pageSize, String productName) {
		Integer count = ProductDao.findProductCount(productName);
		if (count % pageSize == 0) {
			return count / pageSize;
		} else {
			return count / pageSize + 1;
		}
	}

	// 产品详情
	public Product findProductDetails(Integer id) {
		return ProductDao.findProductDetails(id);
	}

	// 商品下架(修改)
	public Integer updateProductStatus(Integer status, Integer id) {
		return ProductDao.updateProductStatus(status, id);
	}

	// 添加商品
	public Integer addProductAll(Product product) {
		//设置主图
		this.setMainImg(product);
		
		int add = ProductDao.addProductAll(product);
		
		log.debug("添加之后的图片ID为{}",product.getId());
		
		if (add != 0) {
			log.info("msg", "添加商品成功！");
			//把图片地址添加到商品图片表--5--1
				//掉用dao层添加sql语句
			int i = productImgMapper.addSelective(this.addProductImg(product));
			if(i>0){
				log.debug("图片添加成功"+i);
				return i;
			}else{
				log.debug("图片添加失败"+i);
				log.debug("图片添加成功"+i);
			}
		} else {
			log.info("msg", "添加商品失败！");
		}
		return add;
		
	}

	// 添加图片 //设置主图
	public Product setMainImg(Product product){
		//解析HTML文件
		Document doc = Jsoup.parse(product.getSubImages());
		Elements el = doc.select("img");
		for(Element e : el){
			product.setMainImage(e.attr("src"));//设置主图
			return product;
		}
		return product;
	}
	// 添加图片   上传图片
	public List<ProductImg> addProductImg(Product product) {
		
		List<ProductImg> imgList = new ArrayList<ProductImg>();
		
		Document doc = Jsoup.parse(product.getSubImages());
		log.debug("doc="+doc);
		Elements el = doc.select("img");
		log.debug("el="+el);
		for(Element e : el){
			ProductImg img = new ProductImg();
			img.setDetail(e.attr("src"));
			log.debug("图片地址为--"+e.attr("src"));
			img.setProductId(product.getId());
			imgList.add(img);
		}
		return imgList;
	}

	// 修改商品
	public Integer updateByPrimaryKeySelective(Product product) {
		int upd = ProductDao.updateByPrimaryKeySelective(product);
		if (upd > 0) {
			log.info("msg", "修改商品成功！");
		} else {
			log.info("msg", "修改商品失败！");
		}
		return upd;
	}

	// 产品搜索及动态排序List
	public List<Product> findProductOrderBy(Integer categoryId, String keyword,
			Integer pageNum, Integer pageSize, String priceDesc) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryId", categoryId);
		map.put("keyword", keyword);
		map.put("pageNum", pageNum);
		map.put("pageSize", pageSize);
		map.put("priceDesc", priceDesc);
		return ProductDao.findProductOrderBy(map);
	}

	// 18、产品detail
	public Product findByPrimaryKey(Integer id) {
		return ProductDao.findByPrimaryKey(id);
	}

	/**
     * 门户官网 
     */
	//产品搜索
	public List<Product> findLikeName(String likeName,Integer indexSize) {
		// likeName  商品副标题   和   商品名称
		return ProductDao.findLikeName(likeName,indexSize);
	}
	//新产品
	public List<Product> findNewProduct(Integer dateDay,Integer indexSize) {
		//hot_sale 1-普通,2-新品
		dateDay = -20;
		return ProductDao.findNewProduct(dateDay,indexSize);
	}
	//畅销产品
	public List<Product> findHotProduct(Integer hotProduct,Integer indexSize) {
		// sales_volume >=15
		hotProduct = 15;
		return ProductDao.findHotProduct(hotProduct,indexSize);
	}
	//电子产品
	public List<Product> findElectronicProducts(Integer phone, Integer computer,Integer indexSize) {
		// 手机 类型 10010 电脑类型 10011
		phone = 10010;
		computer = 10011;
		return ProductDao.findElectronicProducts(phone, computer,indexSize);
	}
	//时尚食品
	public List<Product> findClothingFood(Integer clothing, Integer food,Integer indexSize) {
		// 服装 类型 10012    食品类型 10013
		clothing = 10012;
		food = 10013;
		return ProductDao.findClothingFood(clothing, food,indexSize);
	}
	//分类页面加载 
	public List<Product> findNewProductClass(String likeName,Integer maxPrice,
			Integer minPrice, String brand, Integer hotProduct, Integer phone,
			Integer computer, Integer clothing, Integer food, Integer dateDay,
			String orderByTime,String jianTime,String orderByPrice,
			String jianprice,Integer indexPage,Integer indexSize) {
		int index = (indexPage-1)*indexSize;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("likeName", likeName);
		map.put("maxPrice", maxPrice);
		map.put("minPrice", minPrice);
		map.put("brand", brand);
		map.put("hotProduct", hotProduct);
		map.put("phone", phone);
		map.put("computer", computer);
		map.put("clothing", clothing);
		map.put("food", food);
		map.put("dateDay", dateDay);
		map.put("orderByTime", orderByTime);
		map.put("jianTime", jianTime);
		map.put("orderByPrice", orderByPrice);
		map.put("jianprice", jianprice);
		map.put("indexPage", index);
		map.put("indexSize", indexSize);
		return ProductDao.findNewProductClass(map);
	}
	//获取分类页面 相应行数  返回总页数
	public Integer findNewProductCount(String likeName,Integer maxPrice,
			Integer minPrice, String brand, Integer hotProduct, Integer phone,
			Integer computer, Integer clothing, Integer food, Integer dateDay,
			String orderByTime,String jianTime,String orderByPrice,
			String jianprice,Integer indexSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("likeName", likeName);
		map.put("maxPrice", maxPrice);
		map.put("minPrice", minPrice);
		map.put("brand", brand);
		map.put("hotProduct", hotProduct);
		map.put("phone", phone);
		map.put("computer", computer);
		map.put("clothing", clothing);
		map.put("food", food);
		map.put("dateDay", dateDay);
		map.put("orderByTime", orderByTime);
		map.put("jianTime", jianTime);
		map.put("orderByPrice", orderByPrice);
		map.put("jianprice", jianprice);
		map.put("indexSize", indexSize);
		Integer count = ProductDao.findNewProductCount(map);
		if(count%indexSize==0){
			return count/indexSize;
		}else{
			return count/indexSize+1;
		}
	}

}
