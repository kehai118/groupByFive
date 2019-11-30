package com.second.controller;

import com.second.pojo.exam.*;
import com.second.service.exam.ExamServiceImpl;
import com.second.service.exam.QuestionServiceImpl;
import com.second.service.exam.TestPaperServiceImpl;
import com.second.service.exam.UserServiceImpl;
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
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
@RequestMapping("/exam")
public class Exam {

    @Autowired
    private ExamServiceImpl examService;
    @Autowired
    private QuestionServiceImpl questionService;
    @Autowired
    private TestPaperServiceImpl paperService;
    @Autowired
    private UserServiceImpl userService;

    @RequestMapping("/index")
    public String examHome(){
        return "/exam/examHome.jsp";
    }

    @RequestMapping("/doExam")
    public String doExam(ModelMap map,Long id,HttpSession session){
        final VUser user = (VUser) session.getAttribute("user");
        if(examService.selectAnswer(new TExamAnswerKey(user.getId(),id))!=null){
            map.put("isDo",true);
            return "/exam/ExamError.jsp";
        }
        TExam exam = examService.selectByPrimaryKey(id);

        Calendar instance = Calendar.getInstance();
        Date startTime = exam.getExamTime();
        if(instance.getTime().compareTo(startTime)>0){
            instance.add(Calendar.MINUTE, -1*exam.getTestTime().intValue());
            if (instance.getTime().compareTo(startTime)>0) {
                map.put("history",true);
                return "/exam/ExamError.jsp";
            }else {
                instance=Calendar.getInstance();
                instance.add(Calendar.MINUTE,-30);
                if (instance.getTime().compareTo(startTime) > 0) {
                    map.put("missTime",true);
                    return "/exam/ExamError.jsp";
                } else {
                    map.put("exam",exam);
                    final TTestPaper paper = paperService.selectByPrimaryKey(exam.getTestPaperId());
                    map.put("paper",paper);
                    return "/exam/doExam.jsp";
                }
            }
        }else {
            map.put("notStart",true);
            return "/exam/ExamError.jsp";
        }
    }

    @RequestMapping("/selectExam")
    public String selectorExam(ModelMap map,HttpSession session){
        List<TExam> exams = examService.selectSelective(null);
        final VUser user = (VUser) session.getAttribute("user");
       List<TExamAnswer> answers= examService.selectAnswersByUserId(user.getId());
        final List<Long> longs = answers.stream().map(e -> e.getExamId()).collect(Collectors.toList());
        exams = exams.stream().filter(e -> !longs.contains(e.getId())).collect(Collectors.toList());
        exams.forEach(e->e.settTestPaper(paperService.selectByPrimaryKey(e.getTestPaperId())));
        map.put("exam",exams);
        return "/exam/selectExam.jsp";
    }

    @RequestMapping("/examHistory")
    public String examHistory(ModelMap map,HttpSession session) throws IOException {
        class Q implements Serializable,Cloneable {
            public Long id;
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
        }

        VUser user = (VUser)session.getAttribute("user");

        List<TExamAnswer> answers = examService.selectAnswersByUserId(user.getId());

        final List<Q> qs = answers.stream().map(e -> {
            final String name = examService.selectByPrimaryKey(e.getExamId()).gettTestPaper().getName();
            final String userName = user.getName();
            String teacherName = "bigPeng";
            String group = "sc1907";
            final Long score = e.getScore();
            final Date submitTime = e.getSubmitTime();
            Q q= new Q(name, userName, teacherName, group, score.intValue(), "无", new SimpleDateFormat("yyyy/MM/dd").format(submitTime));
            q.id=e.getExamId();
            return q;
        }).collect(Collectors.toList());

        ObjectMapper ob = new ObjectMapper();
        map.put("result",ob.writeValueAsString(qs));

        return "/exam/examHistory.jsp";
    }


    @ResponseBody
    @RequestMapping("submitExam")
    public String submitExam(HttpSession session,TExamAnswer answer){
        //check result and return index
        final VUser user = (VUser) session.getAttribute("user");
        if(examService.selectAnswer(new TExamAnswerKey(user.getId(),answer.getExamId()))!=null){
            return "-1";
        }

        answer.setUserId(user.getId());

        examService.computeScore(answer);
        examService.insertAnswer(answer);
        return answer.getExamId().toString();
    }

    @RequestMapping("checkExam")
    public String checkExam(Long examId,ModelMap map,HttpSession session){
        TExam exam = examService.selectByPrimaryKey(examId);
        System.out.println(exam+"       "+examId);
        TTestPaper paper = paperService.selectByPrimaryKey(exam.getTestPaperId());
        VUser user = (VUser) session.getAttribute("user");
        TExamAnswer answer = examService.selectAnswer(new TExamAnswerKey(user.getId(), examId));
        if(answer==null) return "redirect:/exam/index";
        map.put("exam",exam);
        map.put("paper",paper);
        map.put("answer",answer);
        map.put("key",paperService.getAnswers(paper.getId()));
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
        VUser user =(VUser) session.getAttribute("user");
        question.setCreateById(user.getId());
        questionService.insertOrUpdate(question);
        return question.getId().toString();
    }
    @ResponseBody
    @RequestMapping("newPaperSubmit")
    public String newPaperSubmit(TTestPaper paper,HttpSession session){
        VUser user =(VUser) session.getAttribute("user");
        paper.setCrateById(user.getId());

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

    @RequestMapping("loadQuestion")
    public String loadQuesiton(@RequestParam(required = false) String type,@RequestParam(required = false) String kind,
                               @RequestParam(required = false) String question,@RequestParam(required = false) Long score,
                               ModelMap map){
        TQuestion searchCondition = new TQuestion();
        if(type!=null) searchCondition.setType(type);
        if(kind!=null) searchCondition.setKind(kind);
        if(question!=null) searchCondition.setQuestion(question);
        if(score!=null) searchCondition.setScore(score);
        map.put("question",questionService.selectSelective(searchCondition));
        return "/exam/loadTable.jsp";
    }

    @RequestMapping("newTest")
    public String newTest(ModelMap map,HttpSession session){
        final VUser user = (VUser) session.getAttribute("user");
         map.put("user",user);
        map.put("paper",paperService.selectSelective(new TTestPaper()));
        return "/exam/newTest.jsp";
    }


    @ResponseBody
    @RequestMapping("newTestSubmit")
    public String newTestSubmit(HttpSession session,TExam exam){
        final VUser user = (VUser) session.getAttribute("user");
        exam.setUseClassId(2l);
        exam.setCreateById(user.getId());
        exam.setId(-1l);
        examService.insertSelective(exam);
        return exam.getId().toString();
    }

    @RequestMapping("loadPaper")
    public String LoadPaper(ModelMap map, Long id,@RequestParam(required = false,defaultValue ="0")  Long type){
        final TTestPaper tTestPaper = paperService.selectByPrimaryKey(id);
        map.put("question",tTestPaper);

        if(type.equals(1l)){
            map.put("test",1);
        }else if(type.equals(2l)) {
            map.put("check",1);
        }

        return "/exam/testPaper.jsp";
    }
}
