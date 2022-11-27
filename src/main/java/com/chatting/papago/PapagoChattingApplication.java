package com.chatting.papago;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication
@MapperScan({"com.chatting.papago.mapper"})
@PropertySource("classpath:env.properties")
public class PapagoChattingApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(PapagoChattingApplication.class, args);
	}
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(PapagoChattingApplication.class);
	}

}
