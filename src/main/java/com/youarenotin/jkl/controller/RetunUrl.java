package com.youarenotin.jkl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by dell on 3/3 0003.
 */
@Controller
@RequestMapping("/returnurl")
public class RetunUrl {

    @RequestMapping("/alipay")
    public String doAlireturn(HttpServletRequest request, Model model) {
        Map<String, String[]> parameterMap = request.getParameterMap();
        return "404.jsp";
    }
}
