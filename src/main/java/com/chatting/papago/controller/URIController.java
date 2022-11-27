package com.chatting.papago.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class URIController {
	// index페이지 uri pattern
	
	@GetMapping(path = { "/views/**" })
	public void goHome(HttpServletRequest req) {
	}

	@GetMapping(path = "/")
	public String goLogin() {
		return "views/index";
	}
}
