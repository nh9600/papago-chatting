package com.chatting.papago.vo;

import lombok.Data;

@Data
public class Translate {
	private String source;
	private String target;
	private String text;

	@Data
	public class Message{
		private Result result;
		@Data
		public class Result{
			private String srcLangType;
			private String tarLangType;
			private String translatedText;
		}
	}
	
	private Message message;
	private Integer uiNum;
}
