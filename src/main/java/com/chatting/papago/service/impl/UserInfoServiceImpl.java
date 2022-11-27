package com.chatting.papago.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.amazonaws.SdkClientException;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.chatting.papago.config.CredentialsConfig;
import com.chatting.papago.mapper.UserInfoMapper;
import com.chatting.papago.service.UserInfoService;
import com.chatting.papago.vo.UserInfoVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class UserInfoServiceImpl implements UserInfoService {
	
	@Resource
	UserInfoMapper uiMapper;
	@Resource
	private CredentialsConfig cc;
	
	@Value("{bucket.name}")
	private String BUCKET_NAME;
	@Value("{folder.in.bucket}")
	private String FOLDER_NAME;
	
	//Login
	@Override
	public Map<String,Object> doLogin(UserInfoVO user, HttpSession session) {
		user = uiMapper.doLogin(user);
		Map<String, Object> rMap = new HashMap<>();
		if(user==null) {
			rMap.put("msg","아이디나 비밀번호를 확인해주세요.");
		}else {
			rMap.put("msg","로그인 되었습니다.");
			rMap.put("user",user);
			session.setAttribute("user",user);
			
		}
		return rMap;
	}

	//Signup
	@Override
	public Map<String, Object> doSignup(UserInfoVO user) {
		Map<String,Object> rMap = new HashMap<>();
		rMap.put("cnt", uiMapper.doSignup(user));
		return rMap;
	}

	//View
	@Override
	public UserInfoVO userView(UserInfoVO user) {
		return uiMapper.userView(user);
	}

	//Update
	@Override
	public Map<String, Object> updateUser(UserInfoVO user, HttpSession session) {
		
		//이미지 업데이트
		if(user.getUiImgFile()!=null) {
			String file = user.getUiImgFile().getOriginalFilename();
			String newName = System.nanoTime() + file.substring(file.indexOf("."));
			
			ObjectMetadata om = new ObjectMetadata();
			om.setContentType(user.getUiImgFile().getOriginalFilename());
			om.setContentLength(user.getUiImgFile().getSize());
			
			try {
				cc.getS3Client().putObject("phn-test","papago-chatting/"+newName,user.getUiImgFile().getInputStream(),om);
			} catch (SdkClientException | IOException e) {
				e.printStackTrace();
			}
			System.out.println("파일네임이 찍혀야 함 : " + newName );
			user.setUiImg(newName);
			user.setUiImgFile(null);
			
		}
		Map<String,Object> rMap = new HashMap<>();
		rMap.put("msg","다시 시도해주세요.");
		if(uiMapper.updateUser(user) == 1) {
			session.setAttribute("user", user);
			rMap.put("msg","수정 되었습니다.");
		}
		return rMap;
	}

}

