package com.second.service.Chat.Imp;

import com.second.mapper.BaseDao;
import com.second.mapper.TGroupMapper;
import com.second.pojo.TChatNote;
import com.second.pojo.TGroup;
import com.second.service.Chat.TGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TGroupImp extends BaseImp<TGroup> implements TGroupService {
    @Autowired
    TGroupMapper tGroupMapper;

    @Override
    BaseDao<TGroup> baseDao() {
        return tGroupMapper;
    }
}
