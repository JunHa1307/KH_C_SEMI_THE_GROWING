package com.kh.common.model.vo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Objects;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


public class HttpConnection {
	
	public static String getSchoolCode(String name, String atCode) {
		String code = "0";
		try {
			URL url = new URL("https://open.neis.go.kr/hub/schoolInfo?KEY=42f9059625d34f7f989f556b3a16de4f&Type=json&SCHUL_NM=" + URLEncoder.encode(name, "UTF-8"));
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("GET"); // http 메서드
			conn.setRequestProperty("Content-Type", "application/json"); // header Content-Type 정보
			conn.setRequestProperty("auth", "myAuth"); // header의 auth 정보
			conn.setDoOutput(true); // 서버로부터 받는 값이 있다면 true
			
			// 서버로부터 데이터 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;
			
			while((line = br.readLine()) != null) { // 읽을 수 있을 때 까지 반복
				sb.append(line);
			}
			JSONParser parser = new JSONParser(); 
			JSONObject obj = (JSONObject) parser.parse(sb.toString());
			JSONArray row = (JSONArray)((JSONObject) ((JSONArray) obj.get("schoolInfo")).get(1)).get("row");
			
			for(int i=0; i<row.size(); i++) {
				JSONObject school = (JSONObject)row.get(i);
				
				if(Objects.equals(school.get("SCHUL_NM"),name) && Objects.equals(school.get("ATPT_OFCDC_SC_CODE"),atCode)) {
					code = (String)school.get("SD_SCHUL_CODE");
					break;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return code;
	}
}