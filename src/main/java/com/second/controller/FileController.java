package com.second.controller;
import com.second.pojo.TUserRelation;
import com.second.pojo.exam.TUser;
import com.second.pojo.exam.VUser;
import com.second.service.Chat.TUserRelationServic;
import com.second.service.exam.UserServiceImpl;
import com.second.service.note.TUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/com")
public class FileController {
  @Autowired
  UserServiceImpl tUserService;
  @Autowired
  TUserRelationServic tUserRelation;
/* @RequestMapping("login")
 public String login(String tt,ModelMap map){
     map.put("tt",tt);
     return "chat/login.jsp";
 }*/

/*@RequestMapping("login")
public String login(){
    return "chat/login.jsp";
}*/


 @RequestMapping("index")
 public String loginOK(TUser tUser, ModelMap map, HttpSession session){
//     TUser tUser1 = tUserService.selectAccount(tUser.getAccount());
     final VUser user = (VUser) session.getAttribute("user");
     List<TUserRelation>  list=tUserRelation.selectAll();
     if(list.size()>0)  map.put("relation",list);
     return "chat/index.jsp";
 }


/* @RequestMapping("register")
 public String register(){
     return "chat/register.jsp";
 }*/

 @ResponseBody
 @RequestMapping("account")
 public String account(String account){
     return null;
 }

/*@RequestMapping("insert")
 public String insert(TUser tUsers){
     return "chat/login.jsp";
 }*/
 @ResponseBody
 @RequestMapping("select")
 public String select(TUser tUsers, HttpSession session){
    //TUser tUser=tUserService.get(tUsers.getAccount());
     final TUser user = tUserService.selectByName(tUsers.getName());
     final VUser tUser = tUserService.selectVUser(tUsers.getId());

     if(tUser==null){
         return "1";
     }else if(!tUser.getPassword().equals(tUsers.getPassword())){
         return "2";
     }
     session.setAttribute("user",tUser);
     return "0";
 }
 @ResponseBody
@RequestMapping("selectUp")
public List<TUser> selectUp(TUser tUser){
     List<TUser> like = tUserService.selectSelective(tUser);
     return like;
}
@ResponseBody
@RequestMapping("selectId")
public TUser selectId(TUserRelation tr){
    TUser  t=tUserService.selectByPrimaryKey(tr.getTarget());
    /*int insert = tUserRelation.inserts(tr);*/
    return t;
    }
@ResponseBody
@RequestMapping("rel")
public String relation(TUserRelation relation){
    int insert = tUserRelation.inserts(relation);
    if(insert==0)return "0";
    return  "1";
}
}
