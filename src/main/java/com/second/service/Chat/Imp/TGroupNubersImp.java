package com.second.service.Chat.Imp;

import com.second.mapper.BaseDao;
import com.second.mapper.TGroupNubersMapper;
import com.second.pojo.TChatNote;
import com.second.pojo.TGroupNubers;
import com.second.service.Chat.TGroupNubersSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TGroupNubersImp extends BaseImp<TGroupNubers> implements TGroupNubersSerivce {
    @Autowired
    TGroupNubersMapper tGroupNubersMapper;

    @Override
    BaseDao<TGroupNubers> baseDao() {
        return tGroupNubersMapper;
    }
}
