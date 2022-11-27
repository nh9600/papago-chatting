package com.chatting.papago.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@ServerEndpoint(value="/ws/chat",configurator = ServletConfig.class)
@Slf4j
@Component
public class SocketTest {

	private static List<Session> ssList = new ArrayList<>();

	@OnOpen
	public void open(Session ss,EndpointConfig ec) {
		HttpSession hs = (HttpSession)ec.getUserProperties().get("hs");
		if (ssList.indexOf(ss) == -1) {
			ssList.add(ss);
		}
		log.info(ss.getId());
		try {
			ss.getBasicRemote().sendText("채팅 시작");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@OnMessage
	public void message(String msg, Session ss) {
		log.info("msg=>{}",msg);
		for (Session ss1 : ssList) {
				try {
					ss1.getBasicRemote().sendText("\r"+ ss.getId()+"님"+msg);
				} catch (IOException e) {
					e.printStackTrace();
				}
		
		}
	}

	@OnClose
	public void close(Session ss) {
		ssList.remove(ss);
		log.info(ss.getId());
	}

	@OnError
	public void error(Throwable t) {
		log.error("err=>{}", t);
	}

}
