package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.member.model.vo.Member;


public class MemberDao {
	
	private Properties prop = new Properties();

	public MemberDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/*
	 * public Member selectUserType(Connection conn, int userLevel) {
	 * 
	 * Member m = null;
	 * 
	 * ResultSet rset = null;
	 * 
	 * PreparedStatement pstmt = null;
	 * 
	 * String sql = prop.getProperty("selectUserType");
	 * 
	 * try { pstmt = conn.prepareStatement(sql);
	 * 
	 * rset = pstmt.executeQuery();
	 * 
	 * if(rset.next()) { m = new Member(rset.getInt("USER_LEVEL"));
	 * 
	 * }
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally { try {
	 * rset.close(); pstmt.close(); } catch (SQLException e) { e.printStackTrace();
	 * } }
	 * 
	 * return m; }
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
