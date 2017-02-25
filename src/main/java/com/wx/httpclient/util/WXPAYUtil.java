package com.wx.httpclient.util;

import com.wx.httpclient.common.Constants;
import com.wx.httpclient.entity.Unifiedorder;
import com.wx.httpclient.entity.UnifiedorderResponse;
import com.youarenotin.jkl.util.InterfaceUtil;
import com.youarenotin.jkl.util.XMLUtil;


public class WXPAYUtil {	
	
	/**
	 * 预充值
	 * 
	 * @return UnifiedorderResponse
	 */
//	public static UnifiedorderResponse rechargeByWX(Wallet w, String ip){
//		Unifiedorder u = new Unifiedorder();
//		BigDecimal bodyBD = w.getMoney().divide(new BigDecimal(100));
//		u.setBody("余额充值 "+bodyBD.toPlainString() +"元");
//		u.setOut_trade_no(w.getOrders_id());
//		u.setTotal_fee(w.getMoney().toPlainString());
//		u.setSpbill_create_ip(ip);
//		u.setNotify_url(Constants.CALLBACK_SERVER_HOST_PRE);
//		u.setTrade_type(Constants.TRADE_TYPE_APP);
//		u.setAttach(String.valueOf(w.getUid()));
//
//		return WXPAYUtil.unifiedorder(u);
//	}
	
	/**
	 * 预消费
	 * 
	 * @return UnifiedorderResponse
	 */
//	public static UnifiedorderResponse payByWX(Wallet w,String ip){
//		Unifiedorder u = new Unifiedorder();
//		u.setBody("消费 "+w.getMoney().divide(new BigDecimal(100)).toPlainString() +"元");
//		u.setOut_trade_no(w.getOrders_id());
//		u.setTotal_fee(w.getMoney().toPlainString());
//		u.setSpbill_create_ip(ip);
//		u.setNotify_url(Constants.CALLBACK_SERVER_HOST_PRE);
//		u.setTrade_type(Constants.TRADE_TYPE_APP);
//		u.setAttach(String.valueOf(w.getUid()));
//
//		return WXPAYUtil.unifiedorder(u);
//	}
	
	/**
	 * 统一下单
	 * 
	 * @return UnifiedorderResponse
	 */
	public static UnifiedorderResponse unifiedorder(Unifiedorder order){
		String xml = XMLUtil.convertToXml(order);
		String rxmlStr = InterfaceUtil.PostRequestForXML(xml, Constants.API_HTTP_SCHEMA +"://"+Constants.API_SERVER_UNIFIEDORDER);
		UnifiedorderResponse res = XMLUtil.converyToJavaBean(rxmlStr, UnifiedorderResponse.class);
		System.out.println(res.getErr_code());
		return res;
	}
	
	/**
	 * 查询订单
	 * 
	 * @return UnifiedorderResponse
	 */
	public static UnifiedorderResponse orderquery(String orders_id){
		Unifiedorder order = new Unifiedorder();
		order.setOut_trade_no(orders_id);
		String xml = XMLUtil.convertToXml(order);
		String rxmlStr = InterfaceUtil.PostRequestForXML(xml, Constants.API_HTTP_SCHEMA +"://"+Constants.API_SERVER_ORDERQUERY);
		UnifiedorderResponse res = XMLUtil.converyToJavaBean(rxmlStr, UnifiedorderResponse.class);
		
		return res;

	}
	
	/**
	 * 关闭订单
	 * 
	 * @return UnifiedorderResponse
	 */
	public static UnifiedorderResponse closeorder(String orders_id){
		Unifiedorder order = new Unifiedorder();
		order.setOut_trade_no(orders_id);
		String xml = XMLUtil.convertToXml(order);
		String rxmlStr = InterfaceUtil.PostRequestForXML(xml, Constants.API_HTTP_SCHEMA +"://"+Constants.API_SERVER_CLOSEORDER);
		UnifiedorderResponse res = XMLUtil.converyToJavaBean(rxmlStr, UnifiedorderResponse.class);
		
		return res;

	}
}
