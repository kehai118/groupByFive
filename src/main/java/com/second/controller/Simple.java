package com.second.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class Simple {
    @RequestMapping("/home")
    public String toIndex(){
        return "/index.jsp";
    }

    @RequestMapping("/table")
    public String table(@RequestParam("url")String url, List<String> th, List<String> tr, ModelMap map){
        map.put("th",th);
        map.put("tr",tr);
        return "/table.jsp";
    }
}
