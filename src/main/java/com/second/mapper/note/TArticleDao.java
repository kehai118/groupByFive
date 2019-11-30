package com.second.mapper.note;


import com.second.pojo.note.TArticle;
import org.apache.ibatis.annotations.Mapper;

import java.math.BigDecimal;
import java.util.List;

@Mapper
public interface TArticleDao {
    //根据主键删除
    int deleteByPrimaryKey(Long id);

    int insert(TArticle record);

    int insertSelective(TArticle record);

    TArticle selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(TArticle record);

    int updateByPrimaryKeyWithCLOBs(TArticle record);

    int updateByPrimaryKey(TArticle record);
    //新增笔记
    int insertArticle(TArticle tArticle);
    //修改笔记
    int updateArticle(BigDecimal id);
    //查询所有的笔记
    List<TArticle> selectAll();

    //模糊查询
    List<TArticle> selectLike(TArticle tArticle);

    int insertTitleAndArtlcle(String title, String article);
}