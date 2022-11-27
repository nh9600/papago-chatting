package com.chatting.papago.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.chatting.papago.vo.UserInfoVO;

@Service
public interface UserInfoService {
	public Map<String,Object> doLogin(UserInfoVO user, HttpSession session);
	public UserInfoVO userView(UserInfoVO user);
	public Map<String,Object> doSignup(UserInfoVO user);
	public Map<String,Object> updateUser(UserInfoVO user, HttpSession session);
}
