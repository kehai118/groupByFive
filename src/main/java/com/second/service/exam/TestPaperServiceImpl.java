package com.second.service.exam;

import com.second.mapper.exam.BaseMapper;
import com.second.mapper.exam.TQuestionMapper;
import com.second.mapper.exam.TTestPaperMapper;
import com.second.pojo.exam.TQuestion;
import com.second.pojo.exam.TTestPaper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class TestPaperServiceImpl implements BaseService<TTestPaper>{
    @Autowired
    private TTestPaperMapper testPaperMapper;
    @Autowired
    private TQuestionMapper questionMapper;

    @Override
    public BaseMapper getMapper() {
        return testPaperMapper;
    }

    @Override
    public TTestPaper selectByPrimaryKey(Long id) {
        TTestPaper paper = BaseService.super.selectByPrimaryKey(id);
        paper.setQuestions(getQuestion(paper.getQuestionsId()));
        return paper;
    }

    @Override
    public List<TTestPaper> selectSelective(TTestPaper record) {
        final List<TTestPaper> papers = BaseService.super.selectSelective(record);
        papers.forEach(e->e.setQuestions(getQuestion(e.getQuestionsId())));
        return papers;
    }

    public List<TQuestion> getQuestion(String str){
        String[] split = str.substring(1, str.length() - 1).split(",");
        ArrayList<Integer> list = new ArrayList<>();
        for (String s : split) {
            list.add(Integer.valueOf(s));
        }
        return   questionMapper.selectQuestionIn(list);
    }
}
