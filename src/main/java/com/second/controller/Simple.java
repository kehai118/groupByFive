package com.second.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Simple {
    @RequestMapping("/index.jsp")
    public String toIndex(){
        return "/index.jsp";
    }
}
