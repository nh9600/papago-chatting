package com.chatting.papago.mapper;

import java.util.List;

import com.chatting.papago.vo.PapagoStatsVO;

public interface PapagoStatsInfoMapper {
	public int totalPapagoStatsCount(PapagoStatsVO papagoS);
	public int searchTotalPapagoStatsCount(PapagoStatsVO papagoS);
	public List<PapagoStatsVO> selectPapagoStatsList(PapagoStatsVO papagoS);
	public int insertPapagoStats(PapagoStatsVO papagoS);
}
