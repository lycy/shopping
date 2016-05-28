package com.shopping.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class resValidate {
	
	public static boolean nameLength(String s){
		if(s == null || s.length() < 2 || s.length() > 10){
			return false;
		}else{
			return true;
		}
		
	}
	
	public static boolean pwdLength(String s){
		if(s == null || s.length() < 6 || s.length() > 12){
			return false;
		}else{
			return true;
		}
		
	}
	
	public static boolean isMobile(String mobile){
		String str="^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
	    Pattern p = Pattern.compile(str);     
	    Matcher m = p.matcher(mobile);         
	    return m.matches();    
	}
	
	
}
