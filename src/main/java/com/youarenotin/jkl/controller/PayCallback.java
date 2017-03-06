package com.youarenotin.jkl.controller;

import com.ali.httpclient.config.AlipayConfig;
import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.youarenotin.jkl.controller.base.BaseController;
import com.youarenotin.jkl.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

/**
 * Created by dell on 3/3 0003.
 */
@Controller
@RequestMapping("paycallback")
public class PayCallback extends BaseController{
    @RequestMapping(value = "/alipay",method = RequestMethod.POST)
    @ResponseBody
    public String notifyAliCallback(HttpServletRequest request) throws AlipayApiException {
        PageData pd = getPageData();
        if(AlipaySignature.rsaCheckV1(pd, AlipayConfig.ALIPAY_PUBLIC_KEY,AlipayConfig.CHARSET)){
            Enumeration<String> attributeNames = request.getAttributeNames();
        }
        //验证签名
//        if (AlipayNotify.getSignVeryfy(pd,pd.get("sign").toString())){
            //商户需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号
            //判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额）
            //校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
            //验证app_id是否为该商户本身
//        }
        Enumeration<String> attributeNames = request.getAttributeNames();
        return "ffdfsfs";
    }

//    @RequestMapping("/wxpay")
//    public String notifyWxCallback(){
//
//    }
}
