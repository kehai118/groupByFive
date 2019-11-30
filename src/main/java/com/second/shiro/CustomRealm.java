package com.second.shiro;

import com.second.pojo.exam.TUser;
import com.second.service.exam.UserServiceImpl;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.SimpleByteSource;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 描述:
 * 权限验证的realm，主要用来获取权限信息。
 * @author bigpeng
 * @create 2019-11-18 11:25
 */
public class CustomRealm extends AuthorizingRealm {
    @Autowired
    private UserServiceImpl userService;
    /**
     * 权限认证方法
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        final SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        return authorizationInfo;
    }

    /**
     * 身份认证方法(登录时使用)
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //1 获取前台传送的用户名
        String account = authenticationToken.getPrincipal().toString();

        //2.根据用户名查询用户信息
        TUser user = userService.selectByName(account);

        //如果用户不存在，直接return null
        if(user==null){
            return null;
        }

        //VUser admin=userService.selectVUser(user.getId());
        //3. 封装用户验证对象
        SimpleAuthenticationInfo sai=
                new SimpleAuthenticationInfo(
                        user,// 用户对象
                        user.getPassword(),//数据库存储的密码
                        new SimpleByteSource("abcd"),
                        getName());//realm名称
        return sai;
    }

    @Override
    public void setName(String name) {
        super.setName("customRealm");
    }
}