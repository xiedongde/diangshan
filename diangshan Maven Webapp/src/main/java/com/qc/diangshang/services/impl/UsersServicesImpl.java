package com.qc.diangshang.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qc.diangshang.dao.UserMapper;
import com.qc.diangshang.pojo.User;
import com.qc.diangshang.services.UsersServices;
import com.qc.diangshang.util.MD5;

@Service
public class UsersServicesImpl implements UsersServices{
	
	@Autowired
	private UserMapper UserDao;

	public User userLogin(String name, String password) {
		password = MD5.getMd5(password);
		return UserDao.userLogin(name, password);
	}

}
