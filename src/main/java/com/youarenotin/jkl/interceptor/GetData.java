package com.youarenotin.jkl.interceptor;

import com.youarenotin.jkl.App.Constant;
import com.youarenotin.jkl.Entity.User.User;
import com.youarenotin.jkl.service.UserMannagerService;
import com.youarenotin.jkl.util.MD5;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by dell on 2/28 0028.
 */
public class GetData extends HandlerInterceptorAdapter {
    @Resource(name = "userMannagerService")
    private UserMannagerService userMannagerService;

    /**
     * 拦截mobile目录下校验用户是否合法
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uid = (String) request.getParameter("uid");
        String token = (String) request.getParameter("token");
        StringBuilder sb = new StringBuilder();
        Object userVo = (User) userMannagerService.findOpenIdById(uid);
        if (userVo == null || !(userVo instanceof User)) {
            response.sendRedirect("../../../404.jsp");
            return false;
        }
        sb.append(((User) userVo).getOpen_id()).append(Constant.solt);
        if (!(token.equalsIgnoreCase(MD5.md5(sb.toString())))) {
            response.sendRedirect("../../../404.jsp");
            return false;
        }
        return true;
    }
}
