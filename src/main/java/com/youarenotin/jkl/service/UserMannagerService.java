package com.youarenotin.jkl.service;

import com.youarenotin.jkl.Entity.User.User;
import com.youarenotin.jkl.dao.DaoSupport;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by dell on 2/14 0014.
 */
@Service("userMannagerService")
public class UserMannagerService {
    @Resource(name = "daoSupport")
    private  DaoSupport dao;

    public void saveUser(User user) throws Exception {
        dao.save("User.addUser",user);
    }

    public Object findByOpenId(String openid) throws Exception {
        return  dao.findForObject("User.findByOpenId",openid);
    }

    public Object findOpenIdById(String id) throws Exception {
        return dao.findForObject("User.findOpenidById",id);
    }
}
