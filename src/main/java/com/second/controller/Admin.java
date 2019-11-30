package com.second.controller;

import com.second.pojo.exam.TUser;
import com.second.pojo.exam.TUserOther;
import com.second.pojo.exam.VUser;
import com.second.service.FileService;
import com.second.service.exam.UserServiceImpl;
import jdk.nashorn.internal.parser.Token;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.ParseException;

@RequestMapping("/admin")

@Controller
public class Admin {

    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private FileService fileService;

    @RequestMapping("index")
    public String toHome(HttpSession session){
        VUser user = (VUser) session.getAttribute("user");
        if(user==null) return "redirect:/admin/login";
        return "/user/userHome.jsp";
    }

    @RequestMapping("login")
    public String toLogin(ModelMap map){
        return "user/loginOrRegister.jsp";
    }
    @ResponseBody
    @RequestMapping("doLogin")
    public String doLogin(TUser user, HttpSession session, @RequestParam(required = false,defaultValue = "0") int type)
    {

        /*if(user.getName()!=null && user.getPassword()!=null){
            String pass=user.getPassword();
            user=userService.selectByName(user.getName());
            if(user==null || !user.getPassword().equals(pass)){
                return "-1";
            }
        }else {
            return "-1";
        }*/

        final Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getName(), user.getPassword());

        try {
            subject.login(token);
            user=userService.selectByName(user.getName());
            session.setAttribute("user",userService.selectVUser(user.getId()));
            switch (type){
                case 0:
                    session.removeAttribute("teacher");
                    break;
                case 1:
                    session.setAttribute("teacher",true);
                    break;
            }
            return user.getId().toString();
        }catch (Exception e){
            return   "-1";
        }
    }

    @ResponseBody
    @RequestMapping("doRegister")
    public String doRegister(TUser user,HttpSession session){
        if(user.getName()!=null){
            TUser tUser = userService.selectByName(user.getName());
            if(tUser!=null){
                return "-1";
            }else {

                SimpleHash md5=new SimpleHash(
                        "MD5",//加密算法
                      user.getPassword(),//要加密的用户密码
                        "abcd",
                        1024 //加密次数
                );
                String pwd=user.getPassword();
                user.setPassword(String.valueOf(md5));
                int i= userService.insertSelective(user);

                if(i>0){
                    return user.getId().toString();
                }
            }
        }else {
            return "-1";
        }
        return user.getId().toString();
    }
    @RequestMapping("managerLogin")
    public String ManagerLogin(){
        return "/user/AdminLogin.jsp";
    }


    @RequestMapping("homeLeft")
    public String homeLeft(){
        return "/user/userLeft.jsp";
    }

    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        session.removeAttribute("teacher");
        Subject lvSubject=SecurityUtils.getSubject();
        lvSubject.logout();
        return "redirect:/admin/login";
    }

    @ResponseBody
    @RequestMapping(value ="/update",produces = "text/plain;charset=UTF-8")
    public String userUpdate(Long id, String type, String context, HttpSession httpSession) throws ParseException {
        VUser user = (VUser) httpSession.getAttribute("user");
        if(type.equals("head")){
            String realPath = httpSession.getServletContext().getRealPath("/images/head/" + user.getId());
            fileService.GenerateImage(context,realPath,"head");
            context="/images/head/"+user.getId()+"/head.jpg";
        }
        if(userService.updateUser(id,type,context)){
            httpSession.setAttribute("user",userService.selectVUser(user.getId()));
            return "success";
        }
        return "fail";
    }

    @ResponseBody
    @RequestMapping(value="/alter",produces = "text/plain;charset=UTF-8")
    public String userAlter(TUser user,HttpSession session){
        final VUser vUser = (VUser) session.getAttribute("user");
        user.setId(vUser.getId());
        if(userService.updateByPrimaryKeySelective(user)>0){
            session.setAttribute("user",userService.selectVUser(user.getId()));
            return "success";
        }
        return "fail";
    }
}
