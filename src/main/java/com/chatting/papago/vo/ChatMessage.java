package com.chatting.papago.vo;

import lombok.Data;

@Data
public class ChatMessage {

	private MessageType type;
	
	public enum MessageType {
		CHAT, JOIN, LEAVE
	}
	private String sender;
	private String language;
	private String message;

}
