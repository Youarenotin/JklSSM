package com.youarenotin.jkl.interceptor.shiro;

import org.apache.shiro.web.filter.authz.AuthorizationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by dell on 2/28 0028.
 */
public class AppUserAuthFilter extends AuthorizationFilter {
    @Override
    protected boolean isAccessAllowed(ServletRequest servletRequest, ServletResponse servletResponse, Object o) throws Exception {
        HttpServletRequest hreq  = (HttpServletRequest)servletRequest;
        String uid = hreq.getParameter("uid");
        return false;
    }
}
