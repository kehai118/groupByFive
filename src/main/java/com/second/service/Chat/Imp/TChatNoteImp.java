package com.second.service.Chat.Imp;

import com.second.mapper.BaseDao;
import com.second.mapper.TChatNoteMapper;
import com.second.pojo.TChatNote;
import com.second.service.Chat.TChatNoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TChatNoteImp extends BaseImp<TChatNote> implements TChatNoteService {
    @Autowired
    TChatNoteMapper tChatNoteMapper;
    @Override
    BaseDao<TChatNote> baseDao() {
        return tChatNoteMapper;
    }

    @Override
    public int add(TChatNote message1) {
        return tChatNoteMapper.add(message1);
    }

    @Override
    public int deleteByPrimaryKey(Long id) {
        return super.deleteByPrimaryKey(id);
    }

    @Override
    public TChatNote selectByPrimaryKey(Long id) {
        return super.selectByPrimaryKey(id);
    }
}
