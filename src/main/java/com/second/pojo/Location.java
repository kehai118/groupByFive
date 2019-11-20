package com.second.pojo;

public enum Location{
    DEFAULT,BLOG,NOTE,CHAT,EXAM;

    public String getURL(){
        switch (this){
            case EXAM:
                return "/exam/home";
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
