package com.kh.campervalley.campsite.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.campervalley.campsite.model.service.CampsiteService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/campsite")
@PropertySource("classpath:datasource.properties")
public class CampsiteController {
	
	@Autowired
	private CampsiteService campsiteService;
	
	final String basedListURL = "http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList";
	@Value("${api.goCamping}")
	private String SERVICE_KEY;
	final String RES_PARAM = "&numOfRows=3&pageNo=1&MobileOS=ETC&MobileApp=TestApp&_type=json";
	
	@GetMapping("/searchDetail")
	public void searchDetail(Model model) throws IOException, ParseException {
		StringBuilder urlBuilder = new StringBuilder(basedListURL);
	     
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(SERVICE_KEY, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("3", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8")+ "=" + URLEncoder.encode("ETC", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("TestApp", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
        
        URL url = new URL(urlBuilder.toString());
        log.debug("url = {}", url);
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        log.debug("getResponseCode = {}", conn.getResponseCode());
        
        BufferedReader br;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            sb.append(line);
        }
        br.close();
        conn.disconnect();
        
        String jsonApi = (sb.toString());
        log.debug("jsonApi = {}", jsonApi);
        
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonApi);
        log.debug("jsonObject = {}", jsonObject);
        
        JSONObject response = (JSONObject) jsonObject.get("response");
        log.debug("response = {}", response);
        
        JSONObject body = (JSONObject) response.get("body");
        log.debug("body = {}", body);

        JSONArray bodyArray = (JSONArray) body.get("items");
        log.debug("bodyArray = {}", bodyArray.size());
        
        for(int i = 0; i < bodyArray.size(); i++) {
            JSONObject personObject = (JSONObject) bodyArray.get(i);
            
            System.out.println(personObject.get("contentId"));
            System.out.println(personObject.get("firstImageUrl"));
            System.out.println(personObject.get("facltNm"));
            System.out.println(personObject.get("lineIntro"));
            System.out.println(personObject.get("addr1"));
            System.out.println(personObject.get("tel"));
        

        }
	}
	
	@GetMapping("/searchTheme")
	public void searchTheme() {}
	
	@GetMapping("/infoView")
	public void infoView() {}
	
}
