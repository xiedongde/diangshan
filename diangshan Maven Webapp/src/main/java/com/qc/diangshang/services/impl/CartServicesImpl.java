package com.qc.diangshang.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qc.diangshang.dao.CartMapper;
import com.qc.diangshang.pojo.Cart;
import com.qc.diangshang.services.CartServices;

@Service
public class CartServicesImpl implements CartServices{

	@Autowired
	private CartMapper cartMapper;
	
	//添加商品到购物车
	public int addProdctAll(Cart record) {
		return cartMapper.addProdctAll(record);
	}
	//删除购物车商品
	public int deleteByPrimaryKey(Integer cartId) {
		return cartMapper.deleteByPrimaryKey(cartId);
	}
	//根据id查询购物车
	public Cart findCart(Integer cartId) {
		return cartMapper.findCart(cartId);
	}
    //查询购物车商品
	public Cart findByPrimaryKey(Integer productId,Integer userId) {
		return cartMapper.findByPrimaryKey(productId, userId);
	}
	//修改购物车商品数量
	public int updateQuantity(Integer quantity, Integer productId,Integer userId) {
		return cartMapper.updateQuantity(quantity, productId,userId);
	}
	
	//查询当前用户所有购物车商品 
	public List<Cart> findCartAll(Integer userId) {
		return cartMapper.findCartAll(userId);
	}
	//修改是否被选中
	public int updateChecked(Integer checked,Integer cartId) {
		return cartMapper.updateChecked(checked,cartId);
	}
	//查询当前用户所有被选中购物车商品
	public List<Cart> findCartCheckedAll(Integer checked, Integer userId) {
		return cartMapper.findCartCheckedAll(checked, userId);
	}

	
	
	
}
