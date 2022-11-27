package com.chatting.papago.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("papagoS")
@Data
public class PapagoStatsVO {
	private Integer psNum;
	private Integer uiNum;
	private Integer piNum;
	private String credat;
	private String uiId;
	private String piText;
	private String piResult;
	private String order;
	
	// 검색옵션
	private String searchOpt;
	private String searchVal;
	
	// 페이징
	private PageVO page = new PageVO();
}
