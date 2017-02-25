package com.youarenotin.jkl.controller;

import com.alibaba.fastjson.JSON;
import com.youarenotin.jkl.service.OrderService;
import com.youarenotin.jkl.util.PageData;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Android端统一数据获取接口
 * Created by dell on 2/23 0023.
 */
@Controller
@RequestMapping("/android")
public class Android {
    @Resource(name = "OrderService")
    private OrderService orderService;

    @RequestMapping("/commondata")
    @ResponseBody
    public String getAndroidClientData(Model model, @Param("store_id") String store_id) throws Exception {
        //微信公众号二维码
        //扫码支付二维码
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
        HashMap<String, Object> map = new HashMap<>();
        map.put("curPrice", "28");
        map.put("lineNum",normalQueue.size());
        map.put("nQueue",normalQueue);
        String json = JSON.toJSONString(map);
        return json;
    }
}
