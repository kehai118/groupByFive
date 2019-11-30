package com.second.controller;

import com.second.pojo.exam.VUser;
import com.second.pojo.note.TArticle;
import com.second.pojo.note.TUser;
import com.second.service.note.TArticleService;
import com.second.service.note.TUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.List;

/**
 * 描述:
 *
 * @author yuqing
 * @create 2019-11-22 17:04
 */
@Controller
@RequestMapping("/note")//请求前缀
public class Note {
    @Autowired
    private TArticleService tArticleService;

    @Autowired
    private TUserService tUserService;

    @RequestMapping("/toLearn")
    public String toLearn(){
        return "learn/notePage.jsp";
    }

    //新增笔记
    @RequestMapping("/insert")
    public String insertSelective(TArticle tArticle, ModelMap modelMap ,HttpSession session){
        final VUser user = (VUser) session.getAttribute("user");
        int i=0;
        tArticle.setAuthorId(user.getId());
        if(tArticle.getId()==null) {//如果没传ID就是新增
            i = tArticleService.insertSelective(tArticle);
        }else{//传了ID则为修改
            i=tArticleService.updateArticle(tArticle);
        }
        if(i==0){
            modelMap.put("insert","插入失败");
        }
        return "redirect:/note/toEdit";
    }


//        //删除笔记
//        @RequestMapping("/delete")
//        public int deleteArticle(TArticle tArticle){
//             int i=tArticleService.deleteArticle(tArticle);
//             if (i==0){
//
//                 return "delete";
//             }
//
//                 return "learn/edit.jsp";
//        }

        @RequestMapping("/todelete")
        public String toDelete(){
            return "learn/delete.jsp";
        }


    //修改笔记
    @ResponseBody
    @RequestMapping("/update")
    public int update(TArticle record){
        return tArticleService.updateArticle(record);
    }

    //模糊查询笔记
    @RequestMapping("/selectLike")
    public String selectLike(TArticle tArticle){
        List<TArticle> articles=tArticleService.selectLike(tArticle);
        return "/learn/edit.jsp";
    }


    /**
     * 前往编辑，带入 List 渲染编辑界面
     * @param session
     * @return
     */
    @RequestMapping("/toEdit")
    public String toEdit(HttpSession session){
        List<TArticle> tArticles = tArticleService.selectAll();
        session.setAttribute("tArticles",tArticles);
        return "learn/edit.jsp";
    }

    @RequestMapping("/Login")
    public String Login(String name, String password, HttpSession session){
        TUser tUser = tUserService.selectByNameAndPassword(name, password);
        //登录失败
        if (tUser == null){
            session.setAttribute("Login","登录失败");
            return "learn/Login.jsp";
        }
        //登录成功
        session.setAttribute("Login",tUser);
        return "learn/notePage.jsp";
    }

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "learn/Login.jsp";
    }

    @RequestMapping("/loadPage")
    public String loadPage(String pageSrc){
        return "learn/alert/"+pageSrc+".jsp";
    }

//    添加笔记
//    @RequestMapping("/toAdd")
//    public String toAdd(){
//        return "learn/add.jsp";
//    }


    @RequestMapping("/selectByLike")
    public String selectByLike(TArticle tArticle,ModelMap modelMap,HttpSession session){
        List<TArticle> tArticles = tArticleService.selectLike(tArticle);
        session.setAttribute("tArticles",tArticles);
        return "learn/edit.jsp";
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    public String delete(Long id){
        int i = tArticleService.deleteByPrimaryKey(id);
        return "redirect:/note/toEdit";
    }
}
