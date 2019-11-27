package com.second.service.exam;

import com.second.mapper.exam.BaseMapper;
import com.second.mapper.exam.TQuestionMapper;
import com.second.mapper.exam.TQuestionOptionMapper;
import com.second.pojo.exam.TQuestion;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class QuestionServiceImpl implements BaseService<TQuestion> {

    @Autowired
    private TQuestionMapper questionMapper;
    @Autowired
    private TQuestionOptionMapper optionMapper;
    @Override
    public BaseMapper getMapper() {
        return questionMapper;
    }

    public int insertQuestion(TQuestion question){
       questionMapper.insertSelective(question);
       question.writeOptions();
       return optionMapper.insertList(question.getOptions());
    }

    public int deleteQuestion(TQuestion question){
        return questionMapper.deleteByPrimaryKey(question.getId());
    }

    public int updateQuesiton(TQuestion question){
      return deleteQuestion(question)+insertQuestion(question);
    }
    public int insertOrUpdate(TQuestion question){
        if(question.importMessage().replaceAll("null","").isEmpty()){
            deleteQuestion(question);
            question.setId(-1L);
            return 1;
        }
        boolean b = question.getId()==null;
        return b?insertQuestion(question):updateQuesiton(question);
    }

    public TQuestion selectByQuestion(String question) {
        return questionMapper.selectByQuestion(question);
    }

}
