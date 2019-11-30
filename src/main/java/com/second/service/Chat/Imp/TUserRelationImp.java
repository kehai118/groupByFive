package com.second.service.Chat.Imp;

import com.second.mapper.BaseDao;
import com.second.mapper.TUserRelationMapper;
import com.second.pojo.TGroupNubers;
import com.second.pojo.TUserRelation;
import com.second.service.Chat.TUserRelationServic;
import org.codehaus.jackson.map.Serializers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TUserRelationImp extends BaseImp<TUserRelation> implements TUserRelationServic {
    @Autowired
    TUserRelationMapper tUserRelationMapper;

    @Override
    BaseDao<TUserRelation> baseDao() {
        return tUserRelationMapper;
    }

    @Override
    public List<TUserRelation> selectAll() {
        return tUserRelationMapper.selectAll();
    }

    @Override
    public int inserts(TUserRelation relation) {
        return tUserRelationMapper.inserts(relation);
    }
}
