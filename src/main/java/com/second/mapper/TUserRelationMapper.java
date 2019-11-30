package com.second.mapper;

import com.second.pojo.TUserRelation;

import java.util.List;

public interface TUserRelationMapper extends BaseDao{

    List<TUserRelation> selectAll();

    int inserts(TUserRelation relation);
}