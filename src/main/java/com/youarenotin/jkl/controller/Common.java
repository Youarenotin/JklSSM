package com.youarenotin.jkl.controller;

import com.alibaba.fastjson.JSON;
import com.youarenotin.jkl.Entity.Access_token;
import com.youarenotin.jkl.Entity.User.User;
import com.youarenotin.jkl.Entity.UserInfo;
import com.youarenotin.jkl.service.UserMannagerService;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by dell on 2/17 0017.
 */
@Controller
public class Common {
        public static final String HOST = "http://youarenotinceshi.ngrok.cc/mobile/user";
//    public static final String HOST = "http://localhost:8080";

    @Resource(name = "userMannagerService")
    private UserMannagerService userMannagerService;

    @RequestMapping("/wechat/oauth/state/{stateValue}")
    public String oauth(@PathVariable("stateValue") String state,Model model) {
//        switch (state) {
//            case "1":
////                正式环境
//                return "redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx8b5a0818b019401c&redirect_uri=http%3A%2F%2Fyouarenotinceshi.ngrok.cc%2FgetCode&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect";
//            default:
//            return "";
//        }
        //测试环境
        return testJsp(state,model);
    }

    private String testJsp(String state, Model model) {
        //模拟帐号
        User user = new User();
        user.setOpen_id("oFoEOw4KVvqNcE2vdXEyWAdz5vPM");
        user.setId("10002");
        user.setCreate_time("2017-02-16 17:04:56");
        user.setToken("a49b141906d0f158901d9630a748f61e");
        model.addAttribute("uid",user.getId());
        model.addAttribute("token",user.getToken());
        //重定向到个人页面  + "/mobile/user?uid=" + user.getId() + "&time=" + System.currentTimeMillis() + "&token=" + user.getToken();
        if (state.equals("1")) {
            return "redirect:" + HOST ;
        }
        //重定向到订单页面
        if (state.equals("2")) {
            return "redirect:" + HOST + "/mobile/order_list?uid=" + user.getId() + "&time=" + System.currentTimeMillis() + "&token=" + user.getToken();
        }
        //重定向到店铺页面
        if (state.equals("3")) {
            return "redirect:" + HOST + "/mobile/store_list?uid=" + user.getId() + "&time=" + System.currentTimeMillis() + "&token=" + user.getToken();
        }
        //重定向到更多页面
        if (state.equals("4")) {
            return "redirect:" + HOST + "/mobile/more_read?uid=" + user.getId() + "&time=" + System.currentTimeMillis() + "&token=" + user.getToken();
        }
        return null;
    }

    /**
     * 微信认证获取openid 以及 userinfo
     *
     * @param code
     * @param state
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/getCode")
    public String getCode(@Param("code") String code, @Param("state") String state, Model model) throws Exception {
        //通过code 获取access_token
        CloseableHttpClient client = HttpClients.createDefault();
        String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx8b5a0818b019401c&secret=4f1e14aba6f36eb5a4fa1b8690be4fe1&code=" + code + "&grant_type=authorization_code";
        HttpGet getAccess_token = new HttpGet(url);
        CloseableHttpResponse response = client.execute(getAccess_token);
        String result = EntityUtils.toString(response.getEntity(), "utf-8");
        Access_token access_token = JSON.parseObject(result, Access_token.class);
        //通过access_token获取userinfo
        HttpGet getUserInfo = new HttpGet("https://api.weixin.qq.com/sns/userinfo?access_token=" + access_token.getAccess_token() + "&openid=" + access_token.getOpenid() + "&lang=zh_CN");
        CloseableHttpResponse responseUserInfo = client.execute(getUserInfo);
        String userInfo = EntityUtils.toString(responseUserInfo.getEntity(), "utf-8");
        UserInfo userInfoVo = JSON.parseObject(userInfo, UserInfo.class);
        User user = new User();
//        user.setOpen_id(userInfoVo.getOpenid());
        user.setOpen_id(userInfoVo.getOpenid());
        User userBySelect = (User) userMannagerService.findByOpenId(user.getOpen_id());
        if (userBySelect == null || userBySelect.getOpen_id().isEmpty()) {
            userMannagerService.saveUser(user);
        }
        switch (state) {
            case "1"://个人页面
//                ModelAndView modelAndView = new ModelAndView("personal.jsp");
//                modelAndView.addObject("nickname",userInfoVo.getNickname());
//                modelAndView.addObject("headimgurl",userInfoVo.getHeadimgurl());
                String nickname = userInfoVo.getNickname();
                String headimgurl = userInfoVo.getHeadimgurl();
                System.out.println(nickname);
                System.out.println(headimgurl);
                model.addAttribute("nickname", nickname);
                model.addAttribute("headimgurl", headimgurl);
//                model.addAttribute("hello","helloworld");
//                return modelAndView;
                return "personal.jsp";
            default:
                break;
        }
        return null;
    }
}
