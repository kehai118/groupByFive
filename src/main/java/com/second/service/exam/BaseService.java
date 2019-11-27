package com.second.service.exam;

import com.second.mapper.exam.BaseMapper;

import java.util.List;

public interface BaseService<T>{

    BaseMapper getMapper();

     default int deleteByPrimaryKey(Long id){
         return getMapper().deleteByPrimaryKey(id);
     }

    default int insert(T record){
        return getMapper().insert(record);
    }

    default int insertSelective(T record){
        return getMapper().insertSelective(record);
    }

    default T selectByPrimaryKey(Long id){
        return (T)getMapper().selectByPrimaryKey(id);
    }

    default int updateByPrimaryKeySelective(T record){
        return getMapper().updateByPrimaryKeySelective(record);
    }

    default int updateByPrimaryKey(T record){
        return getMapper().updateByPrimaryKey(record);
    }

    default List<T> selectSelective(T record){
        return getMapper().selectSelective(record);
    }
}
