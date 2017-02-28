package com.youarenotin.jkl.controller;

import com.wx.httpclient.common.Constants;
import com.wx.httpclient.entity.Unifiedorder;
import com.wx.httpclient.util.WXPAYUtil;
import com.youarenotin.jkl.controller.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.math.BigDecimal;

/**
 * Created by dell on 2/24 0024.
 */
@Controller
@RequestMapping("orders")
public class OrdersController extends BaseController {


    @RequestMapping("/payForOrder")
    public Object payForOrder(@RequestParam("order_id") String order_id){
        logBefore(logger,"根据订单号支付订单");
        return null ;
    }

//             "appId"     :   jsApiParameters.appId,      //公众号名称，由商户传入
//            "timeStamp" :   jsApiParameters.timeStamp,      //时间戳，自1970年以来的秒数
//            "nonceStr"  :   jsApiParameters.nonceStr,      //随机串
//            "package"   :   jsApiParameters.package,
//            "signType"  :   jsApiParameters.signType,      //微信签名方式：
//            "paySign"   :   jsApiParameters.paySign       //微信签名

//    @RequestMapping("/prePay")
//    public Object prePay() {
//        Unifiedorder u = new Unifiedorder();
//        u.setBody("消费 "+"0.01元");
//        u.setOut_trade_no(w.getOrders_id());
//        u.setTotal_fee(w.getMoney().toPlainString());
//        u.setSpbill_create_ip(ip);
//        u.setNotify_url(Constants.CALLBACK_SERVER_HOST_PRE);
//        u.setTrade_type(Constants.TRADE_TYPE_APP);
//        u.setAttach(String.valueOf(w.getUid()));
//        WXPAYUtil.unifiedorder()
//    }
}
