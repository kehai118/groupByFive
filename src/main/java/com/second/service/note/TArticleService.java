package com.second.service.note;

import com.second.pojo.note.TArticle;

import java.math.BigDecimal;
import java.util.List;

public interface TArticleService {

     int insertArticle(TArticle tArticle);

     int updateArticle(TArticle record);

    int deleteArticle(BigDecimal id);

    int insertSelective(TArticle tArticle);

     List<TArticle> selectAll();

    //模糊查询
     List<TArticle> selectLike(TArticle tArticle);
    //
     int insertTitleAndArticle(String title,String article);
     //根据 ID 删除笔记
    int deleteByPrimaryKey(Long id);
}
