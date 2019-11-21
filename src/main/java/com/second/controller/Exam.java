package com.second.controller;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
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
        map.put("list",collect);
        return "/exam/selectExam.jsp";
    }
    @RequestMapping("/examHistory")
    public String examHistory(ModelMap map) throws IOException {
        class Q implements Serializable,Cloneable {
            public int id=(int)(Math.random()*1000);
          public  String name;
           public String user;
          public  String teacher;
          public  String group;
         public   int score;
         public String appraise;
          public  String createTime;

            public Q() {
            }

            public Q(String name, String user, String teacher, String group, int score, String appraise,String createTime) {
                this.name = name;
                this.user = user;
                this.teacher = teacher;
                this.group = group;
                this.score = score;
                this.appraise=appraise;
                this.createTime = createTime;
            }

            Q d(){score--;
                try {
                    return (Q) this.clone();
                } catch (CloneNotSupportedException e) {
                    e.printStackTrace();
                    return new Q("19/11/21", "张三", "bigPeng", "sc1907", 97, "good","2000/12/23");
                }
            }
        }

        final Q q = new Q("19/11/21", "张三", "bigPeng", "sc1907", 97, "good","2000/12/23");
        final ArrayList<Q> qs = new ArrayList<>();
        int i=100;
        while(i-->0){
            qs.add(q.d());
        }

        ObjectMapper ob = new ObjectMapper();

        map.put("result",ob.writeValueAsString(qs));

        return "/exam/examHistory.jsp";
    }

    @RequestMapping("submitExam")
    public String submitExam(HttpServletRequest request){
        //check result and return index
        Map<String, String[]> map = request.getParameterMap();

        //id=service.submitAndCheckAnswer(map);

        Long id=45L;
        return "redirect:/exam/checkExam?id="+id;
    }

    @RequestMapping("checkExam")
    public String checkExam(Long id,ModelMap map){
        //exam=service.getExamById(id);
        //userAnswer=service.getAnswerByExamId(id);
        //map.put("result",exam); map.put("answer",userAnswer);
        return "/exam/checkHistoryExam.jsp";
    }

}
