package com.wx.httpclient.util;

import com.wx.httpclient.common.Constants;
import com.youarenotin.jkl.util.MD5;
import com.youarenotin.jkl.util.StringUtil;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;



public class SignUtil {
	public static String sign(Map<String,String> map){
		StringBuilder sb = new StringBuilder();
		List<String> keylist = new ArrayList<String>(map.keySet());
		Collections.sort(keylist);
		for(String key:keylist){

			String value = map.get(key);
			if(!StringUtil.isNull(value)){
				sb.append(key);
				sb.append("=");
				sb.append(value);
				sb.append("&");
			}

		}
		
		String stringSignTemp  = sb.toString()+"key="+ Constants.SECURITY_KEY;
		return MD5.md5(stringSignTemp).toUpperCase();
	}
}
