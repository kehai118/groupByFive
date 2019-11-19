package com.second.pojo;

public enum Location{
    DEFAULT,BLOG,NOTE,CHAT;

    public String getURL(){
        switch (this){
            case BLOG:
                return "/blog/index";
            case CHAT:
                return "/chat/index";
            case NOTE:
                return "/note/index";
            default:
                return "home";
        }
    }

}
