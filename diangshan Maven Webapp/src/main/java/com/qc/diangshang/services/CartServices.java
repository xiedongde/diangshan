package com.qc.diangshang.services;

import java.util.List;

import com.qc.diangshang.pojo.Cart;

public interface CartServices {

	/**
	 * 添加商品到购物车
	 * @param record
	 * @return
	 */
	public int addProdctAll(Cart record);
	/**
	 * 根据id查询购物车
	 * @param cartId
	 * @return
	 */
	public Cart findCart(Integer cartId);
	/**
	 * 删除购物车商品
	 * @param id
	 * @return
	 */
	public int deleteByPrimaryKey(Integer cartId);
	/**
	 * 根据用户名和商品id查询购物车
	 * @param productId
	 * @param userId
	 * @return
	 */
	public Cart findByPrimaryKey(Integer productId,Integer userId);
	/**
	 * 修改购物车商品数量
	 * @param quantity
	 * @param userId
	 * @return
	 */
	public int updateQuantity(Integer quantity,Integer productId,Integer userId);
	/**
	 * 查询当前用户所有购物车商品
	 * @param id
	 * @return
	 */
	public List<Cart> findCartAll(Integer userId);
	/**
	 * 查询当前用户所有被选中购物车商品
	 * @param checked  0未选中 1选中
	 * @param userId   用户id
	 * @return
	 */
	public List<Cart> findCartCheckedAll(Integer checked,Integer userId);
	/**
	 * 修改是否被选中
	 * @param cartId
	 * @return
	 */
	public int updateChecked(Integer checked,Integer cartId);
	
}
