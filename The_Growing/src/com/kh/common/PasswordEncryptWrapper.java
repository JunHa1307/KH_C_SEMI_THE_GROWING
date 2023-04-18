package com.kh.common;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class PasswordEncryptWrapper extends HttpServletRequestWrapper{
	
	public PasswordEncryptWrapper(HttpServletRequest request) {
		super(request);
	}
	
	// getParameter() 오버라이딩
	// 매개변수로 넘어온 password값만 찾아서 암호화 시켜줄 예정
	
	@Override
	public String getParameter(String name) {
		
		String value = "";
		
		// 매개변수로 전달받은 name변수의 값이 userPwd일 때 암호화 작업 수행하기
		if(name.equals("userPwd") || name.equals("newPwd") || name.equals("oldPwd")) {
			// 암호화 시켜주기
		
			value = getSHA512(super.getParameter(name));
						
		}else {
			value = super.getParameter(name);
		}
		return value;
		
	}
	
	public String getSHA512(String val) {
		
		String encPwd = "";
		// 암호화 처리 객체 선언
		MessageDigest md = null;
		
		// 사용할 암호화 알고리즘을 선택해서 객체 생성하기
		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		// 암호화는 bit연산하고 , bit 연산한 결과를 byte[]에 담아서 보관
		byte[] bytes = val.getBytes(Charset.forName("UTF-8"));
		md.update(bytes);
		
		// bit연산하고 그 결과값은 byte[]이므로, String[]형태로 값을 변환
		
		encPwd = Base64.getEncoder().encodeToString(md.digest());
		
		return encPwd;
		
	}
	
}
