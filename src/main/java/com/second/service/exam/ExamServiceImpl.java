package com.second.service.exam;

import com.second.mapper.exam.BaseMapper;
import com.second.mapper.exam.TExamMapper;
import com.second.pojo.exam.TExam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExamServiceImpl  implements BaseService<TExam>{
    @Autowired
    private TExamMapper tExamMapper;

    @Override
    public BaseMapper getMapper() {
        return tExamMapper;
    }
}
