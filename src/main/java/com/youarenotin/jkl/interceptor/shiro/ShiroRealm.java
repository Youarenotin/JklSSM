package com.youarenotin.jkl.interceptor.shiro;

import com.youarenotin.jkl.service.impl.SysUserServiceImpl;
import com.youarenotin.jkl.util.PageData;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;

/**
 * Created by dell on 2/28 0028.
 */
public class ShiroRealm extends AuthorizingRealm {
    @Resource
    private SysUserServiceImpl sysUserService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
        String password = new String((char[]) token.getCredentials());
        PageData pageData = new PageData();
        pageData.put("username",username);
        try {
            PageData usr = sysUserService.findByUserName(pageData);

            if (usr == null) {
                throw  new UnknownAccountException("账号不存在");
            }

            if (!password.equals(usr.getString("password"))){
                throw new IncorrectCredentialsException("账号或密码不正确");
            }

            if (usr.get("state")==0) {
                throw new LockedAccountException("账号已被锁定,请联系管理员");
            }

            return  new SimpleAuthenticationInfo(usr, password, getName());

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
