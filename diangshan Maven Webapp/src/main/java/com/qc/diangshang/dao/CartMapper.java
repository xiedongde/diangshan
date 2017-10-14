package com.qc.diangshang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qc.diangshang.pojo.Cart;

public interface CartMapper {

    int insertSelective(Cart record);
    int updateByPrimaryKeySelective(Cart record);
    int updateByPrimaryKey(Cart record);

    //添加购物车商品
    int addProdctAll(Cart record);
    
    //删除购物车商品
    int deleteByPrimaryKey(@Param("cartId")Integer cartId);
    
    //根据id查询购物车
    Cart findCart(@Param("cartId")Integer cartId);
   
    //根据用户名和商品id查询购物车
    Cart findByPrimaryKey(@Param("productId")Integer productId,@Param("userId")Integer userId);
    //修改购物车商品数量
    int updateQuantity(@Param("quantity")Integer quantity,@Param("productId")Integer productId
    		,@Param("userId")Integer userId);
    
    //查询当前用户所有购物车商品 
    List<Cart> findCartAll(@Param("userId")Integer userId);
    
    //查询当前用户所有被选中购物车商品
    List<Cart> findCartCheckedAll(@Param("checked")Integer checked,@Param("userId")Integer userId);
    
    //修改是否被选中
    int updateChecked(@Param("checked")Integer checked,@Param("cartId")Integer cartId);
    
}