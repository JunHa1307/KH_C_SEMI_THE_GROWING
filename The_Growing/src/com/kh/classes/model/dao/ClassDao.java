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
	
	public int insertClass(Connection conn, Class c, int classCode) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertClass");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(c.getCategory()));
			pstmt.setString(2, c.getBoardTitle());
			pstmt.setString(3, c.getBoardContent());
			pstmt.setString(4, c.getBoardWriter());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}
}
