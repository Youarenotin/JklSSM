package com.youarenotin.jkl.Entity;

/**
 * Created by dell on 2/19 0019.
 */
public class Order {
    private String id;
    private String wx_order_id;
    private String ali_order_id;
    private String jkl_order_id;
    private String  store_id;
    private String operate_id;
    private String create_time;
    private String is_judge;
    private String total_price;
    private String queue_num;
    private String state;
    private String judge_level;
    private String judge;
    private String uid;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getWx_order_id() {
        return wx_order_id;
    }

    public void setWx_order_id(String wx_order_id) {
        this.wx_order_id = wx_order_id;
    }

    public String getAli_order_id() {
        return ali_order_id;
    }

    public void setAli_order_id(String ali_order_id) {
        this.ali_order_id = ali_order_id;
    }

    public String getJkl_order_id() {
        return jkl_order_id;
    }

    public void setJkl_order_id(String jkl_order_id) {
        this.jkl_order_id = jkl_order_id;
    }

    public String getStore_id() {
        return store_id;
    }

    public void setStore_id(String store_id) {
        this.store_id = store_id;
    }

    public String getOperate_id() {
        return operate_id;
    }

    public void setOperate_id(String operate_id) {
        this.operate_id = operate_id;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getIs_judge() {
        return is_judge;
    }

    public void setIs_judge(String is_judge) {
        this.is_judge = is_judge;
    }

    public String getTotal_price() {
        return total_price;
    }

    public void setTotal_price(String total_price) {
        this.total_price = total_price;
    }

    public String getQueue_num() {
        return queue_num;
    }

    public void setQueue_num(String queue_num) {
        this.queue_num = queue_num;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getJudge_level() {
        return judge_level;
    }

    public void setJudge_level(String judge_level) {
        this.judge_level = judge_level;
    }

    public String getJudge() {
        return judge;
    }

    public void setJudge(String judge) {
        this.judge = judge;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }
}
