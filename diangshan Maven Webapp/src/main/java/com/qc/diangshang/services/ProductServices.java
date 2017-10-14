package com.qc.diangshang.services;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.qc.diangshang.pojo.Product;

public interface ProductServices {
	
	/**
	 * 模糊分页查询所有商品
	 * @param productName 模糊查询的商品名
	 * @param pageNum		页
	 * @param pageSize		每页行数
	 * @return
	 */
	public List<Product> findProductAll(Integer pageNum,Integer pageSize,String productName);
	
	/**
	 * 模糊查询总商品行数
	 * @param productName 商品名
	 * @return
	 */
	public Integer findProductCount(String productName);
	
	/**
	 * 模糊查询总商品页数
	 * @param pageSize	每页行数
	 * @param productName 模糊查询的商品名
	 * @return
	 */
	public Integer findProductPage(Integer pageSize,String productName);
	
	/**
	 * 产品详情
	 * @param id 产品id
	 * @return
	 */
	public Product findProductDetails(Integer id);
	
	/**
	 * 商品下架(修改)
	 * @param status '商品状态，1-在售,2-下架,3-删除',
	 * @param id		'商品ID',
	 * @return
	 */
	public Integer updateProductStatus(Integer status,Integer id);
	
	/**
	 * 添加商品信息
	 * @param product 
	 * @return
	 */
	public Integer addProductAll(Product product);
	
	/**
	 * 修改商品信息
	 * @param product
	 * @return
	 */
	public Integer updateByPrimaryKeySelective(Product product);
	
	/**
	 * 产品搜索及动态排序List
	 * @param categoryId '分类id,引用类别表ID',
	 * @param keyword   关键字查询
	 * @param pageNum	每页起始行
	 * @param pageSize  每页行数
	 * @param priceDesc 价格排序（null值为升序）
	 * @return
	 */
	public List<Product> findProductOrderBy(Integer categoryId,String keyword,Integer pageNum,
			Integer pageSize,String priceDesc);
	
	/**
	 * 18、产品detail
	 * @param id 产品id
	 * @return
	 */
	public Product findByPrimaryKey(Integer id);
	
	
	
	  /**
     * 门户官网 
     */
	/**
	 * 商品搜索
	 * @param likeName
	 * @return
	 */
	public List<Product> findLikeName(String likeName,Integer indexSize);
	/**
	 *  新品
	 * @param dateDay  多少天前到现在发布
	 * @return
	 */
	public List<Product> findNewProduct(Integer dateDay,Integer indexSize);
	/**
	 * //热卖商品
	 * @param hotProduct
	 * @return
	 */
	public List<Product> findHotProduct(Integer hotProduct,Integer indexSize);
	/**
	 * //电子产品
	 * @param phone
	 * @param computer
	 * @return
	 */
	public List<Product> findElectronicProducts(Integer phone,Integer computer,Integer indexSize);
	/**
	 * //时尚食品
	 * @param clothing
	 * @param food
	 * @return
	 */
	public List<Product> findClothingFood(Integer clothing,Integer food,Integer indexSize);
    
	/**
	 * 分类页面加载 
	 * @param maxPrice	Integer 最大价格
	 * @param minPrice  Integer 最小价格
	 * @param brand     String 品牌
	 * @param hotProduct Integer 销量
	 * @param phone      Integer 手机 id
	 * @param computer	   Integer 电脑 id
	 * @param clothing   Integer 服装 id
	 * @param food		 Integer 食品  id
	 * @param dateDay	Integer 新品天数（距今天数）
	 * @param orderByTime  String	时间近
	 * @param jianTime		String  时间远
	 * @param orderByPrice  String	价格高
	 * @param jianprice		String  价格低
	 * @param indexPage	Integer 起始页数
	 * @param indexSize Integer 每页行数
	 * @return
	 */
	public List<Product> findNewProductClass(String likeName,Integer maxPrice,Integer minPrice,String brand,
			Integer hotProduct,Integer phone,Integer computer,Integer clothing,Integer food,
			Integer dateDay,String orderByTime,String jianTime,String orderByPrice,
			String jianprice,Integer indexPage,Integer indexSize);
	/**
	 * 获取分类页面 相应行数
	 * @param maxPrice	Integer 最大价格
	 * @param minPrice  Integer 最小价格
	 * @param brand     String 品牌
	 * @param hotProduct Integer 销量
	 * @param phone      Integer 手机 id
	 * @param computer	   Integer 电脑 id
	 * @param clothing   Integer 服装 id
	 * @param food		 Integer 食品  id
	 * @param dateDay	Integer 新品天数（距今天数）
	 * @param orderByTime  String	时间近
	 * @param jianTime		String  时间远
	 * @param orderByPrice  String	价格高
	 * @param jianprice		String  价格低
	 * @param indexSize Integer 每页行数
	 * @return
	 */
	public Integer findNewProductCount(String likeName,Integer maxPrice,Integer minPrice,String brand,
			Integer hotProduct,Integer phone,Integer computer,Integer clothing,Integer food,
			Integer dateDay,String orderByTime,String jianTime,String orderByPrice,
			String jianprice,Integer indexSize);
}
