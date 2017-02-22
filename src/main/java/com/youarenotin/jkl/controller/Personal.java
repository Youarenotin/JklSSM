package com.youarenotin.jkl.controller;

import com.alibaba.fastjson.JSON;
import com.sun.org.apache.bcel.internal.generic.IFNULL;
import com.sun.org.apache.bcel.internal.generic.IF_ACMPEQ;
import com.youarenotin.jkl.Entity.Access_token;
import com.youarenotin.jkl.Entity.Content;
import com.youarenotin.jkl.Entity.User.User;
import com.youarenotin.jkl.Entity.UserInfo;
import com.youarenotin.jkl.dao.DaoSupport;
import com.youarenotin.jkl.service.UserMannagerService;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;

/**
 * Created by dell on 2/8 0008.
 */
@Controller
public class Personal {
    protected HttpServletRequest request;
    protected HttpServletResponse response;
    protected HttpSession session;

    @ModelAttribute
    public void setReqAndRes(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.session = request.getSession();
    }
//
//    @Resource(name = "setSexService")
//    private SetttingService setSexService;

//    @RequestMapping(value = "/kj",method = RequestMethod.GET)
//    @ResponseBody
//    public String checkSignature(@Param("signature") String signature, @Param("timestamp") String timestamp, @Param("nonce") String nonce , @Param("echostr") String echostr) {
//        String[] arr = {Constant.token, timestamp, nonce};
//        Arrays.sort(arr);
//        StringBuilder sb = new StringBuilder();
//        for (int i = 0; i < arr.length; i++) {
//            sb.append(arr[i]);
//        }
//        String sha1 = Utils.getSha1(sb.toString());
//        if (sha1.equals(signature)){
//            System.out.print(echostr);
//            return echostr;
//        }
//        return "连通失败";
//    }





    @RequestMapping("/index")
    public String index(HttpSession session) {
        return "index.jsp";
    }

    @RequestMapping(value = "/Oauth2", method = RequestMethod.GET)
    public String welcome() {
        String url = URLEncoder.encode("http://youarenotinceshi.ngrok.cc/getCode");
//        return "personal.jsp";
        return "redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid= wx8b5a0818b019401c&redirect_uri=http%3A%2F%2Fyouarenotinceshi.ngrok.cc%2FgetCode&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect";
    }

    @RequestMapping("/")
    public String personal() {
        return "personal.jsp";
    }

    @RequestMapping("/redirect")
    public String OAuth() {
        return "redirect:/index.jsp";
    }

    @RequestMapping(value = "/setting", method = RequestMethod.GET)
    public String setting() {
        return "setting.jsp";
    }

    @RequestMapping(value = "/setSex", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    @ResponseBody
    public String setSex(
            @RequestBody String body,
            @RequestParam(value = "f_user_id", required = true) String uid,
            @RequestParam(value = "token", required = true) String token,
            @RequestParam(value = "time", required = true) String time,
            @RequestParam(value = "type", required = true) String type) {


        String str = body;
        //todo 业务处理
//        setSexService.setSex(uid,time,token,type);
        Content content = new Content();
        content.setMsg("修改成功");
        return JSON.toJSONString(content);
    }
}
