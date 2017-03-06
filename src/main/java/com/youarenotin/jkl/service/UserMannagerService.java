package com.youarenotin.jkl.service;

import com.youarenotin.jkl.Entity.User.User;
import com.youarenotin.jkl.dao.DaoSupport;
import com.youarenotin.jkl.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dell on 2/14 0014.
 */
@Service("userMannagerService")
public class UserMannagerService {
    @Resource(name = "daoSupport")
    private  DaoSupport dao;

    public void saveUser(PageData pd) throws Exception {
        PageData pageData = new PageData();

        dao.save("User.addUser",pd);
        dao.save("User.addUserInfo",pd);
    }

    public PageData findByOpenId(PageData pd) throws Exception {
        return (PageData) dao.findForObject("User.findByOpenId",pd);
    }

    public List<PageData> findQueue(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("User.findQueue",pd);
    }

    public Object findOpenIdById(String pd) throws Exception {
        return  dao.findForObject("User.findOpenIdById",pd);
    }
}
