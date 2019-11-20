package com.second.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
@RequestMapping("/exam")
public class Exam {
    @RequestMapping("/index")
    public String examHome(){
        return "/exam/examHome.jsp";
    }

    @RequestMapping("/doExam")
    public String doExam(){
        return "/exam/doExam.jsp";
    }

    @RequestMapping("/selectExam")
    public String selectorExam(ModelMap map){
        //todo

        final List<String> collect = Stream.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17).map(e -> "<span index=\'" + e + "\'>" + e + "</span>").collect(Collectors.toList());
        System.out.println(collect);
        map.put("list",collect);
        return "/exam/selectExam.jsp";
    }

}
