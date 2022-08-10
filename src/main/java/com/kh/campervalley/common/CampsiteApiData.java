package com.kh.campervalley.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONException;
import org.json.JSONObject;

import com.kh.campervalley.campsite.model.dto.Campsite;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CampsiteApiData {
	
	final static String basedListURL = "https://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList";
	// final String RES_PARAM = "&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=TestApp&_type=json";
	
	public static ArrayList<HashMap<String, Object>> getApiData(String SERVICE_KEY) {
		ArrayList<HashMap<String, Object>> list = null;
		try {
			StringBuilder urlBuilder = new StringBuilder(basedListURL);
			
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + SERVICE_KEY);
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("30", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8")+ "=" + URLEncoder.encode("ETC", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("TestApp", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			
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
			JSONObject jsonObject = CampsiteUtils.jsonStringToJson(jsonApi);
			JSONObject response = CampsiteUtils.jsonStringToJson(jsonObject.get("response"));
			JSONObject body = CampsiteUtils.jsonStringToJson(response.get("body"));
			JSONObject items = CampsiteUtils.jsonStringToJson(body.get("items"));
			list = CampsiteUtils.jsonArray(items.get("item"));
			
		} catch (JSONException | IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
