package com.wx.httpclient.common;

/**
 * Constants
 * 
 * @author Lynch 2014-09-15
 *
 */
public interface Constants {

	// API_HTTP_SCHEMA
	public static String API_HTTP_SCHEMA = "https";
	// API_SERVER_UNIFIEDORDER
	public static String API_SERVER_UNIFIEDORDER = PropertiesUtils.getProperties().getProperty("API_SERVER_UNIFIEDORDER");
	// API_SERVER_CLOSEORDER
	public static String API_SERVER_CLOSEORDER = PropertiesUtils.getProperties().getProperty("API_SERVER_CLOSEORDER");
	// API_SERVER_ORDERQUERY
	public static String API_SERVER_ORDERQUERY = PropertiesUtils.getProperties().getProperty("API_SERVER_ORDERQUERY");
	// APPKEY
	public static String APPKEY = PropertiesUtils.getProperties().getProperty("APPKEY");
	// APP_CLIENT_ID
	public static String APP_CLIENT_ID = PropertiesUtils.getProperties().getProperty("APP_CLIENT_ID");
	// APP_CLIENT_SECRET
	public static String APP_CLIENT_SECRET = PropertiesUtils.getProperties().getProperty("APP_CLIENT_SECRET");
	// APP_ACCESS_TOKEN
	public static String APP_ACCESS_TOKEN = PropertiesUtils.getProperties().getProperty("APP_ACCESS_TOKEN");
	// DEFAULT_PASSWORD
	public static String DEFAULT_PASSWORD = "123456";
	// SECURITY_KEY
	public static String SECURITY_KEY = PropertiesUtils.getProperties().getProperty("SECURITY_KEY");
	// APPID
	public static String APPID = PropertiesUtils.getProperties().getProperty("APPID");
	// MCH_ID
	public static String MCH_ID = PropertiesUtils.getProperties().getProperty("MCH_ID");
	//SUCCESS
	public static String SUCCESS="SUCCESS";
	//CALLBACK_SERVER_HOST
	public static String CALLBACK_SERVER_HOST_PRE="http://www.binzhi.cn:8080/binzhi_interface/wxpay/precallback";
	//TRADE_TYPE_APP
	public static String TRADE_TYPE_APP="APP";
	
}
