package com.qc.diangshang.util;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {

	/**
	 * @author admin
	 * @param str
	 *            明文
	 * @return String MD5加密后的字符串
	 * @time 2017 下午2:56:31
	 * @desc 对 str 进行MD5加密
	 * 
	 */
	public static String getMd5(String str) {
		try {

			MessageDigest md5 = MessageDigest.getInstance("MD5");
			return new BigInteger(1, md5.digest(str.getBytes("UTF-8"))).toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) {
		
		System.out.println(getMd5("123456"));
		
	}
}

