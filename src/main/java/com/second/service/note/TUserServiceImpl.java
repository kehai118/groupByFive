package com.second.service.note;


import com.second.mapper.note.TUserDao;
import com.second.pojo.note.TUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 描述:
 *
 * @author yuqing
 * @create 2019-11-24 21:37
 */
@Service
public class TUserServiceImpl implements TUserService{

    @Autowired
    private TUserDao tUserDao;


    public TUser selectByNameAndPassword(String name, String password){
        TUser tUser = tUserDao.selectByNameAndPassword(name, password);
        return tUser;
    }

}

