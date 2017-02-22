package com.youarenotin.jkl.controller;

import com.sun.org.apache.xml.internal.dtm.DTMAxisIterator;
import com.youarenotin.jkl.App.Constant;
import com.youarenotin.jkl.Entity.Order;
import com.youarenotin.jkl.Entity.User.User;
import com.youarenotin.jkl.service.CommentService;
import com.youarenotin.jkl.service.OrderService;
import com.youarenotin.jkl.service.StoreService;
import com.youarenotin.jkl.service.UserMannagerService;
import com.youarenotin.jkl.util.MD5;
import com.youarenotin.jkl.util.PageData;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import sun.org.mozilla.javascript.internal.Token;
import sun.org.mozilla.javascript.internal.regexp.SubString;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.TreeMap;

/**
 * Created by dell on 2/17 0017.
 */
@Controller
@RequestMapping("/mobile")
public class Mobile {
    @Resource(name = "userMannagerService")
    private UserMannagerService userMannagerService;

    @Resource(name = "OrderService")
    private OrderService orderService;

    @Resource(name = "StoreService")
    private StoreService storeService;

    @Resource(name = "CommentService")
    private CommentService commentService;

    /**
     * state : 1
     *
     * @param uid
     * @param token
     * @param time
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/user")
    public String getUserPage(@Param("uid") String uid, @Param("token") String token, @Param("time") String time, Model model) throws Exception {
        //校验用户合法性
        StringBuilder sb = new StringBuilder();
        Object userVo = (User) userMannagerService.findOpenIdById(uid);
        if (userVo == null || !(userVo instanceof User))
            return "404.jsp";
        sb.append(((User) userVo).getOpen_id()).append(Constant.solt);
        if (!token.equals(MD5.md5(sb.toString()))) {
            return "404.jsp";
        }
        model.addAttribute("uid", uid);
        model.addAttribute("token", token);
        return "user.jsp";
    }

    /**
     * state : 3
     *
     * @param uid
     * @param token
     * @param time
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/store_list")
    public String getStoreListPage(@Param("uid") String uid, @Param("token") String token, @Param("time") String time, Model model) throws Exception {
        //校验用户合法性
        StringBuilder sb = new StringBuilder();
        Object userVo = (User) userMannagerService.findOpenIdById(uid);
        if (userVo == null || !(userVo instanceof User))
            return "404.jsp";
        sb.append(((User) userVo).getOpen_id()).append(Constant.solt);
        if (!token.equals(MD5.md5(sb.toString()))) {
            return "404.jsp";
        }
        model.addAttribute("uid", uid);
        model.addAttribute("token", token);
        return "store_list.jsp";
    }

    /**
     * state : 4
     *
     * @param uid
     * @param token
     * @param time
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/more_read")
    public String getMorePage(@Param("uid") String uid, @Param("token") String token, @Param("time") String time, Model model) throws Exception {
        //校验用户合法性
        StringBuilder sb = new StringBuilder();
        Object userVo = (User) userMannagerService.findOpenIdById(uid);
        if (userVo == null || !(userVo instanceof User))
            return "404.jsp";
        sb.append(((User) userVo).getOpen_id()).append(Constant.solt);
        if (!token.equals(MD5.md5(sb.toString()))) {
            return "404.jsp";
        }
        model.addAttribute("uid", uid);
        model.addAttribute("token", token);
        return "more_read.jsp";
    }

    /**
     * state : 2
     *
     * @param uid
     * @param token
     * @param time
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/order_list")
    public String getOrderListPage(@Param("uid") String uid, @Param("token") String token, @Param("time") String time, Model model) throws Exception {
        //校验用户合法性
        if (checkUserValid(uid, token, userMannagerService)) return "404.jsp";
        model.addAttribute("uid", uid);
        model.addAttribute("token", token);
        PageData queryData = new PageData();
        queryData.put("uid", uid);
        List<PageData> allOrderByUid = orderService.findAllOrderByUid(queryData);
        ArrayList<PageData> waitOrder = new ArrayList<>();
        ArrayList<PageData> finishedOrder = new ArrayList<>();
        ArrayList<PageData> unjudgeOrder = new ArrayList<>();
        for (PageData data : allOrderByUid) {
            PageData pd = new PageData();
            pd.put("id", data.getString("store_id"));
            PageData rlt = storeService.findStoreByid(pd);
            if (rlt != null) {
                data.put("store_info", rlt);
            }
            //等待中的订单
            if (data.get("state") == 0)
                waitOrder.add(data);
            //已经完成的订单
            if (data.get("state") == 2)
                finishedOrder.add(data);
            //已完成待评价
            if (data.get("state") == 1) {
                unjudgeOrder.add(data);
            }
        }
        //存放全部订单
        model.addAttribute("allOrder", allOrderByUid);
        model.addAttribute("waitOrder", waitOrder);
        model.addAttribute("finishedOrder", finishedOrder);
        model.addAttribute("unjudgeOrder", unjudgeOrder);
        return "order_list.jsp";
    }

    /**
     * 评价页面
     * @param model
     * @param jkl_order_id
     * @param store_id
     * @param uid
     * @param time
     * @param token
     * @return
     * @throws Exception
     */
    @RequestMapping("/judgement")
    public String getJudgeMentPage(Model model, @Param("jkl_order_id") String jkl_order_id, @Param("store_id") String store_id, @Param("uid") String uid, @Param("time") String time, @Param("token") String token) throws Exception {
        //校验用户合法性
        if (checkUserValid(uid, token, userMannagerService)) return "404.jsp";
        PageData query = new PageData();
        query.put("id", store_id);
        PageData rlt = storeService.findStoreByid(query);
        model.addAttribute("uid", uid);
        model.addAttribute("token", token);
        model.addAttribute("order_id", jkl_order_id);
        model.addAttribute("store_id", store_id);
        model.addAttribute("store_name", rlt.getString("store_name"));
        return "judgement.jsp";
    }

    /**
     * ajax评价
     * @param uid
     * @param store_id
     * @param order_id
     * @param time
     * @param token
     * @param mobile
     * @param comment
     * @param starts
     * @param labels_str
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ajax_judgement", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    @ResponseBody
    public String getAjaxJudgement(@RequestParam(value = "uid") String uid,
                                   @RequestParam(value = "store_id") String store_id,
                                   @RequestParam(value = "order_id") String order_id,
                                   @RequestParam(value = "time") String time,
                                   @RequestParam(value = "token") String token,
                                   @RequestParam(value = "mobie", required = false) String mobile,
                                   @RequestParam(value = "comment") String comment,
                                   @RequestParam(value = "stars") String starts,
                                   @RequestParam(value = "labels_str") String labels_str
    ) throws Exception {
        //校验用户合法性
        if (checkUserValid(uid, token, userMannagerService)) return "404.jsp";
        //拆入评价入库
        PageData pd = new PageData();
        pd.put("uid", uid);
        pd.put("store_id", store_id);
        pd.put("order_id", order_id);
        pd.put("comment", comment);
        pd.put("stars", starts);
        pd.put("labels_str", labels_str);
        Object o = commentService.insertOneComment(pd);
        //更新该订单是否评价标志
        //更新该订单状态
        PageData pdd = new PageData();
        pdd.put("order_id", order_id);
        pdd.put("is_judge", 1);
        pdd.put("state",2);
        orderService.updateStateByOrder_id(pdd);
        //评价是否成功
        if (o != null)
            return "{\"error\":\"0\" , \"msg\":\"评价成功\",\"uid\":\"" + uid + "\"}";
        return "{error:'1' , msg:'评价失败'}";
    }

    /**
     * 店铺详情
     * @param uid
     * @param store_id
     * @param time
     * @param token
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/store_detail", method = RequestMethod.GET)
    public String getStoreDetailPage(@Param("uid") String uid, @Param("store_id") String store_id, @Param("time") String time, @Param("token") String token) throws Exception {
        //校验用户合法性
        if (checkUserValid(uid, token, userMannagerService)) return "404.jsp";

        return "store_detail.jsp";
    }

    /**
     * 获取用户历史评价
     * @return
     */
    @RequestMapping("/judgement_list")
    public String getJudgementListpage(Model model, @Param("uid") String uid , @Param("time") String time , @Param("token") String token) throws Exception {
        //校验用户合法性
        if (checkUserValid(uid, token, userMannagerService)) return "404.jsp";
        model.addAttribute("uid", uid);
        model.addAttribute("token", token);
        PageData query = new PageData();
        query.put("uid",uid);
        List<PageData> judgeList = commentService.findAllByuidsid(query);
        for (PageData data : judgeList) {
            if (data.getString("comment").equals("默认好评")|| data.getString("comment").equals("")){
                data.put("defaultComment", true);
            }
            else {
                data.put("defaultComment",false);
            }
            String labels_str = data.getString("labels_str");
            String[] split = labels_str.split(",");
            ArrayList<String> list = new ArrayList<>();
            for (int i = 0; i < split.length; i++) {
                list.add(split[i]);
            }
            if (!list.isEmpty()) {
                data.put("labels",list);
            }
            PageData data1 = new PageData();
            data1.put("id",data.get("store_id"));
            PageData rlt = storeService.findStoreByid(data1);
            if (rlt != null && !rlt.getString("store_img").isEmpty()) {
                data.put("store_img",rlt.getString("store_img"));
            }
        }
        model.addAttribute("commentHistoryList",judgeList);
        return "judgement_list.jsp";
    }

    public static boolean checkUserValid(@RequestParam(value = "uid") String uid, @RequestParam(value = "token") String token, UserMannagerService userMannagerService) throws Exception {
        StringBuilder sb = new StringBuilder();
        Object userVo = (User) userMannagerService.findOpenIdById(uid);
        if (userVo == null || !(userVo instanceof User))
            return true;
        sb.append(((User) userVo).getOpen_id()).append(Constant.solt);
        if (!(token.equalsIgnoreCase(MD5.md5(sb.toString())))) {
            return true;
        }
        return false;
    }
}
