package com.youarenotin.jkl.service;

import com.youarenotin.jkl.dao.DaoSupport;
import com.youarenotin.jkl.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dell on 2/21 0021.
 */
@Service("CommentService")
public class CommentService {
    @Resource(name = "daoSupport")
    private DaoSupport dao;

    public Object  insertOneComment(PageData pd) throws Exception {
      return  dao.save("Comment.add", pd);
    }


    public List<PageData> findAllByuidsid(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("Comment.findall",pd);
    }
}
