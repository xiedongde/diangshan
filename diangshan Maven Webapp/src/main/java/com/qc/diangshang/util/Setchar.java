package com.qc.diangshang.util;

import java.io.UnsupportedEncodingException;

public class Setchar {
		
	public static String charset(String utf){
		if("".equals(utf)){
			utf=null;
		}
		if(null !=utf){
			try {
				utf = new String(utf.getBytes("iso-8859-1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return utf;
	}
}
