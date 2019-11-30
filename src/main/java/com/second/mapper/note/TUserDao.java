package com.second.mapper.note;

import com.second.pojo.note.TUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;

@Mapper
public interface TUserDao {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(TUser record);

    int insertSelective(TUser record);

    TUser selectByPrimaryKey(BigDecimal id);

    TUser selectByNameAndPassword(@Param("name") String name, @Param("password") String password);

    int updateByPrimaryKeySelective(TUser record);

    int updateByPrimaryKey(TUser record);
}