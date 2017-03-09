package com.youarenotin.jkl.service;

import com.youarenotin.jkl.dao.DaoSupport;
import com.youarenotin.jkl.util.PageData;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dell on 3/3 0003.
 */
@Service("PrepayService")
@Transactional
public class PrepayService {
    @Resource(name = "daoSupport")
    private DaoSupport dao;

    public List<PageData> findAllOrderByUid(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("Order.findAllOrderByUid", pd);
    }

    /**
     * 查找单一店铺排队信息
     * @param pd
     * @return
     * @throws Exception
     */
    public List<PageData> findQueueBySid(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("Prepay.findQueue" ,pd);
    }

    /**
     * 查找单一店铺top信息
     * @param pd
     * @return
     * @throws Exception
     */
    public PageData findTopInfoBySid(PageData pd) throws Exception {
        return (PageData) dao.findForObject("Prepay.findTopInfo",pd);
    }

    public List<PageData> findALL(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("Prepay.findAll",pd);
    }
}
