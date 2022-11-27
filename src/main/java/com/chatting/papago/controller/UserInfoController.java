package com.chatting.papago.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.chatting.papago.service.UserInfoService;
import com.chatting.papago.vo.UserInfoVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class UserInfoController {

	@Resource
	private UserInfoService uiService;

	//Login
	@PostMapping("/user/login")
	public Map<String, Object> doLogin(@RequestBody UserInfoVO user, HttpSession session) {
		log.info("user info =>{}", user);
		log.info("session info =>{}", session);
		return uiService.doLogin(user, session);
	}

	//Logout
	@GetMapping("/user/logout")
	public Map<String, Object> doLogout(HttpSession session) {
		session.invalidate();
		
		Map<String, Object> rMap = new HashMap<>();
		rMap.put("msg", "다시 시도해주세요.");
		if (session != null) {
			rMap.put("msg", "로그아웃 되었습니다.");
		}
		
		return rMap;
	}

	//View
	@GetMapping("/user/*")
	public UserInfoVO userView(UserInfoVO user) {
		log.info("user info =>{}", user);
		return uiService.userView(user);
	}

	//Signup
	@PostMapping("/user/signup")
	public Map<String, Object> doSignup(@RequestBody UserInfoVO user) {
		log.info("user info =>{}", user);
		return uiService.doSignup(user);
	}
	
	//Update
	@PutMapping("/user/update")
	public Map<String, Object> updateUser(UserInfoVO user, HttpSession session) {
		log.debug("user info =>{}", user);
		return uiService.updateUser(user,session);
	}

}
