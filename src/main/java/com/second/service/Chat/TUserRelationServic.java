package com.second.service.Chat;

import com.second.pojo.TUserRelation;

import java.util.List;

public interface TUserRelationServic extends BaseInterface<TUserRelation>{
    List<TUserRelation> selectAll();

    int inserts(TUserRelation relation);
}
