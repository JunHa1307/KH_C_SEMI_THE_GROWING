package com.kh.member.controller;

//네이버 API - 회원프로필 조회
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@WebServlet("/naverlogin.me")
public class NaverLoginController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String clientId = "AoXLANkB0ykozQKaSUNj";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "PxiuUGTk61";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode(request.getRequestURL().toString().split("/growing")[0]+"growing/apinsert.me", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
	    // url 기반으로 토큰 가져오기
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      } 
	      if(responseCode==200) {
		      JSONParser parser = new JSONParser();
		      JSONObject json_access_token = (JSONObject) parser.parse(res.toString());
		      
		      access_token = json_access_token.get("access_token") + "";
		      // 토큰 얻어온 후 네이버 프로필 정보 가져오기
		      String token = access_token; // 네이버 로그인 접근 토큰;
		      String header = "Bearer " + token; // Bearer 다음에 공백 추가
		      
		      apiURL = "https://openapi.naver.com/v1/nid/me";
		      
		      Map<String, String> requestHeaders = new HashMap<>();
		      requestHeaders.put("Authorization", header);
		      String responseBody = get(apiURL, requestHeaders);
		      
		      JSONObject responseId = (JSONObject) parser.parse(responseBody);
		      responseId = (JSONObject) responseId.get("response");
		      
		      int userLevel = (int) request.getSession().getAttribute("userLevel");
		      String snsId = responseId.get("id") + "";
		      String snsName = responseId.get("name") + "";
		      int snsType = 2;
		      String filePath = responseId.get("profile_image") + "";
		     		      
		      br.close();
		      request.getSession().setAttribute("userLevel", userLevel);
		      request.getSession().setAttribute("snsId", snsId);
			  request.getSession().setAttribute("snsName", snsName);
			  request.getSession().setAttribute("snsType", snsType);
			  request.getSession().setAttribute("filePath", filePath);
			  
			  response.sendRedirect(request.getContextPath()+"/views/member/naverLoginForm.jsp");
		      
	      }else {
	    	  br.close();
	      }
	    } catch (Exception e) {
	      System.out.println(e);
	    }
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}
}
