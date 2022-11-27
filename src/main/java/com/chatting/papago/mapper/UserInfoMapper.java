package com.chatting.papago.mapper;

import com.chatting.papago.vo.UserInfoVO;

public interface UserInfoMapper {
	public UserInfoVO doLogin(UserInfoVO user);
	public UserInfoVO userView(UserInfoVO user);
	public int doSignup(UserInfoVO user);
	public int updateUser(UserInfoVO user);
}
