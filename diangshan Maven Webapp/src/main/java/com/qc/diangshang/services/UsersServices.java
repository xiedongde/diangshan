package com.qc.diangshang.services;

import com.qc.diangshang.pojo.User;

public interface UsersServices {
	
	/**
	 * 用户登录验证
	 * @param name
	 * @param password
	 * @return
	 */
	public User userLogin(String name,String password);
}
