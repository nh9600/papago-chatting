package com.chatting.papago.vo;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Alias("user")
@Data
public class UserInfoVO {
	private Integer uiNum;
	private String uiName;
	private String uiId;
	private String uiPwd;
	private String uiLanguage;
	private String uiImg;
	private MultipartFile uiImgFile;
	private String credat;
	private String cretim;
	private String moddat;
	private String modtim;
	
}
