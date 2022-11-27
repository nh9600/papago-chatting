package com.chatting.papago.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chatting.papago.mapper.PapagoStatsInfoMapper;
import com.chatting.papago.service.PapagoStatsService;
import com.chatting.papago.vo.PageVO;
import com.chatting.papago.vo.PapagoStatsVO;

@Service
public class PapagoStatsSerivceImpl implements PapagoStatsService {
	
	@Resource
	private PapagoStatsInfoMapper ppgSMapper;
	
	//Translation Insert
	@Override
	public Map<String, Object> insertPapagoState(PapagoStatsVO papagoS) {
		Map<String,Object> rMap = new HashMap<>();
		int cnt = ppgSMapper.insertPapagoStats(papagoS);
		rMap.put("msg", "실패");
		if(cnt==1) {
			rMap.put("msg", "성공");
		}
		return rMap;
	}
	
	//Translation list
	@Override
	public Map<String, Object> selectPapagoStatsList(PapagoStatsVO papagoS) {
		int startNum = papagoS.getPage().getPage() * 10 - 10;
		papagoS.getPage().setStartNum(startNum);
		Integer totalCount = ppgSMapper.totalPapagoStatsCount(papagoS);
		Integer searchTotalCount = ppgSMapper.searchTotalPapagoStatsCount(papagoS);
		Map<String, Object> rMap = new HashMap<>();
		rMap.put("list", ppgSMapper.selectPapagoStatsList(papagoS));
		PageVO page = papagoS.getPage();
		page.setTotalCount(totalCount);
		page.setSearchTotalCount(searchTotalCount);
		rMap.put("page", page);
		return rMap;
	}

}
