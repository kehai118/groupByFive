package com.second.service.Chat.Imp;

import com.second.mapper.BaseDao;
import com.second.service.Chat.BaseInterface;
import org.apache.commons.lang3.ObjectUtils;
import org.codehaus.jackson.map.Serializers;

public abstract class BaseImp<T> implements BaseInterface<T> {

    abstract BaseDao baseDao();

    @Override
    public int deleteByPrimaryKey(Long id) {
        return 0;
    }

    @Override
    public int insert(T record) {
        return 0;
    }

    @Override
    public int insertSelective(T record) {
        return 0;
    }

    @Override
    public T selectByPrimaryKey(Long id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(T record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(T record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Long record) {
        return 0;
    }
}
