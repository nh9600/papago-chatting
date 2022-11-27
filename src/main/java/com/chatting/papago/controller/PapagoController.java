package com.chatting.papago.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.chatting.papago.service.PapagoService;
import com.chatting.papago.service.PapagoStatsService;
import com.chatting.papago.vo.PapagoStatsVO;
import com.chatting.papago.vo.Translate;
import com.chatting.papago.vo.Translate.Message;
import com.chatting.papago.vo.UserInfoVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class PapagoController {

	@Resource
	private PapagoService ps;
	@Resource
	private PapagoStatsService pss;
	
	//채팅 번역
	@MessageMapping("/papago/trans")
	@SendTo("/topic/greetings")
	public Translate translation(Translate trans) throws Exception {
		log.info("Translate=>{}",trans);
		ps.translation(trans);
		return ps.translation(trans);
	}
	
	//기본 번역
	@PostMapping("/papago/trans")
	public Message translation1(@RequestBody Translate trans, HttpSession session){
		log.info("Translate=>{}",trans);
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");
		trans.setUiNum(user.getUiNum());
		ps.doTranslation(trans);
		return ps.doTranslation(trans);
	}
	

	@GetMapping("/papago/list")
	public Map<String,Object> selectPapagoInfoList(PapagoStatsVO papagoS){
		log.info("papago=>{}",papagoS);
		pss.selectPapagoStatsList(papagoS);
		return pss.selectPapagoStatsList(papagoS);
	}
	
}
