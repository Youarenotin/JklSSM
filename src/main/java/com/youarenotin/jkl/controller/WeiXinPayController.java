package com.youarenotin.jkl.controller;

import com.wx.httpclient.common.Constants;
import com.wx.httpclient.entity.UnifiedorderResponse;
import com.youarenotin.jkl.controller.base.BaseController;
import com.youarenotin.jkl.util.XMLUtil;
import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by dell on 2/24 0024.
 */
@RequestMapping("/wxpay")
public class WeiXinPayController extends BaseController {
    @RequestMapping("/precallback")
    public void preCallbakc(
            PrintWriter out,
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {
        logBefore(logger,"微信支付回调");
        String result = IOUtils.toString(request.getInputStream(), "UTF-8");
        UnifiedorderResponse res = XMLUtil.converyToJavaBean(result, UnifiedorderResponse.class);
        if (!res.checkSign()) {//检验sign不通过 舍弃这次请求
            UnifiedorderResponse u = new UnifiedorderResponse();
            u.setReturn_code("FAIL");
            out.write(XMLUtil.convertToXml(u));
        } else if (null != res && Constants.SUCCESS.equals(res.getReturn_code())) {

        }
    }
}
