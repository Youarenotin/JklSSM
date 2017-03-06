package com.youarenotin.jkl.controller;

import com.ali.httpclient.config.AlipayConfig;
import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.AlipayRequest;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import com.alipay.api.response.AlipayTradeWapPayResponse;
import com.youarenotin.jkl.App.Constant;
import com.youarenotin.jkl.App.Utils;
import com.youarenotin.jkl.service.PrepayService;
import com.youarenotin.jkl.util.PageData;
import com.youarenotin.jkl.util.UuidUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

/**
 * Created by dell on 3/1 0001.
 */
@Controller
@RequestMapping("/alipay")
public class AlipayController {
    @Resource
    private PrepayService prepayService;

    AlipayClient alipayClient = new DefaultAlipayClient(
            AlipayConfig.URL,
            AlipayConfig.APP_ID,
            AlipayConfig.APP_PRIVATE_KEY,
            AlipayConfig.FORMAT,
            AlipayConfig.CHARSET,
            AlipayConfig.ALIPAY_PUBLIC_KEY,
            AlipayConfig.sign_type
    );

    @RequestMapping("/prePay")
    public void prePay(HttpServletResponse response, String store_id) throws Exception {
        AlipayTradeWapPayRequest alipayTradeWapPayRequest = new AlipayTradeWapPayRequest();
        alipayTradeWapPayRequest.setReturnUrl(Constant.HOST+"/returnurl/alipay");
        alipayTradeWapPayRequest.setNotifyUrl(Constant.HOST+"/paycallback/alipay");
        HashMap<String, String> paramsMap = new HashMap<>();
        PageData pd = new PageData();
        pd.put("store_id", store_id);
        List<PageData> queueBySid = prepayService.findQueueBySid(pd);
        PageData topInfoBySid = prepayService.findTopInfoBySid(pd);
        paramsMap.put("out_trade_no", Utils.getDate()+ UuidUtil.get32UUID());
        //商户id
        paramsMap.put("seller_id",AlipayConfig.partner);
        //标题
        paramsMap.put("subject", topInfoBySid.getString("store_name"));
        //支付方式
        paramsMap.put("product_code", "QUICK_WAP_PAY");
        //支付价格
        paramsMap.put("total_amount", topInfoBySid.get("current_price").toString());
        String bizContent = JSON.toJSONString(paramsMap);
        alipayTradeWapPayRequest.setBizContent(bizContent);
        String form = alipayClient.pageExecute(alipayTradeWapPayRequest).getBody(); //调用SDK生成表单
        response.setContentType("text/html;charset=" + "UTF-8");
        response.getWriter().write(form);//直接将完整的表单html输出到页面
        response.getWriter().flush();

    }
}
