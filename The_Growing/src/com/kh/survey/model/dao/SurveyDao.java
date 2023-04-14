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
import java.util.Calendar;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.classes.model.dao.ClassDao;
import com.kh.survey.model.vo.Answer;
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
	
	public Survey selectSurvey(Connection conn, int sno) {
		  Survey survey = null;

	      PreparedStatement pstmt = null;

	      ResultSet rset = null;

	      String sql = prop.getProperty("selectSurveyToNum");

	      try {
	         pstmt = conn.prepareStatement(sql);

	         pstmt.setInt(1, sno);
	         
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
	
	public int updateSurveyStatus(Connection conn, int sno) {
		
		// UPDATE문 => 반환값 처리된 행의 갯수가 반환됨
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateSurveyStatus");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, sno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Question selectQuestion(Connection conn, int sno) {
		Question question = null;

	      PreparedStatement pstmt = null;

	      ResultSet rset = null;

	      String sql = prop.getProperty("selectQuestion");
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
	        		str = new String[1];
	        		str[0] =  rset.getString("QUES_TYPE");
	        		question.setQuesType(str);
	        	}
	        	
	        	if(rset.getString("S_TITLE").contains(",")) {
	        		arr = rset.getString("S_TITLE").split(",");
	        		question.setsTitle(arr);
	        	}else {
	        		str = new String[1];
	        		str[0] =  rset.getString("S_TITLE");
	        		question.setsTitle(str);
	        	}
	        	
	        	if(rset.getString("M_TITLE").contains(",")) {
	        		arr = rset.getString("M_TITLE").split(",");
	        		question.setmTitle(arr);
	        	}else {
	        		str = new String[1];
	        		str[0] =  rset.getString("M_TITLE");
	        		question.setmTitle(str);
	        	}
	        	
	        	if(rset.getString("M_CONTENT").contains(",")) {
	        		arr = rset.getString("M_CONTENT").split(",");
	        		question.setmContent(arr);
	        	}else {
	        		str = new String[1];
	        		str[0] =  rset.getString("M_CONTENT");
	        		question.setmContent(str);
	        	}
	        	
	        	if(rset.getString("ITEM_NO").contains(",")) {
	        		arr = rset.getString("ITEM_NO").split(",");
	        		question.setItemNo(arr);
	        	}else {
	        		str = new String[1];
	        		str[0] =  rset.getString("ITEM_NO");
	        		question.setItemNo(str);
	        	}
	        	
	        	if(rset.getString("ITEM_CONTENT").contains(",")) {
	        		arr = rset.getString("ITEM_CONTENT").split(",");
	        		question.setItemContent(arr);
	        	}else {
	        		str = new String[1];
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
	
	public int insertAnswer(Connection conn, Answer ans) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			ArrayList<String> getWriteAns = new ArrayList<String>();
			ArrayList<String> getItemAns = new ArrayList<String>();
	
			for(String s : ans.getWriteAns()) {
				getWriteAns.add(s);
			}
			for(String s : ans.getItemAns()) {
				getItemAns.add(s);
			}
			
			pstmt.setInt(1, ans.getRefQno());
			pstmt.setInt(2, ans.getRefUno());
			pstmt.setString(3, getWriteAns.toString().substring(1).substring(0,  getWriteAns.toString().length() - 2));
			pstmt.setString(4, getItemAns.toString().substring(1).substring(0,  getItemAns.toString().length() - 2));
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public int updateSurveyCount(Connection conn, int qno) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateSurveyCount");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qno);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public ArrayList<Answer> selectAnswer(Connection conn, int qno) {
		  ArrayList<Answer> ansarr = new ArrayList<Answer>();
		  
	      PreparedStatement pstmt = null;

	      ResultSet rset = null;

	      String sql = prop.getProperty("selectAnswer");
	     
	      try {
	         pstmt = conn.prepareStatement(sql);

	         pstmt.setInt(1, qno);
	         
	         rset = pstmt.executeQuery();
	         
	         String[] arr;
	         String[] str = new String[1];
	         
	         while (rset.next()) {
	        	Answer ans = new Answer();
	        	ans.setRefQno(rset.getInt("REF_QNO"));
	        	ans.setRefUno(rset.getInt("REF_UNO"));
	        	ans.setSubmitDate(rset.getDate("SUBMIT_DATE"));
	        	
	        	if(rset.getString("WRITE_ANS").contains(",")) {
	        		arr = rset.getString("WRITE_ANS").split(",");
	        		ans.setWriteAns(arr);
	        	}else {
	        		str = new String[1];
	        		str[0] =  rset.getString("WRITE_ANS");
	        		ans.setWriteAns(str);
	        	}
	        	
	        	if(rset.getString("ITEM_ANS").contains(",")) {
	        		arr = rset.getString("ITEM_ANS").split(",");
	        		ans.setItemAns(arr);
	        	}else {
	        		str = new String[1];
	        		str[0] =  rset.getString("ITEM_ANS");
	        		ans.setItemAns(str);
	        	}
	        	
	        	ans.setUserName(rset.getString("USER_NAME"));
	        	ans.setChildName(rset.getString("CHILDREN_NAME"));
	        	ansarr.add(ans);
	         }

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      return ansarr;
	}
	
	public boolean isAnswered(Connection conn, int uno, int qno) {
		boolean isAnswered = false;
		
	      PreparedStatement pstmt = null;
	
	      ResultSet rset = null;
	
	      String sql = prop.getProperty("selectIsAnswered");
	
	      try {
	         pstmt = conn.prepareStatement(sql);
	
	         pstmt.setInt(1, qno);
	         pstmt.setInt(2, uno);
	         
	         rset = pstmt.executeQuery();
	         if (rset.next()) {
	        	isAnswered = true;
	         }
	
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
		      
		return isAnswered;
		
	}
	
	public int updateSurvey(Connection conn, Survey s) {
		
		// UPDATE문 => 반환값 처리된 행의 갯수가 반환됨
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateSurvey");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, s.getTitle());
			pstmt.setDate(2, s.getFirstDate());
			pstmt.setDate(3, s.getLastDate());
			pstmt.setInt(4, s.getSurveyNo()); 
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateQuestion(Connection conn, Question q) {
		
		// UPDATE문 => 반환값 처리된 행의 갯수가 반환됨
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateQuestion");
		
		ArrayList<String> getQuesType = new ArrayList<String>();
		ArrayList<String> getmTitle = new ArrayList<String>();
		ArrayList<String> getmContent = new ArrayList<String>();
		ArrayList<String> getItemNo = new ArrayList<String>();
		ArrayList<String> getItemContent = new ArrayList<String>();
		ArrayList<String> getsTitle = new ArrayList<String>();
		
		for(String s : q.getQuesType()) {
			getQuesType.add(s);
		}
		for(String s : q.getmTitle()) {
			getmTitle.add(s);
		}
		for(String s : q.getmContent()) {
			getmContent.add(s);
		}
		for(String s : q.getItemNo()) {
			getItemNo.add(s);
		}
		for(String s : q.getItemContent()) {
			getItemContent.add(s);
		}
		for(String s : q.getsTitle()) {
			getsTitle.add(s);
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, getQuesType.toString().substring(1).substring(0,  getQuesType.toString().length() - 2));
			pstmt.setString(2, getmTitle.toString().substring(1).substring(0,  getmTitle.toString().length() - 2));
			pstmt.setString(3, getmContent.toString().substring(1).substring(0,  getmContent.toString().length() - 2));
			pstmt.setString(4, getItemNo.toString().substring(1).substring(0,  getItemNo.toString().length() - 2));
			pstmt.setString(5, getItemContent.toString().substring(1).substring(0,  getItemContent.toString().length() - 2));
			pstmt.setString(6, getsTitle.toString().substring(1).substring(0,  getsTitle.toString().length() - 2));
			pstmt.setInt(7, q.getRefSno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
