package com.kh.classes.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.classes.model.vo.Class;
import com.kh.common.model.vo.Attachment;

public class ClassDao {
	private Properties prop = new Properties();

	public ClassDao() {
		try {
			prop.loadFromXML(new FileInputStream(ClassDao.class.getResource("/sql/classes/class-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Class> selectClassList(Connection conn, int userNo) {

		ArrayList<Class> list = new ArrayList<>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectClassList");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Class c = new Class(rset.getInt("REF_CNO"), rset.getInt("CLASS_GRADE"),
						rset.getInt("CLASS_CODE"), rset.getString("CLASS_NAME"), rset.getString("CLASS_TYPE_NAME"),
						rset.getString("CHANGE_NAME"),rset.getString("FILE_PATH"),rset.getString("TEACHER_NAME"),
						rset.getString("ATPT_OFCDC_SC_CODE"),rset.getInt("SD_SCHUL_CODE"),rset.getInt("USER_COUNT"));
				list.add(c);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int insertClass(Connection conn, Class c) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertClass");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getClassGrade());
			pstmt.setInt(2, c.getClassCode());
			pstmt.setString(3, c.getClassName());
			pstmt.setString(4, c.getClassTypeName());
			pstmt.setString(5, c.getTeacherName());
			pstmt.setString(6, c.getAtptOfcdcScCode());
			pstmt.setString(7, c.getSdSchulCode()+"");
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}
	
	public int insertClassMember(Connection conn, int classCode, int userNo, int studentNo) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertClassMember");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, classCode);
			pstmt.setInt(2, userNo);
			pstmt.setInt(3, studentNo);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}
	
	public int insertClassAttachment(Connection conn, Attachment at, int classCode) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertClassAttachment");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, classCode);
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
