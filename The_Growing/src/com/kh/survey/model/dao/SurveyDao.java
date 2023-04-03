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
import java.util.ArrayList;
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
	
	public Survey selectSurvey(Connection conn, String surveyTitle, Date fDate, int cno) {
			  Survey survey = null;
	
		      PreparedStatement pstmt = null;
	
		      ResultSet rset = null;
	
		      String sql = prop.getProperty("selectSurvey");
	
		      try {
		         pstmt = conn.prepareStatement(sql);
	
		         pstmt.setDate(1, fDate);
		         pstmt.setInt(2, cno);
		         pstmt.setString(3, surveyTitle);
		         
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
			ArrayList<String> getQuesType = new ArrayList<String>();
			ArrayList<String> getsTitle = new ArrayList<String>();
			ArrayList<String> getsContent = new ArrayList<String>();
			ArrayList<String> getmTitle = new ArrayList<String>();
			ArrayList<String> getmContent = new ArrayList<String>();
			ArrayList<String> getItemNo = new ArrayList<String>();
			ArrayList<String> getItemContent = new ArrayList<String>();
			
			for(String s : ques.getQuesType()) {
				getQuesType.add(s);
			}
			for(String s : ques.getsTitle()) {
				getsTitle.add(s);
			}
			for(String s : ques.getsContent()) {
				getsContent.add(s);
			}
			for(String s : ques.getmTitle()) {
				getmTitle.add(s);
			}
			for(String s : ques.getmContent()) {
				getmContent.add(s);
			}
			for(String s : ques.getItemNo()) {
				getItemNo.add(s);
			}
			for(String s : ques.getItemContent()) {
				getItemContent.add(s);
			}
			
			pstmt.setInt(1, ques.getRefSno());
			pstmt.setString(2, getQuesType.toString().substring(1).substring(0,  getQuesType.toString().length() - 2));
			pstmt.setString(3, getsTitle.toString().substring(1).substring(0,  getsTitle.toString().length() - 2));
			pstmt.setString(4, getsContent.toString().substring(1).substring(0,  getsContent.toString().length() - 2));
			pstmt.setString(5, getmTitle.toString().substring(1).substring(0,  getmTitle.toString().length() - 2));
			pstmt.setString(6, getmContent.toString().substring(1).substring(0,  getmContent.toString().length() - 2));
			pstmt.setString(7, getItemNo.toString().substring(1).substring(0,  getItemNo.toString().length() - 2));
			pstmt.setString(8, getItemContent.toString().substring(1).substring(0,  getItemContent.toString().length() - 2));
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public ArrayList<Survey> selectSurveyList(Connection conn, int cno){
		
		ArrayList<Survey> surveyList = new ArrayList<>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectSurveyList");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Survey s = new Survey(rset.getInt("SURVEY_NO"),rset.getString("TITLE"),rset.getInt("SURVEY_COUNT")
	        			,rset.getDate("FIRST_DATE"),rset.getDate("LAST_DATE"),rset.getString("STATUS"),rset.getInt("REF_CNO"));
				
				surveyList.add(s);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return surveyList;
	}
	
	public Question selectQuestion(Connection conn, int sno) {
		Question question = null;

	      PreparedStatement pstmt = null;

	      ResultSet rset = null;

	      String sql = prop.getProperty("selectQuestion");
	      Gson gson = new Gson();
	      try {
	         pstmt = conn.prepareStatement(sql);

	         pstmt.setInt(1, sno);
	         
	         rset = pstmt.executeQuery();
	         String[] arr;
	         String[] str = new String[1];
	         if (rset.next()) {
	        	question = new Question();
	        	question.setQuesNo(rset.getInt("QUES_NO"));
	        	question.setRefSno(rset.getInt("REF_SNO"));
	        	
	        	if(rset.getString("QUES_TYPE").contains(",")) {
	        		arr = rset.getString("QUES_TYPE").split(",");
	        		question.setQuesType(arr);
	        	}else {
	        		str[0] =  rset.getString("QUES_TYPE");
	        		question.setQuesType(str);
	        	}
	        	
	        	if(rset.getString("S_TITLE").contains(",")) {
	        		arr = rset.getString("S_TITLE").split(",");
	        		question.setsTitle(arr);
	        	}else {
	        		str[0] =  rset.getString("S_TITLE");
	        		question.setsTitle(str);
	        	}
	        	
	        	if(rset.getString("S_CONTENT").contains(",")) {
	        		arr = rset.getString("S_CONTENT").split(",");
	        		question.setsContent(arr);
	        	}else {
	        		str[0] =  rset.getString("S_CONTENT");
	        		question.setsContent(str);
	        	}
	        	
	        	if(rset.getString("M_TITLE").contains(",")) {
	        		arr = rset.getString("M_TITLE").split(",");
	        		question.setmTitle(arr);
	        	}else {
	        		str[0] =  rset.getString("M_TITLE");
	        		question.setmTitle(str);
	        	}
	        	
	        	if(rset.getString("M_CONTENT").contains(",")) {
	        		arr = rset.getString("M_CONTENT").split(",");
	        		question.setmContent(arr);
	        	}else {
	        		str[0] =  rset.getString("M_CONTENT");
	        		question.setmContent(str);
	        	}
	        	
	        	str[0] =  rset.getString("ITEM_NO");
	        	question.setItemNo(str);
	        	
	        	if(rset.getString("ITEM_CONTENT").contains(",")) {
	        		arr = rset.getString("ITEM_CONTENT").split(",");
	        		question.setItemContent(arr);
	        	}else {
	        		str[0] =  rset.getString("ITEM_CONTENT");
	        		question.setItemContent(str);
	        	}
	        	
	         }

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      return question;
	}
}
