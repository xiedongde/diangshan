package com.qc.diangshang.util;

import javax.servlet.http.HttpSession;

import com.qc.diangshang.pojo.User;

public class IUsersVerify {
	
	public static void users(){
		
	}
	//判断是否是管理员 '角色0-管理员，1-普通用户',
	public static boolean ifRole(HttpSession session){
		User user = (User) session.getAttribute("users");
		if(null != user){
			Integer role = user.getRole();
			if(role ==1){
				return true;
			}
		}
		return false;
	}
}
