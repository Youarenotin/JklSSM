package com.youarenotin.jkl.service;

import com.youarenotin.jkl.dao.DaoSupport;
import com.youarenotin.jkl.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dell on 2/20 0020.
 */
@Service("OrderService")
public class OrderService {
    @Resource(name = "daoSupport")
    private DaoSupport dao;

    public List<PageData> findAllOrderByUid(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("Order.findAllOrderByUid", pd);
    }

    public void updateStateByOrder_id(PageData pd) throws Exception {
        dao.update("Order.updateStateByOrderid", pd);
    }

    public void insertOneOrder(PageData pd) throws Exception {
        dao.save("Order.insertOneOrder",pd);
    }
}
