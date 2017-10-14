package com.qc.diangshang.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.qc.diangshang.pojo.Product;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer id);
    int insert(Product record);
    int insertSelective(Product record);
    Product selectByPrimaryKey(Integer id);
    int updateByPrimaryKey(Product record);
    
  //关键字分页查询所有商品
  	List<Product> findProductAll(@Param("pageNum")Integer pageNum, @Param("pageSize")Integer pageSize,
  			@Param("productName")String productName);
  	//关键字分页查询总行数
  	Integer findProductCount(@Param("productName")String productName);
  	//产品详情
  	Product findProductDetails(@Param("id")Integer id);
  	//商品下架(修改)
  	Integer updateProductStatus(@Param("status")Integer status,@Param("id")Integer id);
  	//添加商品
  	Integer addProductAll(Product product);
  	//修改商品
  	Integer updateByPrimaryKeySelective(Product product);
  	//产品搜索及动态排序List
  	List<Product> findProductOrderBy(Map<String, Object> map);
  	//18、产品detail
      Product findByPrimaryKey(@Param("id")Integer id);
      
      /**
       * 门户官网 
       */
    //商品搜索
      List<Product> findLikeName(@Param("likeName")String likeName,@Param("indexSize")Integer indexSize);
    //新品
      List<Product> findNewProduct(@Param("dateDay")Integer dateDay,@Param("indexSize")Integer indexSize);
    //热卖商品
      List<Product> findHotProduct(@Param("hotProduct")Integer hotProduct,@Param("indexSize")Integer indexSize);
    //电子产品
      List<Product> findElectronicProducts(@Param("phone")Integer phone,@Param("computer")Integer computer,@Param("indexSize")Integer indexSize);
    //时尚食品
      List<Product> findClothingFood(@Param("clothing")Integer clothing,@Param("food")Integer food,@Param("indexSize")Integer indexSize);
      
      /**
       * 分类主页
       */
      //分类主页筛选
      List<Product> findNewProductClass(Map<String, Object> map);
      //分类主页筛选行数
      Integer findNewProductCount(Map<String, Object> map);
      
      
      
      
      
}