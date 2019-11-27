package com.second.service.exam;

import com.second.mapper.exam.BaseMapper;
import com.second.mapper.exam.TUserMapper;
import com.second.mapper.exam.TUserOtherMapper;
import com.second.mapper.exam.VUserMapper;
import com.second.pojo.exam.TUser;
import com.second.pojo.exam.TUserOther;
import com.second.pojo.exam.VUser;
import com.second.service.exam.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;

@Service
public class UserServiceImpl implements BaseService<TUser>{
    @Autowired
    private TUserMapper userMapper;
    @Autowired
    private VUserMapper vUserMapper;
    @Autowired
    private TUserOtherMapper userOtherMapper;

    @Override
    public BaseMapper getMapper() {
        return userMapper;
    }

    @Override
    public int insert(TUser record) {
        int i=BaseService.super.insert(record);
        final String sex = record.getSex();
        if(sex.equals("男")){
           userOtherMapper.insertSelective(new TUserOther(record.getId(),"/images/head/default/man.png","Hi，我是"+record.getName()));
        }else{
          userOtherMapper.insertSelective(new TUserOther(record.getId(),"/images/head/default/feman.png","Hi，我是"+record.getName()));
        }
        return i;
    }

    @Override
    public int insertSelective(TUser record) {
        int i=BaseService.super.insertSelective(record);
        final String sex = record.getSex();
        if(sex.equals("男")){
            userOtherMapper.insertSelective(new TUserOther(record.getId(),"/images/head/default/man.png","Hi，我是"+record.getName()));
        }else{
            userOtherMapper.insertSelective(new TUserOther(record.getId(),"/images/head/default/feman.png","Hi，我是"+record.getName()));
        }
        return i;
    }

    public TUser selectByName(String name) {
        return userMapper.selectByName(name);
    }

    public VUser selectVUser(Long id){
        return vUserMapper.selectByID(id);
    }

    public boolean updateUser(Long id, String type, String toUpdate) throws ParseException {
        TUserOther vUserHome = new TUserOther();
        vUserHome.setId(id);
        switch (type) {
            case "greet":
                vUserHome.setGreet(toUpdate);
                break;
            case "tagIntroduction":
                vUserHome.setTagintroduction(toUpdate);
                break;
            case "introduction":
                vUserHome.setIntroduction(toUpdate);
                break;
            case "tagAbout":
                vUserHome.setTagabout(toUpdate);
                break;
            case "about":
                vUserHome.setAbout(toUpdate);
                break;
            case "background":
                vUserHome.setBackground(toUpdate);
                break;
            case "head":
                vUserHome.setHead(toUpdate);
                break;
            case "birthday":
                final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                vUserHome.setBirthday(dateFormat.parse(toUpdate));
                break;
            default:
                return false;
            }
        return userOtherMapper.updateByPrimaryKeySelective(vUserHome)>0;
    }

}
