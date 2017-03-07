package com.youarenotin.jkl.controller;

import com.alibaba.fastjson.JSON;
import com.youarenotin.jkl.App.Constant;
import com.youarenotin.jkl.controller.base.BaseController;
import com.youarenotin.jkl.service.OrderService;
import com.youarenotin.jkl.service.StoreService;
import com.youarenotin.jkl.service.UserMannagerService;
import com.youarenotin.jkl.util.PageData;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Android端统一数据获取接口
 * Created by dell on 2/23 0023.
 */
@Controller
@RequestMapping("/android")
public class Android extends BaseController {
     @Resource(name = "OrderService")
    private OrderService orderService;
    @Resource(name = "userMannagerService")
    private UserMannagerService userMannagerService;
    @Resource(name = "StoreService")
    private StoreService storeService;

    @RequestMapping(value = "/commondata",produces ="application/json; charset=UTF-8")
    @ResponseBody
    public String getAndroidClientData(Model model, @Param("store_id") String store_id) throws Exception {
        logBefore(logger,"安卓端请求开始");
        //微信公众号二维码
        //扫码支付二维码
        model.addAttribute("wxQrcode" , Constant.FACE_PAY_COMMON_URL+"?store_id="+store_id);
        //叫号号码
        //预计等待时间
        //排队人数
        //最低价格
        //最高价格
        //当前价格
        //正在排队列表
        //预约排队列表
        PageData query = new PageData();
        query.put("store_id",store_id);
        List<PageData> normalQueue = orderService.findNormalQueue(query);
        HashMap<String, Object> resultMap = new HashMap<>();
        ArrayList<HashMap<String, String>> queueList = new ArrayList<>();
        for (PageData pageData : normalQueue) {
            List<PageData> list = userMannagerService.findQueue(pageData);
            for (PageData data : list) {
                HashMap<String, String> usr = new HashMap<>();
                usr.put("nickname",data.getString("nickname"));
                usr.put("headimgurl",data.getString("headimgurl"));
                queueList.add(usr);
            }
        }
        PageData price = storeService.findPrice(query);
        resultMap.put("curPrice", price.get("current_price").toString());
        resultMap.put("maxPrice",price.get("max_price").toString());
        resultMap.put("minPrice",price.get("min_price").toString());
        resultMap.put("disCount",price.get("discount").toString());
        resultMap.put("lineNum",normalQueue.size());
        resultMap.put("nQueue",queueList);
        resultMap.put("rQueue",queueList);
        String json = JSON.toJSONString(resultMap);
        System.out.println(json);
        logAfter(logger);
        return json;
    }
}
