package com.chatting.papago.service.impl;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.chatting.papago.mapper.PapagoInfoMapper;
import com.chatting.papago.mapper.PapagoStatsInfoMapper;
import com.chatting.papago.service.PapagoService;
import com.chatting.papago.vo.PapagoInfoVO;
import com.chatting.papago.vo.PapagoStatsVO;
import com.chatting.papago.vo.Translate;
import com.chatting.papago.vo.Translate.Message;
import com.chatting.papago.vo.Translate.Message.Result;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PapagoServiceImpl implements PapagoService{
	@Value("${naver.papago.client.id}")
	private String clientId;
	@Value("${naver.papago.client.secret}")
	private String clientSecret;

	@Resource
	private ObjectMapper om;
	@Resource
	private PapagoInfoMapper ppgMapper;
	@Resource
	private PapagoStatsInfoMapper ppgSMapper;
	
	//Papago Chatting
	public Translate translation(Translate trans) {
		try {
			String text = URLEncoder.encode(trans.getText(), "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			
			// post request
			String postParams = "source="+trans.getSource()+"&target="+trans.getTarget()+"&text=" + text;
			
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			Translate translate = om.readValue(response.toString(),Translate.class);
			translate.setUiNum(trans.getUiNum());
			log.info("translate=>{}",translate);
			
			return translate;
		} catch (Exception e) {
			log.error("error=>{}",e);
		}
		return null;
	}

	
	//Papago Translation
	public Message doTranslation(Translate trans) {
		try {
			//어떤 유저가 번역했는지 확인
			PapagoStatsVO papagoS = new PapagoStatsVO();
			papagoS.setUiNum(trans.getUiNum()); 
			
			//번역된 결과를 insert
			PapagoInfoVO papago = new PapagoInfoVO();
			papago.setPiSource(trans.getSource());
			papago.setPiTarget(trans.getTarget());
			papago.setPiText(trans.getText());
			papago = ppgMapper.selectPapagoInfo(papago);
			
			if(papago != null) {
				Translate t = new Translate();
				Message m = t.new Message();
				Result r = m.new Result();
				r.setSrcLangType(papago.getPiSource());
				r.setTarLangType(papago.getPiTarget());
				r.setTranslatedText(papago.getPiResult());
				Message msg = t.new Message();
				msg.setResult(r);
				
				ppgMapper.updatePapagoInfoForCnt(papago);
				papagoS.setPiNum(papago.getPiNum());
				ppgSMapper.insertPapagoStats(papagoS);
				return msg;
			}
			String text = URLEncoder.encode(trans.getText(), "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			
			// post request
			String postParams = "source=" + trans.getSource() + "&target=" + trans.getTarget() + "&text=" + text;
			
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			Translate translate = om.readValue(response.toString(),Translate.class);
			Result result = translate.getMessage().getResult();
			
			//insert
			papago = new PapagoInfoVO();
			papago.setPiSource(result.getSrcLangType());
			papago.setPiTarget(result.getTarLangType());
			papago.setPiText(trans.getText());
			papago.setPiResult(result.getTranslatedText());
			ppgMapper.insertPapagoInfo(papago);
			papagoS.setPiNum(papago.getPiNum());
			ppgMapper.updatePapagoInfoForCnt(papago);
			
			log.info("translate=>{}",translate);
			log.info("papago=>{}",papago);
			
			return translate.getMessage();
		} catch (Exception e) {
			log.error("error=>{}",e);
		}
		return null;
	}
	
	//테스트용 
	public Translate doTransChat(Translate trans) {
		try {
			String text = URLEncoder.encode(trans.getText(), "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			// post request
			String postParams = "source=ko&target=en&text=" + text;
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			Translate translate = om.readValue(response.toString(),Translate.class);
			translate.setText(trans.getText());
			log.info("translate=>{}",translate);
			
			return translate;
		} catch (Exception e) {
			log.error("error=>{}",e);
		}
		return null;
	}
	
	//테스트용
	public void translation1(Translate trans) {
		try {
			String text = URLEncoder.encode(trans.getText(), "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			
			// post request
			String postParams = "source="+trans.getSource()+"&target="+trans.getTarget()+"&text=" + text;
			
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			Translate translate = om.readValue(response.toString(),Translate.class);
			log.info("translate=>{}",translate);
			
		} catch (Exception e) {
			log.error("error=>{}",e);
		}
	}
	
	public List<PapagoInfoVO> selectPapagoInfoList(PapagoInfoVO papago){
		return ppgMapper.selectPapagoInfoList(papago);
	}

}
