package com.kh.survey.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.survey.model.service.SurveyService;
import com.kh.survey.model.vo.Answer;
import com.kh.survey.model.vo.Question;
import com.kh.survey.model.vo.Survey;

/**
 * Servlet implementation class SurveyResultController
 */
@WebServlet("/answerResult.su")
public class SurveyResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SurveyResultController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sno = Integer.parseInt(request.getParameter("sno"));
		
		SurveyService service = new SurveyService();
		
		Survey survey = service.selectSurvey(sno);
		Question question = service.selectQuestion(sno);
		ArrayList<Answer> answer = service.selectAnswer(question.getQuesNo());
		if(answer.size() != 0) {
			request.setAttribute("survey", survey);
			request.setAttribute("question", question);
			request.setAttribute("answer", answer);
			request.getRequestDispatcher("views/survey/surveyAnswerResult.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "답안이 작성되지 않았습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
