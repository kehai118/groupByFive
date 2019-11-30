package com.second.service.exam;

import com.second.mapper.exam.BaseMapper;
import com.second.mapper.exam.TExamAnswerMapper;
import com.second.mapper.exam.TExamMapper;
import com.second.pojo.exam.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ExamServiceImpl  implements BaseService<TExam>{
    @Autowired
    private TExamMapper examMapper;
    @Autowired
    private TExamAnswerMapper answerMapper;
    @Autowired
    private TestPaperServiceImpl  paperService;

    @Override
    public BaseMapper getMapper() {
        return examMapper;
    }

    public Long computeScore(TExamAnswer examAnswer){
        final TExam exam = examMapper.selectByPrimaryKey(examAnswer.getExamId());
        String[] strings = examAnswer.getAnswer().substring(1, examAnswer.getAnswer().length() - 1).concat(",1").split(",");
        TTestPaper paper = paperService.selectByPrimaryKey(exam.getTestPaperId());
        List<TQuestion> questions = paper.getQuestions();
        String questionsId = paper.getQuestionsId();
        questions.sort(Comparator.comparingInt(e -> questionsId.indexOf(e.getId().toString())));
        List<String> list = questions.stream().map(e -> e.getAnswer()).collect(Collectors.toList());
        Long score=0L;
        for (int i = 0; i < list.size(); i++) {
            score+=questions.get(i).getScore()/comparisonResult(list.get(i),strings[i]);
        }



        examAnswer.setScore(score);
        return score;
    }

    public int insertAnswer(TExamAnswer answer){
        return answerMapper.insertSelective(answer);
    }

    public TExamAnswer selectAnswer(TExamAnswerKey tExamAnswerKey){
        return  answerMapper.selectByPrimaryKey(tExamAnswerKey);
    }

    private int comparisonResult(String target,String need){
        if(need.length()>target.length()) return 100000;
        if(need.length()==target.length() && target.equals(need)) return 1;
        else {
            String[] split = need.split("");
            for (String s : split) {
                if(!target.contains(s)) return 100000;
            }
            return 2;
        }
    }

    public List<TExamAnswer> selectAnswersByUserId(Long id) {
        return answerMapper.selectAnswersByUserId(id);
    }
}
