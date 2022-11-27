package com.chatting.papago.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("papago")
@Data
public class PapagoInfoVO {
	private Integer piNum;
	private String piSource;
	private String piTarget;
	private String piText;
	private String piResult;
	private Integer piCnt;
}
