package com.second.controller;

import com.second.pojo.exam.*;
import com.second.service.exam.ExamServiceImpl;
import com.second.service.exam.QuestionServiceImpl;
import com.second.service.exam.TestPaperServiceImpl;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/exam")
public class Exam {

    @Autowired
    private ExamServiceImpl examService;
    @Autowired
    private QuestionServiceImpl questionService;
    @Autowired
    private TestPaperServiceImpl paperService;

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
        List<TExam> exams = examService.selectSelective(null);
        List<String> collect = exams.stream().map(e -> e.gettTestPaper().getName()).collect(Collectors.toList());
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

    @RequestMapping("addQuestion")
    public String addQuestion(@RequestParam(required = false) String type,@RequestParam(required = false) String kind,
                              @RequestParam(required = false) String question,@RequestParam(required = false) Long score,
                              ModelMap map) {
        TQuestion searchCondition = new TQuestion();
        if(type!=null) searchCondition.setType(type);
        if(kind!=null) searchCondition.setKind(kind);
        if(question!=null) searchCondition.setQuestion(question);
        if(score!=null) searchCondition.setScore(score);
        map.put("question",questionService.selectSelective(searchCondition));
        return "/exam/addQuestion.jsp";
    }

    @ResponseBody
    @RequestMapping("addQuestionSubmit")
    public String addQuestion(TQuestion question,HttpSession session){
        //TUser user =(TUser) session.getAttribute("user");
        //question.setCreateById(user.getId());
        questionService.insertOrUpdate(question);
        return question.getId().toString();
    }
    @ResponseBody
    @RequestMapping("newPaperSubmit")
    public String newPaperSubmit(TTestPaper paper,HttpSession session){
        //TUser user =(TUser) session.getAttribute("user");
        //paper.setCreateById(user.getId());
        System.out.println(paper);

        paperService.insertSelective(paper);
        return paper.getId().toString();
    }

    @ResponseBody
    @RequestMapping("searchQuestion")
    public String searchQuestion(String question){
        TQuestion q = questionService.selectByQuestion(question);
        return q==null?"-1":q.getId().toString();
    }

    @ResponseBody
    @RequestMapping(value = "getQuestion",produces = "application/json;charset=utf-8")
    public String getQuestion(Long id) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        TQuestion question = questionService.selectByPrimaryKey(id);
        return mapper.writeValueAsString(question);
    }

    @RequestMapping("addPaper")
    public String addPaper(@RequestParam(required = false) String type,@RequestParam(required = false) String kind,
                           @RequestParam(required = false) String question,@RequestParam(required = false) Long score,
                           ModelMap map){
        TQuestion searchCondition = new TQuestion();
        if(type!=null) searchCondition.setType(type);
        if(kind!=null) searchCondition.setKind(kind);
        if(question!=null) searchCondition.setQuestion(question);
        if(score!=null) searchCondition.setScore(score);
        map.put("question",questionService.selectSelective(searchCondition));
        return  "/exam/newPaper.jsp";
    }

    @RequestMapping("newTest")
    public String newTest(ModelMap map,HttpSession session){
        final TUser tUser = new TUser();
        tUser.setName("BigPeng");
        map.put("user",tUser);
        map.put("paper",paperService.selectSelective(new TTestPaper()));
        return "/exam/newTest.jsp";
    }
}
