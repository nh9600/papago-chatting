package com.chatting.papago.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import com.chatting.papago.service.PapagoService;
import com.chatting.papago.vo.ChatMessage;
import com.chatting.papago.vo.Translate;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {

	private static Map<String, SimpMessageHeaderAccessor> map = Collections
			.synchronizedMap(new HashMap<String, SimpMessageHeaderAccessor>());

	@Resource
	private PapagoService papagoService;

	@Autowired
	private SimpMessageSendingOperations messagingTemplate;

	//기본 채팅
	@MessageMapping("/message")
	@SendTo("/topic/greetings")
	public ChatMessage message(ChatMessage cm, Translate ts) throws Exception {
		log.info("message=>{}", cm);
		return cm;
	}

	//연결(JOIN)
	@MessageMapping("/connect/{sessionId}")
	@SendTo("/topic/greetings")
	public ChatMessage connect(ChatMessage cm, @DestinationVariable String sessionId, SimpMessageHeaderAccessor smha)
			throws Exception {
		log.info(sessionId);
		log.info("message=>{}", cm);
		if (map.containsKey(cm.getSender())) {
			cm.setMessage("이미 존재하는 이름입니다.");
			messagingTemplate.convertAndSendToUser("/topic/greetings", sessionId, cm);
			return cm;
		}
		map.put(cm.getSender(), smha);
		smha.getSessionAttributes().put("username", cm.getSender());
		return cm;
	}

	@MessageMapping("/connect/test")
	@SendTo("/topic/greetings")
	public Map<String, Object> test(ChatMessage cm) {
		HashMap<String, Object> rMap = new HashMap<>();
		rMap.put("userName", cm);
		return rMap;
	}

}
