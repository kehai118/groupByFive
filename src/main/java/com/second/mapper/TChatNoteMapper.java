package com.second.mapper;

import com.second.pojo.TChatNote;
import java.math.BigDecimal;

public interface TChatNoteMapper extends BaseDao{

    int add(TChatNote message1);
}