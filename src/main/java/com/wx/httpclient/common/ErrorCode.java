package com.wx.httpclient.common;

public enum ErrorCode {
	 /** 订单已支付 */
	ORDERPAID {public String getName(){return "订单已支付";}

	@Override
	public String getReason() {
		return "订单已支付，不能发起关单";
	}

	@Override
	public String getSolution() {
		return "订单已支付，不能发起关单，请当作已支付的正常交易";
	}},
    /** 系统错误 */
	SYSTEMERROR {public String getName(){return "系统错误";}

	@Override
	public String getReason() {
		return "系统错误";
	}

	@Override
	public String getSolution() {
		return "系统异常，请重新调用该API";
	}},
    /** 订单不存在 */
	ORDERNOTEXIST {public String getName(){return "订单不存在";}

	@Override
	public String getReason() {
		return "订单系统不存在此订单";
	}

	@Override
	public String getSolution() {
		return "不需要关单，当作未提交的支付的订单";
	}},
    /** 订单已关闭 */
	ORDERCLOSED {public String getName(){return "订单已关闭";}

	@Override
	public String getReason() {
		return "订单已关闭，无法重复关闭";
	}

	@Override
	public String getSolution() {
		return "订单已关闭，无需继续调用";
	}},
    /** 签名错误 */
	SIGNERROR {public String getName(){return "签名错误";}

	@Override
	public String getReason() {
		return "参数签名结果不正确";
	}

	@Override
	public String getSolution() {
		return "请检查签名参数和方法是否都符合签名算法要求";
	}},
    /** 请使用post方法*/
	REQUIRE_POST_METHOD {public String getName(){return "请使用post方法";}

	@Override
	public String getReason() {
		return "未使用post传递参数 ";
	}

	@Override
	public String getSolution() {
		return "请检查请求参数是否通过post方法提交";
	}},
	 /** 商户无此接口权限 */
	NOAUTH {public String getName(){return "商户无此接口权限";}

	@Override
	public String getReason() {
		return "商户未开通此接口权限";
	}

	@Override
	public String getSolution() {
		return "请商户前往申请此接口权限";
	}},
	 /** APPID不存在 */
	APPID_NOT_EXIST {public String getName(){return "APPID不存在";}

	@Override
	public String getReason() {
		return "参数中缺少APPID";
	}

	@Override
	public String getSolution() {
		return "请检查APPID是否正确";
	}},
	 /** MCHID不存在 */
	MCHID_NOT_EXIST {public String getName(){return "MCHID不存在";}

	@Override
	public String getReason() {
		return "参数中缺少MCHID";
	}

	@Override
	public String getSolution() {
		return "请检查MCHID是否正确";
	}},
	 /** post数据为空 */
	POST_DATA_EMPTY {public String getName(){return "post数据为空";}

	@Override
	public String getReason() {
		return "post数据不能为空";
	}

	@Override
	public String getSolution() {
		return "请检查post数据是否为空";
	}},
	 /** 编码格式错误 */
	NOT_UTF8 {public String getName(){return "编码格式错误";}

	@Override
	public String getReason() {
		return "未使用指定编码格式";
	}

	@Override
	public String getSolution() {
		return "请使用NOT_UTF8编码格式";
	}},
	 /** 缺少参数 */
	LACK_PARAMS {public String getName(){return "缺少参数";}

	@Override
	public String getReason() {
		return "缺少必要的请求参数";
	}

	@Override
	public String getSolution() {
		return "请检查参数是否齐全";
	}},
	 /** 商户订单号重复 */
	OUT_TRADE_NO_USED {public String getName(){return "商户订单号重复";}

	@Override
	public String getReason() {
		return "同一笔交易不能多次提交";
	}

	@Override
	public String getSolution() {
		return "请核实商户订单号是否重复提交";
	}},
	 /** appid和mch_id不匹配 */
	APPID_MCHID_NOT_MATCH {public String getName(){return "appid和mch_id不匹配";}

	@Override
	public String getReason() {
		return "appid和mch_id不匹配";
	}

	@Override
	public String getSolution() {
		return "请确认appid和mch_id是否匹配";
	}},
	/** 余额不足 */
	NOTENOUGH {public String getName(){return "余额不足";}

	@Override
	public String getReason() {
		return "用户帐号余额不足";
	}

	@Override
	public String getSolution() {
		return "用户帐号余额不足，请用户充值或更换支付卡后再支付";
	}},
    /** XML格式错误 */
	XML_FORMAT_ERROR {public String getName(){return "XML格式错误";}

	@Override
	public String getReason() {
		return "XML格式错误";
	}

	@Override
	public String getSolution() {
		return "请检查XML参数格式是否正确";
	}};
    
    public abstract String getName();
    
    public abstract String getReason();
    
    public abstract String getSolution();
}
