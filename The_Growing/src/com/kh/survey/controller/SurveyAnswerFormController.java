package com.kh.survey.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.survey.model.service.SurveyService;
import com.kh.survey.model.vo.Answer;
import com.kh.survey.model.vo.Question;
import com.kh.survey.model.vo.Survey;

/**
 * Servlet implementation class SurveyAnswerFormController
 */
@WebServlet("/answer.su")
public class SurveyAnswerFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SurveyAnswerFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sno = Integer.parseInt(request.getParameter("sno"));
		
		Survey survey = new SurveyService().selectSurvey(sno);
		Question question = new SurveyService().selectQuestion(sno);
		request.setAttribute("survey", survey);
		request.setAttribute("question", question);
		
		request.getRequestDispatcher("views/survey/surveyAnswerForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int uno = loginUser.getUserNo();
		int qno = Integer.parseInt(request.getParameter("qNo"));
		
		boolean isAnswered = new SurveyService().isAnswered(uno,qno);
		
		if(isAnswered) {
			request.setAttribute("errorMsg", "이미 작성하신 설문입니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}else {
			String[] mNo = request.getParameterValues("mNo");
			String[] writeAns = request.getParameterValues("sContent");
			String[] itemAns = new String[mNo.length];
			
			for(int i = 0; i < mNo.length; i++) {
				itemAns[i] = request.getParameter("mCheck"+i);
			}
			
			Answer ans = new Answer(qno, uno, writeAns, itemAns);
			int result = new SurveyService().insertAnswer(ans);

			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "답안 작성 성공");
				response.sendRedirect(request.getContextPath()+"/list.su");
			}else {
				request.setAttribute("errorMsg", "답안 작성 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
		
	}

}
