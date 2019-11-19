package com.second.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")

@Controller
public class Admin {
    @RequestMapping("login-register")
    public String toLogin(ModelMap map){
        return "user/loginOrRegister.jsp";
    }
    @RequestMapping("dologin")
    public String doLogin(){
        return "";
    }

    @RequestMapping("doRegister")
    public String doRegister(){
        return "";
    }
    @RequestMapping("managerLogin")
    public String ManagerLogin(){
        return "/user/AdminLogin.jsp";
    }


}
