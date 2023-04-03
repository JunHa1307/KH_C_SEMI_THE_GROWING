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
	
	public Survey selectSurvey(String surveyTitle, Date fDate, int cno) {
		 Connection conn = getConnection();

	      Survey survey = new SurveyDao().selectSurvey(conn, surveyTitle, fDate, cno);

	      close(conn);

	      return survey;
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
}
