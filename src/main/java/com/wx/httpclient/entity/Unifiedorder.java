package com.wx.httpclient.entity;

import com.wx.httpclient.common.Constants;
import com.youarenotin.jkl.util.MD5;
import com.youarenotin.jkl.util.StringUtil;
import com.youarenotin.jkl.util.UuidUtil;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name = "xml")    
public class Unifiedorder {
	//公众账号ID
	private String appid = Constants.APPID;
	//商户号
	private String mch_id =Constants.MCH_ID;
	//设备号
	private String device_info;
	//随机字符串
	private String nonce_str = UuidUtil.get32UUID();
	//签名
	private String sign;
	//商品描述
	private String body;
	//商品详情
	private String detail;
	//附加数据
	private String attach;
	//商户订单号
	private String out_trade_no;
	//货币类型
	private String fee_type;
	//总金额
	private String total_fee;
	//终端IP
	private String spbill_create_ip;
	//交易起始时间
	private String time_start;
	//交易结束时间
	private String time_expire;
	//商品标记
	private String goods_tag;
	//通知地址
	private String notify_url;
	//交易类型
	private String trade_type;
	//商品ID
	private String product_id;
	//指定支付方式
	private String limit_pay;
	//用户标识
	private String openid;

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	public String getMch_id() {
		return mch_id;
	}

	public void setMch_id(String mch_id) {
		this.mch_id = mch_id;
	}

	public String getDevice_info() {
		return device_info;
	}

	public void setDevice_info(String device_info) {
		this.device_info = device_info;
	}

	public String getNonce_str() {
		return nonce_str;
	}

	public void setNonce_str(String nonce_str) {
		this.nonce_str = nonce_str;
	}

	public String getSign() {
		Field[] fields = Unifiedorder.class.getDeclaredFields();
		List<String> fieldnames = new ArrayList<String>();
		for(Field field : fields){
			if(!"sign".equals(field.getName())){
				fieldnames.add(field.getName());
			}
			
		}
		Collections.sort(fieldnames);
		StringBuilder sb = new StringBuilder();
		for(String fieldname:fieldnames){

			try {
//				this.getClass().getField(fieldname).setAccessible(true);
				Object fieldvalueobj = this.getClass().getDeclaredField(fieldname).get(this);
				if(fieldvalueobj != null){
					String fieldvalue = fieldvalueobj.toString();
					sb.append(fieldname);
					sb.append("=");
					sb.append(fieldvalue);
					sb.append("&");
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (NoSuchFieldException e) {
				e.printStackTrace();
			} catch (SecurityException e) {
				e.printStackTrace();
			}

		}
		
		String stringSignTemp  = sb.toString()+"key="+Constants.SECURITY_KEY;
		sign = MD5.md5(stringSignTemp).toUpperCase();
		
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getAttach() {
		return attach;
	}

	public void setAttach(String attach) {
		this.attach = attach;
	}

	public String getOut_trade_no() {
		return out_trade_no;
	}

	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}

	public String getFee_type() {
		return fee_type;
	}

	public void setFee_type(String fee_type) {
		this.fee_type = fee_type;
	}

	public String getTotal_fee() {
		return total_fee;
	}

	public void setTotal_fee(String total_fee) {
		this.total_fee = total_fee;
	}

	public String getSpbill_create_ip() {
		return spbill_create_ip;
	}

	public void setSpbill_create_ip(String spbill_create_ip) {
		this.spbill_create_ip = spbill_create_ip;
	}

	public String getTime_start() {
		return time_start;
	}

	public void setTime_start(String time_start) {
		this.time_start = time_start;
	}

	public String getTime_expire() {
		return time_expire;
	}

	public void setTime_expire(String time_expire) {
		this.time_expire = time_expire;
	}

	public String getGoods_tag() {
		return goods_tag;
	}

	public void setGoods_tag(String goods_tag) {
		this.goods_tag = goods_tag;
	}

	public String getNotify_url() {
		return notify_url;
	}

	public void setNotify_url(String notify_url) {
		this.notify_url = notify_url;
	}

	public String getTrade_type() {
		return trade_type;
	}

	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getLimit_pay() {
		return limit_pay;
	}

	public void setLimit_pay(String limit_pay) {
		this.limit_pay = limit_pay;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public boolean checkData(){
		if(StringUtil.isNull(appid,mch_id,nonce_str,sign,body,out_trade_no,total_fee,spbill_create_ip,notify_url,trade_type))return false;
		return true;
	}
//	public String toXML(){
//		Document document = DocumentHelper.createDocument();
//		Element root = document.addElement("xml");
//		
//		return null;
//	}
	
}
