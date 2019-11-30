package com.second.socket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;
@Configuration//配置类注解
@EnableWebSocket//开启websocket服务支持
public class WebSocketConfig implements WebSocketConfigurer {

   @Autowired
   private CustomHandler customHandler;
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry register) {
         register.addHandler(customHandler,"/socket").addInterceptors
                 (new HttpSessionHandshakeInterceptor());
    }
}
