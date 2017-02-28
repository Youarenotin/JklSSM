package com.youarenotin.jkl.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by dell on 2/28 0028.
 */
public class AccessFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest hreq  = (HttpServletRequest)servletRequest;
        String uid = hreq.getParameter("uid");
    }

    @Override
    public void destroy() {

    }
}
