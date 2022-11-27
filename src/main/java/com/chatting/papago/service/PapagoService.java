package com.chatting.papago.service;

import java.util.List;

import com.chatting.papago.vo.ChatMessage;
import com.chatting.papago.vo.PapagoInfoVO;
import com.chatting.papago.vo.Translate;
import com.chatting.papago.vo.Translate.Message;

public interface PapagoService {

	public void translation1(Translate trans);
	public Translate translation(Translate trans);
	public Message doTranslation(Translate trans);
	public Translate doTransChat(Translate trans);
	public List<PapagoInfoVO> selectPapagoInfoList(PapagoInfoVO papago);
}
