package com.chatting.papago.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.chatting.papago.vo.PapagoStatsVO;

@Service
public interface PapagoStatsService {
	public Map<String, Object> selectPapagoStatsList(PapagoStatsVO papagoS);
	public Map<String,Object> insertPapagoState(PapagoStatsVO papagoS);

}
