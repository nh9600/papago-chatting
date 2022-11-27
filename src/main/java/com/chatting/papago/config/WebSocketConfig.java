package com.chatting.papago.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		//메모리 기반 메세지 브로커가 해당 api를 구독하고 있는 클라이언트에게 메세지를 전달
		registry.enableSimpleBroker("/topic");
		//서버에서 클라이언트로부터의 메세지를 받을 api의 prefix를 설정
		registry.setApplicationDestinationPrefixes("/app");
	}
	
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		//클라이언트로부터 메세지를 받을 api를 설정
		registry.addEndpoint("/chat").withSockJS();
	}
}	
