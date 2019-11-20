package com.second.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/exam")
public class Exam {
    @RequestMapping("/home")
    public String examHome(){
        return "/exam/examHome.jsp";
    }
}
