package com.wx.httpclient.entity;


import com.youarenotin.jkl.util.XMLUtil;

public class Testmain {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Unifiedorder u = new Unifiedorder();
		u.setAppid("aaa");
		u.setDevice_info("sdafdsa");
		System.out.println(u.getSign());
		String xml = XMLUtil.convertToXml(u);
		System.out.println(xml);
	}

}
