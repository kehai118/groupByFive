package com.second.shiro;

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

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 描述:
 * 权限验证的realm，主要用来获取权限信息。
 * @author bigpeng
 * @create 2019-11-18 11:25
 */
public class CustomRealm extends AuthorizingRealm {

    /*@Autowired
    private TAdminService adminService;

    @Autowired
    private TMenuService menuService;*/

    /**
     * 权限认证方法
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        /*//1 获取登录的用户信息
        TAdmin admin = (TAdmin) principalCollection.getPrimaryPrincipal();
        //2 获取登录用户的角色信息
        String rolename = admin.gettRole().getRolename();

        //创建权限验证对象
        SimpleAuthorizationInfo authorizationInfo=new SimpleAuthorizationInfo();
        Set<String> roleSet=new HashSet<>();
//        roleSet.add("test");
        roleSet.add(rolename);
        //3.将角色信息传入授权对象
        authorizationInfo.setRoles(roleSet);

        //4.查询用户的权限信息
        List<TMenu> menus = menuService.selectByRoleId(admin.getRoleid());
        Set<String> permissionSet=new HashSet<>();

        for (TMenu menu : menus) {
            permissionSet.add(menu.getPermission());
        }
        //5.将权限信息（权限编码）传入授权对象
        authorizationInfo.setStringPermissions(permissionSet);*/

//        return authorizationInfo;
        return new SimpleAuthorizationInfo();
    }

    /**
     * 身份认证方法(登录时使用)
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        /*//1 获取前台传送的用户名
        String account = authenticationToken.getPrincipal().toString();

        //2.根据用户名查询用户信息
        TAdmin admin = adminService.selectByName(account, null);

        //如果用户不存在，直接return null
        if(admin==null){
            return null;
        }
        //3. 封装用户验证对象
        SimpleAuthenticationInfo sai=

                new SimpleAuthenticationInfo(
                        admin,// 用户对象
                        admin.getPassword(),//数据库存储的密码
                        new SimpleByteSource(admin.getCreatetime().getTime()+""),//盐
                        getName());//realm名称
        return sai;*/
        return new SimpleAuthenticationInfo();
    }

    @Override
    public void setName(String name) {
        super.setName("customRealm");
    }
}