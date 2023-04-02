package com.kh.survey.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.google.gson.Gson;
import com.kh.classes.model.dao.ClassDao;
import com.kh.survey.model.vo.Question;
import com.kh.survey.model.vo.Survey;

public class SurveyDao {
	private Properties prop = new Properties();

	public SurveyDao() {
		try {
			prop.loadFromXML(new FileInputStream(ClassDao.class.getResource("/sql/survey/survey-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertSurvey(Connection conn, Survey survey) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertSurvey");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, survey.getTitle());
			pstmt.setDate(2, survey.getFirstDate());
			pstmt.setDate(3, survey.getLastDate());
			pstmt.setInt(4, survey.getRefCno());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public Survey selectSurvey(Connection conn, Date fDate, int cno) {
			  Survey survey = null;
	
		      PreparedStatement pstmt = null;
	
		      ResultSet rset = null;
	
		      String sql = prop.getProperty("selectSurvey");
	
		      try {
		         pstmt = conn.prepareStatement(sql);
	
		         pstmt.setDate(1, fDate);
		         pstmt.setInt(2, cno);
		         
		         rset = pstmt.executeQuery();
		         if (rset.next()) {
		        	survey = new Survey(rset.getInt("SURVEY_NO"),rset.getString("TITLE"),rset.getInt("SURVEY_COUNT")
		        			,rset.getDate("FIRST_DATE"),rset.getDate("LAST_DATE"),rset.getString("STATUS"),rset.getInt("REF_CNO"));
		         }
	
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(rset);
		         close(pstmt);
		      }
		      return survey;
	}
	
	public int insertQuestion(Connection conn, Question ques) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertQuestion");
		Gson gson = new Gson();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ques.getRefSno());
			pstmt.setString(2,  gson.toJson(ques.getQuesType()));
			pstmt.setString(3, gson.toJson(ques.getsTitle()));
			pstmt.setString(4, gson.toJson(ques.getsContent()));
			pstmt.setString(5, gson.toJson(ques.getmTitle()));
			pstmt.setString(6, gson.toJson(ques.getmContent()));
			pstmt.setString(7, gson.toJson(ques.getItemNo()));
			pstmt.setString(8, gson.toJson(ques.getItemContent()));
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
}
