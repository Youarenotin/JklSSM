package com.youarenotin.jkl.controller;

import com.alibaba.fastjson.JSON;
import com.sun.javafx.collections.annotations.ReturnsUnmodifiableCollection;
import com.youarenotin.jkl.controller.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * Created by dell on 3/2 0002.
 */
@Controller
public class FacePayController extends BaseController {

    @RequestMapping(value = "/face_pay")
    public String doFacepay(HttpServletRequest request, HttpServletResponse response, String store_id) {
        response.setContentType("UTF-8");
        //查询当前店铺单价
        //微信认证获取code state中传入store_id
        //获取到access_token
        //查询用户openid 关联到自己库中
        if (request.getHeader("user-agent").contains("MicroMessenger")) {
          return   doWxFacePay(store_id);
        } else if (request.getHeader("user-agent").contains("AlipayClient")) {
         return    doAliFacePay(store_id);
        }else {
            return "请用微信或支付宝打开!";
        }
    }

    private String doAliFacePay(String store_id) {
        return "redirect:/alipay/prePay";
    }

    private String doWxFacePay(String store_id) {
        return  "";
    }

//    @RequestMapping("/wxpay")
//    public void doFaceWxPay(String store_id){
//
//    }
}
