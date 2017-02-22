package com.youarenotin.jkl.service;

import com.youarenotin.jkl.dao.DaoSupport;
import com.youarenotin.jkl.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by dell on 2/20 0020.
 */
@Service("StoreService")
public class StoreService {
    @Resource(name = "daoSupport")
    private DaoSupport dao;

    public PageData findStoreByid(PageData pd) throws Exception {
        return (PageData) dao.findForObject("Store.findById",pd);
    }
}
