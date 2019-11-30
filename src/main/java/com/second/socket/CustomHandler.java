package com.second.socket;

import com.second.pojo.TChatNote;
import com.second.pojo.exam.VUser;
import com.second.service.Chat.TChatNoteService;
import com.second.service.exam.UserServiceImpl;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
/*
 * 当与客户端建立连接之后会触发该方法
 * */
@Component
public class CustomHandler  extends TextWebSocketHandler {
    @Autowired
    private UserServiceImpl userService;

    public static Map<Long,WebSocketSession> sessionMap=new
            ConcurrentHashMap<>();

    @Autowired
    TChatNoteService tChatNote;
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println("客户端连接成功");
        Map<String,Object> attributes=session.getAttributes();
        VUser user= (VUser) attributes.get("user");
        if(user!=null){
            Long id = user.getId();
            sessionMap.put(id,session);
        }
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        System.out.println("接收到客户端消息："+message.getPayload());
        //获取到客户端发送的消息
        String json=message.getPayload();
        ObjectMapper objectMapper=new ObjectMapper();
        TChatNote message1=objectMapper.readValue(json,TChatNote.class);
        System.out.println("接收到消息"+message1);
        String s = objectMapper.writeValueAsString(message1);
        System.out.println(s);
        //获取到接收者ID
         Long revid=message1.getTargetId();
        VUser vUser = userService.selectVUser(message1.getSenderId());
        message1.setTargetName(vUser.getName());
        //获取对方的session
        WebSocketSession revSession=sessionMap.get(revid);
        if(revSession==null){
            //todo 把消息保存到数据库，并设定为未读消息
            System.out.println("对方不在线的，revid:"+revid);
        }else{
            int insert = tChatNote.add(message1);
            if(insert>0) System.out.println("插入成功！");
            message1.setCraetAt(new Date());
            json=objectMapper.writeValueAsString(message1);
            revSession.sendMessage(new TextMessage(json));
            //todo 将消息保存数据库
        }
    }
     /*
     * 客户端连接断开之后调用
     * */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        System.out.println("客户端连接关闭");
        Map<String,Object> attribute=session.getAttributes();
        VUser users= (VUser) attribute.get("user");
        if(users!= null){
            Long id=users.getId();//获取到用户ID
            sessionMap.remove(id);

        }
        super.afterConnectionClosed(session,status);
    }

}
