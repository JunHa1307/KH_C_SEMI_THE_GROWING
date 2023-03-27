package com.kh.common;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	//1. Connection객체 생성 한후 해당 Connection반환하는 메소드
	public static Connection getConnection() {
		
		Properties prop = new Properties();// Map 계열 컬렉션(key-value)
		
		// 읽어들이고자 하는 driver.properties파일의 물리적인 경로
		
		String fileName = JDBCTemplate.class.getResource("/sql/driver/driver.properties").getPath();
		// JDBCTemplate.class는 컴파일된 class파일을 의미
		// getResource함수의 첫번째 / 는 classes폴더를 의미함 
		
		// 안녕하세요 세미조 여러분 오늘도 파이팅입니당!(현지가)
		//String fileName= "C:\The_Growing\growing\WebContent\WEB-INF\classes\sql\driver";
		
		try {
			prop.load(new FileInputStream(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Connection conn = null;
		
		//1) jdbc 드라이버 등록
		try {
			Class.forName(prop.getProperty("driver"));
			
			//2) DB와 접속후 Connection객체 생성
			conn = DriverManager.getConnection(prop.getProperty("url"), 
					prop.getProperty("username"),
					prop.getProperty("password")
					);
			//3) 자동커밋 설정 해제
			conn.setAutoCommit(false);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// 2. 전달받은 Connection 객체를 가지고 commit해주느 메소드
	public static void commit(Connection conn) {
		
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}	
	// 3. 전달받은 Connection 객체를 가지고 rollback해주는 메소드
	public static void rollback(Connection conn) {
		
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	// 4. Connection객체를 반납해주는 메소드
	public static void close(Connection conn) {
		
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	// 5. Statement객체를 반납시켜주는 메소드
	public static void close(Statement stmt) {
		
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	// 6. ResultSet객체를 반납시켜주는 메소드
	public static void close(ResultSet rset) {
		
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
