package com.chatting.papago.vo;

import lombok.Data;

@Data
public class PageVO {
	private Integer page=1;
	private Integer startNum;
	private Integer totalCount;
	private Integer searchTotalCount;
}
