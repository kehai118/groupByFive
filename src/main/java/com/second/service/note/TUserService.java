package com.second.service.note;

import com.second.pojo.note.TUser;

public interface TUserService {
    TUser selectByNameAndPassword(String name, String password);
}
