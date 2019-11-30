package com.second.service.note;


import com.second.mapper.note.TArticleDao;
import com.second.mapper.note.TUserDao;
import com.second.pojo.note.TArticle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * 描述:
 *
 * @author yuqing
 * @create 2019-11-24 20:03
 */
@Service
public class TArticleServiceImpl implements TArticleService{
    @Autowired
    private TArticleDao tArticleDao;

    @Autowired
    private TUserDao tUserDao;
    /**
     * 新增笔记
     * @param tArticle
     * @return
     */
    public int insertArticle(TArticle tArticle) {
        return tArticleDao.insertArticle(tArticle);
    }

    @Override
    public int updateArticle(TArticle record) {
        return tArticleDao.updateByPrimaryKeySelective(record);
    }

    @Override
    public int deleteArticle(BigDecimal id) {
        return 0;
    }

    @Override
    public int insertSelective(TArticle tArticle) {
        return tArticleDao.insertSelective(tArticle);
    }

    /**
     * 查询所有笔记
     * @return
     */
    public List<TArticle> selectAll() {
        return tArticleDao.selectAll();
    }

    /**
     * 模糊查询
     * @param tArticle
     * @return
     */
    @Override
    public List<TArticle> selectLike(TArticle tArticle) {
        return tArticleDao.selectLike(tArticle);
    }
    //新增笔记
    @Override
    public int insertTitleAndArticle(String title, String article) {
        return tArticleDao.insertTitleAndArtlcle(title,article);
    }

    @Override
    public int deleteByPrimaryKey(Long id) {
        return tArticleDao.deleteByPrimaryKey(id);
    }
}

