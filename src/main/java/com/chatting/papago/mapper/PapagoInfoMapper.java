package com.chatting.papago.mapper;

import java.util.List;

import com.chatting.papago.vo.PapagoInfoVO;

public interface PapagoInfoMapper {
	public PapagoInfoVO selectPapagoInfo(PapagoInfoVO papago);
	public int insertPapagoInfo(PapagoInfoVO papago);
	public int updatePapagoInfoForCnt(PapagoInfoVO papago);
	public List<PapagoInfoVO> selectPapagoInfoList(PapagoInfoVO papago);
}
