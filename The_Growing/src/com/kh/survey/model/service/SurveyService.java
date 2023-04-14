package com.kh.survey.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.survey.model.dao.SurveyDao;
import com.kh.survey.model.vo.Answer;
import com.kh.survey.model.vo.Question;
import com.kh.survey.model.vo.Survey;

public class SurveyService {
	public int insertSurvey(Survey survey) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new SurveyDao().insertSurvey(conn, survey);
		
		if(result > 0) { // 성공
			
			commit(conn);
		}else { 
			rollback(conn);
		}
		
		close(conn);
		
	
		return result;
	}
	
	public Survey selectSurvey(int sno) {
		 Connection conn = getConnection();

	      Survey survey = new SurveyDao().selectSurvey(conn, sno);

	      close(conn);

	      return survey;
	}
	
	public Survey selectSurvey(String surveyTitle, Date fDate, int cno) {
		 Connection conn = getConnection();

	      Survey survey = new SurveyDao().selectSurvey(conn, surveyTitle, fDate, cno);

	      close(conn);

	      return survey;
	}
	
	public int updateSurveyStatus(int sno) {
		
		Connection conn = getConnection();
		
		int result = new SurveyDao().updateSurveyStatus(conn, sno);
		
		if(result > 0) { // 성공
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result;
	}
	
	public int insertQuestion(Question ques) {
		Connection conn = getConnection();
		
		int result = new SurveyDao().insertQuestion(conn, ques);
		
		if(result > 0) { // 성공
			
			commit(conn);
		}else { 
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public ArrayList<Survey> selectSurveyList(int cno){
		
		Connection conn = getConnection();

		ArrayList<Survey> surveyList = new SurveyDao().selectSurveyList(conn, cno);

		close(conn);

		return surveyList;

	}
	
	public Question selectQuestion(int sno) {
		 Connection conn = getConnection();

		 Question question = new SurveyDao().selectQuestion(conn, sno);

	      close(conn);

	      return question;
	}
	
	public int insertAnswer(Answer ans) {
		Connection conn = getConnection();
		
		int result1 = new SurveyDao().insertAnswer(conn, ans);
		int result2 = new SurveyDao().updateSurveyCount(conn,ans.getRefQno());
		
		if(result1*result2 > 0) { // 성공
			
			commit(conn);
		}else { 
			rollback(conn);
		}
		
		close(conn);
		return result1;
	}
	
	public ArrayList<Answer> selectAnswer(int qno) {
		 Connection conn = getConnection();

		 ArrayList<Answer> answer = new SurveyDao().selectAnswer(conn, qno);

	      close(conn);

	      return answer;
	}
	
	public boolean isAnswered(int uno, int qno) {
		Connection conn = getConnection();
		
		boolean isAnswered = new SurveyDao().isAnswered(conn,uno,qno);
		
		close(conn);
		
		return isAnswered;
	}
	
	public int updateSurvey(Survey s) {
		
		Connection conn = getConnection();
		
		int result = new SurveyDao().updateSurvey(conn, s);
		
		if(result > 0) { // 성공
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result;
	}
	
	public int updateQuestion(Question q) {
		
		Connection conn = getConnection();
		
		int result = new SurveyDao().updateQuestion(conn, q);
		
		if(result > 0) { // 성공
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result;
	}
}
